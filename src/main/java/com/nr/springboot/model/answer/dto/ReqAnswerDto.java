package com.nr.springboot.model.answer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqAnswerDto {

	private int id;
	private int userId;
	private int clientServiceId;
	private String content;
}
