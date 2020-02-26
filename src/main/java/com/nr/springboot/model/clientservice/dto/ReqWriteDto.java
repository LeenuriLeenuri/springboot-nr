package com.nr.springboot.model.clientservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqWriteDto {

	private String title;
	private String content;
	private int userId;
}
