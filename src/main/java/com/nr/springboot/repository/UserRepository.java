package com.nr.springboot.repository;

import com.nr.springboot.model.user.User;
import com.nr.springboot.model.user.dto.ReqJoinDto;
import com.nr.springboot.model.user.dto.ReqLoginDto;

public interface UserRepository {

	int save(ReqJoinDto dto);
	
	int findByUsername(String username);
	
	User findByUsernameAndPassword(ReqLoginDto dto);
	
	int update(int id, String password, String gender, String profile);
	
	User findById(int id);
}
