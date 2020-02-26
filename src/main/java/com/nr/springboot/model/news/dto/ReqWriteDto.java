package com.nr.springboot.model.news.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqWriteDto {

	public String title;
	public String summary;
	public String content;
	public String picture;
	public int userId;
}