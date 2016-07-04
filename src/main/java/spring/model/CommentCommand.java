package spring.model;

import java.sql.Timestamp;

public class CommentCommand{
	
	int comnum;
	String comnick;
	String comcontent;
	Timestamp comcreateddate;
	Timestamp commodifieddate;
	int comreportcount;
	String comblind;
	int connum;
	String email;
	String comip;
	
	@Override
	public String toString() {
		return "CommentCommand [comnum=" + comnum + ", comnick=" + comnick + ", comcontent=" + comcontent
				+ ", comcreateddate=" + comcreateddate + ", commodifieddate=" + commodifieddate + ", comreportcount="
				+ comreportcount + ", comblind=" + comblind + ", connum=" + connum + ", email=" + email + ", comip="
				+ comip + "]";
	}

	public CommentCommand() {}
	
	public int getComnum() {
		return comnum;
	}
	public void setComnum(int comnum) {
		this.comnum = comnum;
	}
	public String getComnick() {
		return comnick;
	}
	public void setComnick(String comnick) {
		this.comnick = comnick;
	}
	public String getComcontent() {
		return comcontent;
	}
	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}
	public Timestamp getComcreateddate() {
		return comcreateddate;
	}
	public void setComcreateddate(Timestamp comcreateddate) {
		this.comcreateddate = comcreateddate;
	}
	public Timestamp getCommodifieddate() {
		return commodifieddate;
	}
	public void setCommodifieddate(Timestamp commodifieddate) {
		this.commodifieddate = commodifieddate;
	}
	public String getComip() {
		return comip;
	}
	public void setComip(String comip) {
		this.comip = comip;
	}
	public int getComreportcount() {
		return comreportcount;
	}
	public void setComreportcount(int comreportcount) {
		this.comreportcount = comreportcount;
	}
	public String getComblind() {
		return comblind;
	}
	public void setComblind(String comblind) {
		this.comblind = comblind;
	}
	public int getConnum() {
		return connum;
	}
	public void setConnum(int connum) {
		this.connum = connum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


}
