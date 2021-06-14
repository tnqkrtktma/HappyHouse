package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.dto.QnaBoardDto;
import com.ssafy.util.PageNavigation;

public interface BoardService {

	//notice
	public void writenoticeArticle(BoardDto guestBookDto) throws Exception;
	public List<BoardDto> listnoticeArticle(Map<String, String> map) throws Exception;
	public BoardDto getnoticeArticle(int articleno) throws Exception;
	public void modifynoticeArticle(BoardDto guestBookDto) throws Exception;
	public void deletenoticeArticle(int articleno) throws Exception;
	
	public PageNavigation notice_makePageNavigation(Map<String, String> map) throws Exception;
	
	
	//qna
	public void writeqnaArticle(QnaBoardDto guestBookDto) throws Exception;
	public List<QnaBoardDto> listqnaArticle(Map<String, String> map) throws Exception;
	public QnaBoardDto getqnaArticle(int articleno) throws Exception;
	public void modifyqnaArticle(QnaBoardDto guestBookDto) throws Exception;
	public void answerqnaArticle(QnaBoardDto guestBookDto) throws Exception;
	public void deleteqnaArticle(int articleno) throws Exception;
	
	
	public PageNavigation qna_makePageNavigation(Map<String, String> map) throws Exception;
}
