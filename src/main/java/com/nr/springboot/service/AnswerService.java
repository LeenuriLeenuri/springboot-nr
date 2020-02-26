package com.nr.springboot.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nr.springboot.model.ReturnCode;
import com.nr.springboot.model.answer.dto.ReqAnswerDto;
import com.nr.springboot.model.answer.dto.RespAnswerDto;
import com.nr.springboot.model.user.User;
import com.nr.springboot.repository.AnswerRepository;
import com.nr.springboot.repository.UserRepository;

@Service
public class AnswerService {

	@Autowired
	private AnswerRepository answerRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private HttpSession session;

	public List<RespAnswerDto> 목록보기(int clientServiceId) {

		List<RespAnswerDto> list = answerRepository.findByClientServiceId(clientServiceId);
		for (int i = 0; i < list.size(); i++) {
			RespAnswerDto dto = list.get(i);
			
			int userId = dto.getUserId();
			User user = userRepository.findById(userId);
			dto.setProfile(user.getProfile());
		}
		return list;
	}

	public RespAnswerDto 댓글쓰기(ReqAnswerDto dto) {
		int result = answerRepository.save(dto);

		if (result == 1) {
			return answerRepository.findById(dto.getId());
		} else {
			return null;
		}
	}

	public int 삭제(int id) {
		RespAnswerDto answer = answerRepository.findById(id);

		User principal = (User) session.getAttribute("principal");

		if (answer.getUserId() == principal.getId()) {
			return answerRepository.delete(id);
		} else {
			return ReturnCode.권한없음;
		}
	}
}
