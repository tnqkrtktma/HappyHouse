package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.HouseMapService;
import com.ssafy.happyhouse.model.service.HouseService;

@Controller
@RequestMapping("/article")
public class HouseController {

	@Autowired
	private HouseMapService houseMapService;

	@RequestMapping(value = "/searchAll", method = RequestMethod.GET)
	public String searchall(@RequestParam Map<String, String> map, Model model) {
		try {
			return "front/transaction";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	@RequestMapping(value = "/aptRent", method = RequestMethod.GET)
	public String aptRent(Model model) {
		try {
			return "front/aptRent";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	@RequestMapping(value = "/aptTrade", method = RequestMethod.GET)
	public String aptTrade(Model model) {
		try {
			return "front/aptTrade";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	@RequestMapping(value = "/houseRent", method = RequestMethod.GET)
	public String houseRent(Model model) {
		try {
			return "front/houseRent";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	@RequestMapping(value = "/houseTrade", method = RequestMethod.GET)
	public String houseTrade(Model model) {
		try {
			return "front/houseTrade";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String datail(Model model ,@RequestParam String sido,@RequestParam String gugun,@RequestParam String dong,@RequestParam String name,@RequestParam String no,@RequestParam int type) {
		try {
			model.addAttribute("sido", sido);
			model.addAttribute("gugun", gugun);
			model.addAttribute("dong", dong);
			model.addAttribute("name", name);
			model.addAttribute("no", no);
			model.addAttribute("type", type);
			return "front/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
}