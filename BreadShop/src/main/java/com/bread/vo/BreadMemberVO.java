package com.bread.vo;

public class BreadMemberVO {
	
	private String id;
	private String passwd;
	private String name;
	private String mail;
	
	public BreadMemberVO() {
		super();
	}
	
	
	public BreadMemberVO(String id, String passwd, String name, String mail) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.mail = mail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Override
	public String toString() {
		return "BreadMemeberVO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", mail=" + mail + "]";
	}
	
	
}
