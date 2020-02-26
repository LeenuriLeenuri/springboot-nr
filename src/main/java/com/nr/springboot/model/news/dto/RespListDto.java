package com.nr.springboot.model.news.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespListDto {

	public int id;
	public String title;
	public String summary;
	public String content;
	public String picture;
	public int userId;
	public Timestamp createDate;
}
