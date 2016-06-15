package spring.model;

import java.sql.Timestamp;

public class MemberCommand {
	private String email;
	private String nickname;
	private String passwd;
	private String hash;
	private Timestamp createddate;
	private Timestamp modifieddate;
	private String ip;
	private int distinction;
	private int reportcount;
	
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public Timestamp getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(Timestamp modifieddate) {
		this.modifieddate = modifieddate;
	}

	public int getDistinction() {
		return distinction;
	}
	public void setDistinction(int distinction) {
		this.distinction = distinction;
	}
	public int getReportcount() {
		return reportcount;
	}
	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	public Timestamp getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Timestamp createddate) {
		this.createddate = createddate;
	}
	

}
