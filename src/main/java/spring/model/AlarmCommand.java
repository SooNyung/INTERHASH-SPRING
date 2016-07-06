package spring.model;

import java.sql.Date;

public class AlarmCommand {
	private String receivedemail;
	private String comnick;
	private int connum;
	private Date alarmdate;
	
	
	
	public Date getAlarmdate() {
		return alarmdate;
	}
	public void setAlarmdate(Date alarmdate) {
		this.alarmdate = alarmdate;
	}
	public String getReceivedemail() {
		return receivedemail;
	}
	public void setReceivedemail(String receivedemail) {
		this.receivedemail = receivedemail;
	}

	
	public String getComnick() {
		return comnick;
	}
	public void setComnick(String comnick) {
		this.comnick = comnick;
	}
	public int getConnum() {
		return connum;
	}
	public void setConnum(int connum) {
		this.connum = connum;
	}
	
	

}
