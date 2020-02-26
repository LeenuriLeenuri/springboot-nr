package com.nr.springboot.model.news;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class News {

	public int id;
	public String title;
	public String summary;
	public String content;
	public String picture;
	public int userId;
	public Timestamp createDate;
	
	@Builder
	public News(String title, String summary, String content, String picture, int userId, Timestamp createDate) {
		this.title = title;
		this.summary = summary;
		this.content = content;
		this.picture = picture;
		this.userId = userId;
		this.createDate = createDate;
	}	
}
