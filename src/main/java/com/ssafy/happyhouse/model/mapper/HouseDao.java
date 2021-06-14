package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;

@Mapper
public interface HouseDao {
	public List<HouseDeal> searchAll24(String dong) throws SQLException;

	public List<HouseDeal> searchAll13(String dong) throws SQLException;

	public HouseDeal search(int no) throws SQLException;

	public List<HouseDeal> searchAllfindall13(String name)throws SQLException;

	public List<HouseDeal> searchAllfindsido13(String sido, String name)throws SQLException;

	public List<HouseDeal> searchAllfindgugun13(String gugun, String name)throws SQLException;

	public List<HouseDeal> searchAllfinddong13(String dong, String name)throws SQLException;

	public List<HouseDeal> searchAllfindall24(String name)throws SQLException;

	public List<HouseDeal> searchAllfindsido24(String sido, String name)throws SQLException;

	public List<HouseDeal> searchAllfindgugun24(String gugun, String name)throws SQLException;

	public List<HouseDeal> searchAllfinddong24(String dong, String name)throws SQLException;
}
