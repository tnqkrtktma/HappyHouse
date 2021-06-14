package com.ssafy.happyhouse.model.service;

import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.mapper.LoginDao;
import com.ssafy.happyhouse.model.dto.MemberDto;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDao loginDao;
	
	@Override
	public MemberDto login(Map<String, String> map) throws Exception{
		if (map.get("userid") == null || map.get("userpwd") == null)
			return null;
		return loginDao.login(map);
	}

	@Override
	public void insertUser(MemberDto memberdto) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			loginDao.insertUserInfo(memberdto);
		} catch (SQLException e) {
			DBUtil.rollback(conn);
			throw new Exception("이미 존재하는 아이디입니다");
		} finally {
			DBUtil.close(conn);
		}
	}
	
	@Override
	public MemberDto memberDetail(String userid) throws Exception {
		return loginDao.memberDetail(userid);
	}

	@Override
	public boolean changeUser(MemberDto memberdto) throws Exception {
		// TODO Auto-generated method stub
		return loginDao.changeinfo(memberdto);
	}

	@Override
	public boolean DeleteUser(String userid) throws Exception {
		// TODO Auto-generated method stub
		return  loginDao.deleteinfo(userid);
	}

	@Override
	public String FindId(String email) throws Exception {
		// TODO Auto-generated method stub
		return loginDao.findid(email);
	}

	@Override
	public String Findpwd(String userid) throws Exception {
		// TODO Auto-generated method stub
		return  loginDao.findpwd(userid);
	}

	@Override
	public String Findpwd2(String userid, String pwdans) throws Exception {
		// TODO Auto-generated method stub
		return loginDao.findpwd2(userid,pwdans);
	}
	
	@Override
	public List<MemberDto> memberListall() throws Exception {
		return loginDao.memberListall();
	}
	
	@Override
	public List<MemberDto> memberList(String searchid) throws Exception {
		return loginDao.memberList(searchid);
	}

}
