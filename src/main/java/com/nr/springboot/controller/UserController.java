package com.nr.springboot.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nr.springboot.model.RespCM;
import com.nr.springboot.model.ReturnCode;
import com.nr.springboot.model.user.User;
import com.nr.springboot.model.user.dto.ReqJoinDto;
import com.nr.springboot.model.user.dto.ReqLoginDto;
import com.nr.springboot.script.Script;
import com.nr.springboot.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;

	@Value("${file.path}")
	private String fileRealPath;

	@GetMapping("/user/join")
	public String join() {
		return "/user/join";
	}

	@GetMapping("/user/login")
	public String login() {
		return "/user/login";
	}

	@GetMapping("/user/logout")
	public String logout() {
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/user/profile/{id}")
	public String profile(@PathVariable int id) {
		User principal = (User) session.getAttribute("principal");

		if (principal.getId() == id) {
			return "/user/profile";
		} else {
			return "/";
		}
	}

	@PostMapping("/user/join")
	public ResponseEntity<?> join(@Valid @RequestBody ReqJoinDto dto, BindingResult bindingResult) {

		System.out.println("유저 컨트롤러 진입");
		System.out.println("username" + dto.getUsername());
		System.out.println("password" + dto.getPassword());
		System.out.println("email" + dto.getEmail());
		
		
		if (bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();

			System.out.println("유저 컨트롤러의 바인딩 리절트 진입");
			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			System.out.println("배드 리퀘스트");
			return new ResponseEntity<Map<String, String>>(errorMap, HttpStatus.BAD_REQUEST);
		}

		int result = userService.회원가입(dto);

		if (result == -2) {
			System.out.println("유저 컨트롤러 아이디 중복");
			System.out.println("===========================================");
			return new ResponseEntity<RespCM>(new RespCM(ReturnCode.아이디중복, "아이디중복"), HttpStatus.OK);
		} else if (result == 1) {
			System.out.println("유저 컨트롤러 아이디 성공");
			System.out.println("===========================================");
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			System.out.println("유저 컨트롤러 아이디 실패");
			System.out.println("===========================================");
			return new ResponseEntity<RespCM>(new RespCM(500, "fail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/user/login")
	public ResponseEntity<?> login(@Valid @RequestBody ReqLoginDto dto, BindingResult bindingResult) {
		System.out.println("유저 컨트롤러 진입");
		User principal = userService.로그인(dto);
		
		if (principal != null) {
			session.setAttribute("principal", principal);
			System.out.println("유저 컨트롤러 로그인 성공");

			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			System.out.println("로그인 진입 - fail");
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@PutMapping("/user/profile")
	public @ResponseBody String profile(@RequestParam int id, @RequestParam String password,
			@RequestParam String gender, @RequestParam MultipartFile profile) {

		UUID uuid = UUID.randomUUID();
		String uuidFilename = uuid + "_" + profile.getOriginalFilename();

		Path filePath = Paths.get(fileRealPath + uuidFilename);
		try {
			Files.write(filePath, profile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}

		int result = userService.수정(id, password, gender, uuidFilename);

		if (result == 1) {
			return Script.href("수정 성공", "/");
		} else {
			return Script.back("수정 실패");
		}

	}
}