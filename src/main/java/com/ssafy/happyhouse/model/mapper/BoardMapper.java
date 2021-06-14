package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.dto.QnaBoardDto;

@Mapper
public interface BoardMapper {

	//notice
	public void writenoticeArticle(BoardDto guestBookDto) throws SQLException;
	public List<BoardDto> listnoticeArticle(Map<String, Object> map) throws SQLException;
	public BoardDto getnoticeArticle(int articleno) throws SQLException;
	public void modifynoticeArticle(BoardDto guestBookDto) throws SQLException;
	public void deletenoticeArticle(int articleno) throws SQLException;
	public int notice_getTotalCount(Map<String, String> map) throws SQLException;

	//qna
	public void writeqnaArticle(QnaBoardDto guestBookDto) throws SQLException;
	public List<QnaBoardDto> listqnaArticle(Map<String, Object> map) throws SQLException;
	public QnaBoardDto getqnaArticle(int articleno) throws SQLException;
	public void modifyqnaArticle(QnaBoardDto guestBookDto) throws SQLException;
	public void answerqnaArticle(QnaBoardDto guestBookDto) throws SQLException;
	public void deleteqnaArticle(int articleno) throws SQLException;
	public int qna_getTotalCount(Map<String, String> map) throws SQLException;
}
