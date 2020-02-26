package com.nr.springboot.model.clientservice;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ClientService {

	public int id;
	public String title;
	public String content;
	public int userId;
	public Timestamp createDate;
	
	@Builder
	public ClientService(String title, String content, int userId) {
		this.title = title;
		this.content = content;
		this.userId = userId;
	}
}
