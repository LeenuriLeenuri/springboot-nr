package com.nr.springboot.model.answer.dto;

import java.sql.Timestamp;

import com.nr.springboot.model.RespCM;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespAnswerDto {

	private RespCM status;
	private int id;
	private int userId;
	private int clientServiceId;
	private String content;
	private Timestamp createDate;
	private String username;
	private String profile;
}
