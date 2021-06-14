package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface LoginService {
	public void insertUser(MemberDto memberdto) throws Exception;
	public boolean changeUser(MemberDto memberdto) throws Exception;
	
	public MemberDto memberDetail(String userid) throws Exception;
	
	public boolean DeleteUser(String userid) throws Exception;
	
	public MemberDto login(Map<String, String> map) throws Exception;
	
	public String FindId(String email) throws Exception;
	public String Findpwd(String userid) throws Exception;
	public String Findpwd2(String userid, String pwdans) throws Exception;
	
	public List<MemberDto> memberListall() throws Exception;
	public List<MemberDto> memberList(String searchid) throws Exception;
}
