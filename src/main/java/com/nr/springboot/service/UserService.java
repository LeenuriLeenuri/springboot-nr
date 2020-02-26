package com.nr.springboot.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nr.springboot.model.ReturnCode;
import com.nr.springboot.model.user.User;
import com.nr.springboot.model.user.dto.ReqJoinDto;
import com.nr.springboot.model.user.dto.ReqLoginDto;
import com.nr.springboot.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HttpSession session;
	
	@Transactional
	public int 회원가입(ReqJoinDto dto) {
		
		try {
			int result = userRepository.findByUsername(dto.getUsername());
			System.out.println("유저 서비스 진입");
			
			if (result == 1) {
				System.out.println("유저 서비스 아이디 중복");
				return ReturnCode.아이디중복;
			}else {
				System.out.println("유저 서비스 아이디 성공");
				return userRepository.save(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	public User 로그인(ReqLoginDto dto) {
		System.out.println("유저 서비스 진입");
		return userRepository.findByUsernameAndPassword(dto);
	}
	
	public int 수정(int id, String password, String gender, String profile) {
		
		int result = userRepository.update(id, password, gender, profile);
		
		if(result == 1) {
			User user = userRepository.findById(id);
			session.setAttribute("principal", user);
			
			return 1;
		}else {
			return -1;
		}
	}
}