package com.nr.springboot.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nr.springboot.model.ReturnCode;
import com.nr.springboot.model.clientservice.ClientService;
import com.nr.springboot.model.clientservice.dto.ReqUpdateDto;
import com.nr.springboot.model.clientservice.dto.ReqWriteDto;
import com.nr.springboot.model.clientservice.dto.RespListDto;
import com.nr.springboot.model.user.User;
import com.nr.springboot.repository.ClientServiceRepository;

@Service
public class ClientServiceService {

	@Autowired
	private ClientServiceRepository clientServiceRepository;

	@Autowired
	private HttpSession session;

	public int 글쓰기(ReqWriteDto dto) {
		return clientServiceRepository.save(dto);
	}

	public List<RespListDto> 목록보기() {
		return clientServiceRepository.findAll();
	}

	public ClientService 상세보기(int id) {
		System.out.println("cs 상세보기 서비스 진입");
		return clientServiceRepository.findById(id);
	}

	public ClientService 수정(int id) {
		System.out.println("cs 수정 서비스 진입");
		User principal = (User) session.getAttribute("principal");
		ClientService cs = clientServiceRepository.findById(id);

		if (principal.getId() == cs.getUserId()) {
			return cs;
		} else {
			return null;
		}
	}

	public int 수정완료(ReqUpdateDto dto) {
		User principal = (User) session.getAttribute("principal");
		ClientService cs = clientServiceRepository.findById(dto.getId());
		
		if(principal.getId() == cs.getUserId()) {
			return clientServiceRepository.update(dto);
		}else {
			return ReturnCode.권한없음;
		}
	}
	
	public int 삭제(int id) {
		User principal = (User) session.getAttribute("principal");
		ClientService cs = clientServiceRepository.findById(id);
		
		if(principal.getId() == cs.getUserId()) {
			return clientServiceRepository.delete(id);
		}else {
			return ReturnCode.권한없음;
		}
	}
}
