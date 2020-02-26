package com.nr.springboot.repository;

import java.util.List;

import com.nr.springboot.model.clientservice.ClientService;
import com.nr.springboot.model.clientservice.dto.ReqUpdateDto;
import com.nr.springboot.model.clientservice.dto.ReqWriteDto;
import com.nr.springboot.model.clientservice.dto.RespListDto;

public interface ClientServiceRepository {

	public int save(ReqWriteDto dto);
	
	public List<RespListDto> findAll();
	
	public ClientService findById(int id);
	
	public int delete(int id);
	
	public int update(ReqUpdateDto dto);
}
