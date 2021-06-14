package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.MemberDto;

@Mapper
public interface LoginDao {
	public MemberDto login(Map<String, String> map) throws SQLException;
	
	public MemberDto memberDetail(String memberid) throws SQLException;
	
	public void insertUserInfo(MemberDto memberDto) throws SQLException;
	public boolean changeinfo(MemberDto memberdto) throws SQLException;
	public boolean deleteinfo(String userid) throws SQLException;
	public String findid(String email)throws SQLException;
	public String findpwd(String userid) throws SQLException;
	public String findpwd2(String userid,String pwdans) throws SQLException;
	
	public List<MemberDto> memberListall() throws SQLException;
	public List<MemberDto> memberList(String searchid) throws SQLException;
}
