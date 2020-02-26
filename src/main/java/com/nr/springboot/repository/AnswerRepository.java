package com.nr.springboot.repository;

import java.util.List;

import com.nr.springboot.model.answer.dto.ReqAnswerDto;
import com.nr.springboot.model.answer.dto.RespAnswerDto;

public interface AnswerRepository {

	public int save(ReqAnswerDto dto);
	
	public RespAnswerDto findById(int id);
	
	public int delete(int id);
	
	public List<RespAnswerDto> findByClientServiceId(int clientServiceId);
}
