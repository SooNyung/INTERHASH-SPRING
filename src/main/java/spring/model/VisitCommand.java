package spring.model;

import java.sql.Timestamp;

public class VisitCommand {
	
	private Timestamp visit_date;
	private String email;
	
	public Timestamp getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Timestamp visit_date) {
		this.visit_date = visit_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
