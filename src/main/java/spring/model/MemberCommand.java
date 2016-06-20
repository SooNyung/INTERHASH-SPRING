package spring.model;

import java.sql.Timestamp;

public class MemberCommand {
	private String email;
	private String nickname;
	private String passwd;
	private String hash1;
	private String birthday;
	private Timestamp createddate;
	private Timestamp modifieddate;
	private String ip;
	private int distinction;
	private int reportcount;
	private String elementaryschool;
	private String middelschool;
	private String highschhol;
	private String university;
	private String graduateschool;
	
	
	
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
		return hash1;
	}
	public void setHash(String hash1) {
		this.hash1 = hash1;
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
	public String getElementaryschool() {
		return elementaryschool;
	}
	public void setElementaryschool(String elementaryschool) {
		this.elementaryschool = elementaryschool;
	}
	public String getMiddelschool() {
		return middelschool;
	}
	public void setMiddelschool(String middelschool) {
		this.middelschool = middelschool;
	}
	public String getHighschhol() {
		return highschhol;
	}
	public void setHighschhol(String highschhol) {
		this.highschhol = highschhol;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getGraduateschool() {
		return graduateschool;
	}
	public void setGraduateschool(String graduateschool) {
		this.graduateschool = graduateschool;
	}
	

}
