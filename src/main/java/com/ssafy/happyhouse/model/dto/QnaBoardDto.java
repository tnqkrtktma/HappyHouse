package com.ssafy.happyhouse.model.dto;

//Dto : Data Transfer Object
//VO : Value Object
//Bean
public class QnaBoardDto {

	private int articleno;
	private String userid;
	private String subject;
	private String content;
	private String regtime;
	private String answertag;
	private String answer;

	public int getArticleno() {
		return articleno;
	}

	public void setArticleno(int articleno) {
		this.articleno = articleno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public String getAnswertag() {
		return answertag;
	}

	public void setAnswertag(String answertag) {
		this.answertag = answertag;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
