package com.ssafy.happyhouse.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.dto.QnaBoardDto;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.BoardService;
import com.ssafy.util.PageNavigation;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService guestBookService;
	////////////////////////////공지사항 처리///////////////////////////////////
	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public String noticewrite() {
		return "board/noticewrite";
	}

	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewrite(BoardDto guestBookDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			guestBookDto.setUserid(memberDto.getUserid());
			try {
				guestBookService.writenoticeArticle(guestBookDto);
				return "board/noticewritesuccess";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "공지사항 글 작성중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/noticelist", method = RequestMethod.GET)
	public String noticelist(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {																			
			List<BoardDto> list = guestBookService.listnoticeArticle(map);
			PageNavigation pageNavigation = guestBookService.notice_makePageNavigation(map);
			model.addAttribute("articles", list);
			model.addAttribute("navigation", pageNavigation);
			return "board/noticelist";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "공지사항 목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	public String noticedetail(@RequestParam int articleno, Model model) {
		try {																			
			BoardDto article = guestBookService.getnoticeArticle(articleno);
			model.addAttribute("article", article);
			return "board/noticedetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "공지사항 게시글을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/noticemodify", method = RequestMethod.GET)
	public String noticemodify(@RequestParam("articleno") int articleno, Model model) {
		try {
			BoardDto guestBookDto = guestBookService.getnoticeArticle(articleno);
			model.addAttribute("article", guestBookDto);
			return "board/noticemodify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "공지사항 수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticemodify(BoardDto guestBookDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			guestBookDto.setUserid(memberDto.getUserid());
			try {
				guestBookService.modifynoticeArticle(guestBookDto);
				return "board/noticewritesuccess";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "공지사항 수정중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/noticedelete", method = RequestMethod.GET)
	public String noticedelete(@RequestParam("articleno") int articleno, Model model) {
		try {
			guestBookService.deletenoticeArticle(articleno);
			return "redirect:noticelist?pg=1&key=&word=";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	////////////////////////////공지사항 처리///////////////////////////////////
	
	////////////////////////////qna 처리///////////////////////////////////
	@RequestMapping(value = "/qnawrite", method = RequestMethod.GET)
	public String qnawrite() {
		return "board/qnawrite";
	}

	@RequestMapping(value = "/qnawrite", method = RequestMethod.POST)
	public String qnawrite(QnaBoardDto guestBookDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			guestBookDto.setUserid(memberDto.getUserid());
			try {
				guestBookService.writeqnaArticle(guestBookDto);
				return "board/qnawritesuccess";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "QnA 글 작성중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/qnalist", method = RequestMethod.GET)
	public String qnalist(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {																			
			List<QnaBoardDto> list = guestBookService.listqnaArticle(map);
			PageNavigation pageNavigation = guestBookService.qna_makePageNavigation(map);
			model.addAttribute("articles", list);
			model.addAttribute("navigation", pageNavigation);
			return "board/qnalist";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "QnA 목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/qnadetail", method = RequestMethod.GET)
	public String qnadetail(@RequestParam int articleno, Model model) {
		try {																			
			QnaBoardDto article = guestBookService.getqnaArticle(articleno);
			model.addAttribute("article", article);
			return "board/qnadetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "QnA 게시글을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/qnamodify", method = RequestMethod.GET)
	public String qnamodify(@RequestParam("articleno") int articleno, Model model) {
		try {
			QnaBoardDto guestBookDto = guestBookService.getqnaArticle(articleno);
			model.addAttribute("article", guestBookDto);
			return "board/qnamodify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "QnA 수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/qnamodify", method = RequestMethod.POST)
	public String qnamodify(QnaBoardDto guestBookDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			guestBookDto.setUserid(memberDto.getUserid());
			try {
				guestBookService.modifyqnaArticle(guestBookDto);
				return "board/qnawritesuccess";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "QnA 글 수정중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/qnaanswer", method = RequestMethod.GET)
	public String qnaanswer(@RequestParam("articleno") int articleno, Model model) {
		try {
			QnaBoardDto guestBookDto = guestBookService.getqnaArticle(articleno);
			model.addAttribute("article", guestBookDto);
			return "board/qnaanswer";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "QnA 답변 관리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/qnaanswer", method = RequestMethod.POST)
	public String qnaanswer(QnaBoardDto guestBookDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto.getUserid().equals("admin")) {
			try {
				guestBookService.answerqnaArticle(guestBookDto);
				//return "board/qnadetail?articleno="+guestBookDto.getArticleno();
				return "redirect:qnadetail?articleno="+guestBookDto.getArticleno();
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "QnA 답변 작성 중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}

	@RequestMapping(value = "/qnadelete", method = RequestMethod.GET)
	public String qnadelete(@RequestParam("articleno") int articleno, Model model) {
		try {
			guestBookService.deleteqnaArticle(articleno);
			return "redirect:qnalist?pg=1&key=&word=";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	////////////////////////////qna 처리///////////////////////////////////
	
	//test//
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "/index_temp";
	}

}
