package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;

@Mapper
public interface HouseMapDao {

	public List<SidoGugunCodeDto> getSido() throws SQLException;

	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws SQLException;

	public List<HouseInfoDto> getDongInGugun(String gugun) throws SQLException;

	public List<HouseInfoDto> getAptInDong(String dong) throws SQLException;

	public List<HouseDeal> getAptDeals(String dong, String aptName) throws SQLException;

	public List<HouseInfoDto> findAptnameall(String name)throws SQLException;
	
	public List<HouseInfoDto> findAptnamesido(String sido, String name)throws SQLException;
	
	public List<HouseInfoDto> findAptnamegugun(String gugun,String name)throws SQLException;

	public List<HouseInfoDto> findAptnamedong(String dong,String name)throws SQLException;
	
	public List<HouseDeal> show(String no) throws SQLException;
}
