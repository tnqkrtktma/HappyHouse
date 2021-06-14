package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;

public interface HouseService {
	public List<HouseDeal> searchAll(int type, String dong) throws Exception;

	public List<HouseDeal> searchAllfind(String sido, String gugun, String dong, String name, int type)
			throws Exception;

	public HouseDeal search(int no) throws Exception;

}
