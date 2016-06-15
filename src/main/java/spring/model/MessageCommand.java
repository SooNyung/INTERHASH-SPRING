package spring.model;

import java.sql.Date;

/*메시지 구현 command*/
public class MessageCommand {

	private int messageNum;
	private String messageContent;
	private String sendEmail;
	private String sendNickname;
	private String receEmail;
	private String receNickname;
	private Date sendDate;
	
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getSendEmail() {
		return sendEmail;
	}
	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}
	public String getSendNickname() {
		return sendNickname;
	}
	public void setSendNickname(String sendNickname) {
		this.sendNickname = sendNickname;
	}
	public String getReceEmail() {
		return receEmail;
	}
	public void setReceEmail(String receEmail) {
		this.receEmail = receEmail;
	}
	public String getReceNickname() {
		return receNickname;
	}
	public void setReceNickname(String receNickname) {
		this.receNickname = receNickname;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

}
