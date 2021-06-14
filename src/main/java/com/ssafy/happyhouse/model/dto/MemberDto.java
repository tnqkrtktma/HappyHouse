package com.ssafy.happyhouse.model.dto;

public class MemberDto {

	private String userid;
	private String username;
	private String userpwd;
	private String pwdqes;
	private String pwdans;
	private String email;
	private String address;
	private String tel;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getPwdqes() {
		return pwdqes;
	}
	public void setPwdqes(String pwdqes) {
		this.pwdqes = pwdqes;
	}
	public String getPwdans() {
		return pwdans;
	}
	public void setPwdans(String pwdans) {
		this.pwdans = pwdans;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "MemberDto [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + ", pwdqes=" + pwdqes
				+ ", pwdans=" + pwdans + ", email=" + email + ", address=" + address + ", tel=" + tel + "]";
	}
}

