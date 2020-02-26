package com.nr.springboot.repository;

import java.util.List;

import com.nr.springboot.model.news.News;
import com.nr.springboot.model.news.dto.ReqUpdateDto;
import com.nr.springboot.model.news.dto.RespListDto;

public interface NewsRepository {

	int save(String title, String summary, String content, String picture, int userId);

	List<RespListDto> findAll();

	News findById(int id);

	int update(ReqUpdateDto dto);

	int delete(int id);
}
