package com.nr.springboot.model.answer;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Answer {

	private int id;
	private int userId;
	private int clientServiceId;
	private String content;
	private Timestamp createDate;
	
	@Builder
	public Answer(int userId, int clientServiceId, String content) {
		super();
		this.userId = userId;
		this.clientServiceId = clientServiceId;
		this.content = content;
	}
}
