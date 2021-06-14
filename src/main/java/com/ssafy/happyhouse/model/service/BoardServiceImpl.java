package com.ssafy.happyhouse.model.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.dto.QnaBoardDto;
import com.ssafy.happyhouse.model.mapper.BoardMapper;
import com.ssafy.util.PageNavigation;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper dao;


	//notice
	@Override
	public void writenoticeArticle(BoardDto guestBookDto) throws Exception {
		if(guestBookDto.getSubject() == null || guestBookDto.getContent() == null) {
			throw new Exception();
		}
		dao.writenoticeArticle(guestBookDto);
	}

	@Override
	public List<BoardDto> listnoticeArticle(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();			
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));	
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));	
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return dao.listnoticeArticle(param);
	}

	@Override
	public BoardDto getnoticeArticle(int articleno) throws Exception {
		return dao.getnoticeArticle(articleno);
	}

	@Override
	public void modifynoticeArticle(BoardDto guestBookDto) throws Exception {
		dao.modifynoticeArticle(guestBookDto);
	}

	@Override
	public void deletenoticeArticle(int articleno) throws Exception {
		dao.deletenoticeArticle(articleno);
	}
	
	@Override
	public PageNavigation notice_makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.notice_getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}



	//qna
	@Override
	public void writeqnaArticle(QnaBoardDto guestBookDto) throws Exception {
		if(guestBookDto.getSubject() == null || guestBookDto.getContent() == null) {
			throw new Exception();
		}
		dao.writeqnaArticle(guestBookDto);
	}

	@Override
	public List<QnaBoardDto> listqnaArticle(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();			
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));	
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));	
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return dao.listqnaArticle(param);
	}

	@Override
	public QnaBoardDto getqnaArticle(int articleno) throws Exception {
		return dao.getqnaArticle(articleno);
	}

	@Override
	public void modifyqnaArticle(QnaBoardDto guestBookDto) throws Exception {
		dao.modifyqnaArticle(guestBookDto);
	}
	
	@Override
	public void answerqnaArticle(QnaBoardDto guestBookDto) throws Exception {
		dao.answerqnaArticle(guestBookDto);
	}

	@Override
	public void deleteqnaArticle(int articleno) throws Exception {
		dao.deleteqnaArticle(articleno);
	}

	@Override
	public PageNavigation qna_makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.qna_getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
