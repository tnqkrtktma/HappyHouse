package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;

public interface HouseMapService {

	public List<SidoGugunCodeDto> getSido() throws Exception;

	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;

	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;

	public List<HouseInfoDto> getAptInDong(String dong) throws Exception;

	public List<HouseDeal> getAptDeals(String dong, String aptName) throws Exception;

	public List<HouseInfoDto> findAptname(String sido, String gugun, String dong, String name) throws Exception;
	
	public List<HouseDeal> show(String no) throws Exception;
}
