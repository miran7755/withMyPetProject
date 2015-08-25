package vo;

import java.util.Date;

public class Blacklist {

	private Date bl_date;
	private String bl_email;
	private Date bl_release;
	private int blacklist_no;
	private String reported_email;

	public Blacklist(){

	}


	public Date getBl_date() {
		return bl_date;
	}

	public void setBl_date(Date bl_date) {
		this.bl_date = bl_date;
	}

	public String getBl_email() {
		return bl_email;
	}

	public void setBl_email(String bl_email) {
		this.bl_email = bl_email;
	}

	public Date getBl_release() {
		return bl_release;
	}

	public void setBl_release(Date bl_release) {
		this.bl_release = bl_release;
	}

	public int getBlacklist_no() {
		return blacklist_no;
	}

	public void setBlacklist_no(int blacklist_no) {
		this.blacklist_no = blacklist_no;
	}

	public String getReported_email() {
		return reported_email;
	}

	public void setReported_email(String reported_email) {
		this.reported_email = reported_email;
	}

}