package spring.model;

import java.sql.Timestamp;

public class MemberCommand {
	private String email;
	private String nickname;
	private String passwd;
	private String hash;
	private String birthday;
	private Timestamp createddate;
	private Timestamp modifieddate;
	private String ip;
	private int distinction;
	private int reportcount;
	private String middleschool;
	private String highschool;
	private String university;
	private String bloodgroups;
	private String location;
	private String phone;
	private String checked;
	
	
	
	
	

	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getMiddleschool() {
		return middleschool;
	}
	public void setMiddleschool(String middleschool) {
		this.middleschool = middleschool;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
	public String getBloodgroups() {
		return bloodgroups;
	}
	public void setBloodgroups(String bloodgroups) {
		this.bloodgroups = bloodgroups;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
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
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}

}
