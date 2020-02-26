package com.nr.springboot.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nr.springboot.model.ReturnCode;
import com.nr.springboot.model.news.News;
import com.nr.springboot.model.news.dto.ReqUpdateDto;
import com.nr.springboot.model.news.dto.RespListDto;
import com.nr.springboot.model.user.User;
import com.nr.springboot.repository.NewsRepository;

@Service
public class NewsService {

	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private HttpSession session;
	
	public int 글쓰기(String title, String summary, String content, String picture, int userId) {
		System.out.println("뉴스 서비스 글쓰기 진입");
		return newsRepository.save(title, summary, content, picture, userId);
	}
	
	public List<RespListDto> 목록보기(){
		return newsRepository.findAll();
	}
	
	public News 상세보기(int id) {
		return newsRepository.findById(id);
	}
	
	public News 수정(int id) {
		User principal = (User) session.getAttribute("principal");
		News news = newsRepository.findById(id);
		
		if(principal.getId() == news.getUserId()) {
			return news;
		}else {
			return null;
		}
	}
	
	public int 수정완료(ReqUpdateDto dto) {
		User principal = (User) session.getAttribute("principal");
		
		News news = newsRepository.findById(dto.getId());
		
		if(principal.getId() == news.getUserId()) {
			return newsRepository.update(dto);
		}else {
			return ReturnCode.권한없음;
			}
	}
	
	public int 삭제(int id) {
		User principal = (User) session.getAttribute("principal");
		News news = newsRepository.findById(id);
		
		if(principal.getId() == news.getUserId()) {
			return newsRepository.delete(id);
		}else {
			return ReturnCode.권한없음;
		}
	}
}
