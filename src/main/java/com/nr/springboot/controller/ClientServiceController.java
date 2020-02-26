package com.nr.springboot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.nr.springboot.model.RespCM;
import com.nr.springboot.model.clientservice.dto.ReqUpdateDto;
import com.nr.springboot.model.clientservice.dto.ReqWriteDto;
import com.nr.springboot.model.user.User;
import com.nr.springboot.service.AnswerService;
import com.nr.springboot.service.ClientServiceService;

@Controller
public class ClientServiceController {

	@Autowired
	private ClientServiceService csService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AnswerService answerService;
	
	@GetMapping("/clientservice/clientservice")
	public String cs(Model model) {
		model.addAttribute("clientservice", csService.목록보기());
		
		return "/clientservice/clientservice";
	}
	
	@GetMapping("/clientservice/{id}")
	public String csDetail() {
		System.out.println("cs 디테일 진입");
		return "/clientservice/clientserviceDetail";
	}
	
	@GetMapping("/clientservice/clientservicePost")
	public String csPost() {
		return "/clientservice/clientservicePost";
	}
	
	@GetMapping("/clientservice/clientserviceUpdate/{id}")
	public String csUpdate(@PathVariable int id, Model model) {
		System.out.println("cs 업데이트 진입");
		model.addAttribute("clientservice", csService.수정(id));

		return "/clientservice/clientserviceUpdate";
	}
	
	@GetMapping("/clientservice/clientserviceDetail/{id}")
	public String csDetail(@PathVariable int id, Model model) {
		model.addAttribute("clientservice", csService.상세보기(id));
		
		model.addAttribute("answer", answerService.목록보기(id));
		
		return "/clientservice/clientserviceDetail";
	}
	
	
	@PostMapping("/clientservice/clientservicePost")
	public ResponseEntity<?> csPost(@RequestBody ReqWriteDto dto){
		
		User principal = (User) session.getAttribute("principal");
		dto.setUserId(principal.getId());
		
		int result = csService.글쓰기(dto);
		
		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	

	@PutMapping("/clientservice/clientserviceUpdate")
	public ResponseEntity<?> csUpdate(@RequestBody ReqUpdateDto dto){
		int result = csService.수정완료(dto);
		
		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	
	@DeleteMapping("/clientservice/clientserviceDelete/{id}")
	public ResponseEntity<?> delete(@PathVariable int id){
		int result = csService.삭제(id);
		
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else if (result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
}
