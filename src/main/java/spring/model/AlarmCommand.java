package spring.model;

<<<<<<< HEAD
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
=======
public class AlarmCommand {
	private String email;
	private int count;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
>>>>>>> 153dd04795e20f0b97c17935dcd44da8e5a77643
	}
	
	

}
