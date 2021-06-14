package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.LoginService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private LoginService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				response.addCookie(cookie);
				return "index";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/user/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDto memberDto, Model model, HttpSession session) {

		try {
			userService.insertUser(memberDto);
			//model.addAttribute("mname", memberDto.getUsername());
			return "/login";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 등록 중 문제가 발생했습니다.");
			return "error/error";
		}

	}

	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public String change(@RequestParam("userid") String userid, Model model) throws Exception {
		model.addAttribute("userinfo", userService.memberDetail(userid));
		return "/user/infochange";
	}

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public String change(MemberDto memberDto, Model model, HttpSession session) {
		System.out.println("change.................");
		System.out.println(memberDto);
		try {
			userService.changeUser(memberDto);
			model.addAttribute("userinfo", userService.memberDetail(memberDto.getUserid()));
			return "/user/infochange";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 정보 수정 중 문제가 발생했습니다.");
			return "error/error";
		}

	}



	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("userid") String userid, Model model, HttpSession session) {
		try {
			userService.DeleteUser(userid);
			session.invalidate();
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 탈퇴 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}


	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public String memberlist(@RequestParam("userid") String userid, Model model) throws Exception {
		if(!userid.equals("admin")) {
			return "/";
		}
		model.addAttribute("memberlist", userService.memberListall());
		return "/user/memberlist";
	}

	@RequestMapping(value = "/memberlistsearch", method = RequestMethod.GET)
	public String memberlistsearch(@RequestParam("searchid") String searchid, Model model) throws Exception {
		String sqlword = "%"+searchid+"%";
		model.addAttribute("memberlist", userService.memberList(sqlword));
		model.addAttribute("searchid", searchid);
		return "/user/memberlist";

	}

}
