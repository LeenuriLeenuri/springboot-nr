package com.nr.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.nr.springboot.model.RespCM;
import com.nr.springboot.model.answer.dto.ReqAnswerDto;
import com.nr.springboot.model.answer.dto.RespAnswerDto;
import com.nr.springboot.service.AnswerService;

@RestController
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
	@PostMapping("/answer/answerPost")
	public ResponseEntity<?> answerPost(@RequestBody ReqAnswerDto dto){
		RespAnswerDto answer = answerService.댓글쓰기(dto);
		
		if(answer != null) {
			answer.setStatus(new RespCM(200, "ok"));
			return new ResponseEntity<RespAnswerDto>(answer, HttpStatus.OK);
		}else {
			RespAnswerDto error = new RespAnswerDto();
			error.setStatus(new RespCM(400, "fail"));
			return new ResponseEntity<RespAnswerDto>(error, HttpStatus.BAD_REQUEST);
		}	
	}
	
	@DeleteMapping("/answer/answerDelete/{id}")
	public ResponseEntity<?> delete(@PathVariable int id){
		int result = answerService.삭제(id);
		
		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		}else if(result == -3) {
			return new ResponseEntity<RespCM>(new RespCM(403, "fail"), HttpStatus.FORBIDDEN);
		}else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
}
