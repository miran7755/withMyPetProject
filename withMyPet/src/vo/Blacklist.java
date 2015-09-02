package vo;

import java.util.Date;

public class Blacklist {
	private int blacklist_no;
	private String e_mail;
	private Date bl_date;	
	private Date bl_release;
	
	public Blacklist() {
		super();
	}

	public Blacklist(int blacklist_no, String e_mail, Date bl_date,
			Date bl_release) {
		super();
		this.blacklist_no = blacklist_no;
		this.e_mail = e_mail;
		this.bl_date = bl_date;
		this.bl_release = bl_release;
	}

	@Override
	public String toString() {
		return "\nBlacklist [blacklist_no=" + blacklist_no + ", e_mail=" + e_mail
				+ ", bl_date=" + bl_date + ", bl_release=" + bl_release + "]";
	}

	public int getBlacklist_no() {
		return blacklist_no;
	}

	public void setBlacklist_no(int blacklist_no) {
		this.blacklist_no = blacklist_no;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public Date getBl_date() {
		return bl_date;
	}

	public void setBl_date(Date bl_date) {
		this.bl_date = bl_date;
	}

	public Date getBl_release() {
		return bl_release;
	}

	public void setBl_release(Date bl_release) {
		this.bl_release = bl_release;
	}
	
	

}