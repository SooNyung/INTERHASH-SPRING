package spring.model;

import java.sql.Date;
import java.util.ArrayList;

public class ContentCommand {
	int connum;
	String content;
	String conhash;
	Date concreateddate;
	Date conmodifieddate;
	String conip;
	int conreportcount;
	String conblind;
	String email;
	String connickname;
	int conlike;
	
	ArrayList photolist;
	
	public ArrayList getPhotolist() {
		return photolist;
	}

	public void setPhotolist(ArrayList photolist) {
		this.photolist = photolist;
	}

	public String getConnickname() {
		return connickname;
	}

	public void setconNickname(String connickname) {
		this.connickname = connickname;
	}

	public ContentCommand(){}

	public int getConnum() {
		return connum;
	}

	public void setConnum(int connum) {
		this.connum = connum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getConhash() {
		return conhash;
	}

	public void setConhash(String conhash) {
		this.conhash = conhash;
	}

	public Date getConcreateddate() {
		return concreateddate;
	}

	public void setConcreateddate(Date concreateddate) {
		this.concreateddate = concreateddate;
	}

	public Date getConmodifieddate() {
		return conmodifieddate;
	}

	public void setConmodifieddate(Date conmodifieddate) {
		this.conmodifieddate = conmodifieddate;
	}

	public String getConip() {
		return conip;
	}

	public void setConip(String conip) {
		this.conip = conip;
	}

	public int getConreportcount() {
		return conreportcount;
	}

	public void setConreportcount(int conreportcount) {
		this.conreportcount = conreportcount;
	}

	public String getConblind() {
		return conblind;
	}

	public void setConblind(String conblind) {
		this.conblind = conblind;
	}

	public String getEmail() {
		return email;
	}

	public int getConlike() {
		return conlike;
	}

	public void setConlike(int conlike) {
		this.conlike = conlike;
	}

	public void setConnickname(String connickname) {
		this.connickname = connickname;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
