package com.nr.springboot.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nr.springboot.model.RespCM;
import com.nr.springboot.model.news.dto.ReqUpdateDto;
import com.nr.springboot.script.Script;
import com.nr.springboot.service.NewsService;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;

//	@Autowired
//	private HttpSession session;
	
	@Value("${file.path}")
	private String fileRealPath;

	@GetMapping("/news/news")
	public String news(Model model) {
		model.addAttribute("news", newsService.목록보기());

		return "/news/news";
	}

	@GetMapping("/news/{id}")
	public String newsDetail() {
		return "/news/newsDetail";
	}

	@GetMapping("/news/newsPost")
	public String newsPost() {
		return "/news/newsPost";
	}

	@GetMapping("/news/newsUpdate/{id}")
	public String newsUpdate(@PathVariable int id, Model model) {
		model.addAttribute("news", newsService.수정(id));

		return "/news/newsUpdate";
	}
	
	@GetMapping("/news/newsDetail/{id}")
	public String newsDetail(@PathVariable int id, Model model) {
		model.addAttribute("news", newsService.상세보기(id));
		
		return "/news/newsDetail";
	}

	@PostMapping("/news/newsPost")
	public @ResponseBody String newsPost(
			@RequestParam String title,
			@RequestParam String summary,
			@RequestParam String content,
			@RequestParam MultipartFile picture,
			@RequestParam int userId) {
	//public @ResponseBody String newsPost(@ModelAttribute("dto") ReqWriteDto dto, @RequestParam(value="file", required =false, defaultValue = "defaultFile") MultipartFile picture) {
	System.out.println("뉴스 컨트롤러 진입");
	System.out.println("title:" + title);
	System.out.println("summary:" + summary);
	System.out.println("content:" + content);
	System.out.println("picture:" + picture);
	System.out.println("userId:" + userId);
		
		UUID uuid = UUID.randomUUID();
		String uuidFilename = uuid + "_" + picture.getOriginalFilename();
		
		Path filePath = Paths.get(fileRealPath + uuidFilename);
		try {
			Files.write(filePath, picture.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
////		User principal = (User) session.getAttribute("principal");
		
		int result = newsService.글쓰기(title, summary, content, uuidFilename, userId);
			
		if(result == 1) {
			return Script.href("글 쓰기 성공", "/news/news");
		}else {
			return Script.back("글쓰기 실패");
		}
//		if (result == 1) {
//			System.out.println("뉴스 글쓰기 성공");
//			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
//		} else {
//			System.out.println("뉴스 글쓰기 실패");
//			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
//		}
	}

	@PutMapping("/news/newsUpdate")
	public ResponseEntity<?> newsUpdate(@RequestBody ReqUpdateDto dto) {
		int result = newsService.수정완료(dto);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@DeleteMapping("/news/newsDelete/{id}")
	public ResponseEntity<?> delete(@PathVariable int id) {
		int result = newsService.삭제(id);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
}
