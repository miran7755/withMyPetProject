package vo;

import java.util.Date;

public class Report {

	private int report_no;
	private int post_no;
	private int reply_no;
	private String reported_email;
	private String reporter_email;
	private String report_kind;	
	private Date report_date;
	
	public Report(){

	}

	public Report(int report_no, int post_no, int reply_no,
			String reported_email, String reporter_email, String report_kind,
			Date report_date) {
		super();
		this.report_no = report_no;
		this.post_no = post_no;
		this.reply_no = reply_no;
		this.reported_email = reported_email;
		this.reporter_email = reporter_email;
		this.report_kind = report_kind;
		this.report_date = report_date;
	}

	@Override
	public String toString() {
		return "\nReport [report_no=" + report_no + ", post_no=" + post_no
				+ ", reply_no=" + reply_no + ", reported_email="
				+ reported_email + ", reporter_email=" + reporter_email
				+ ", report_kind=" + report_kind + ", report_date="
				+ report_date + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReported_email() {
		return reported_email;
	}

	public void setReported_email(String reported_email) {
		this.reported_email = reported_email;
	}

	public String getReporter_email() {
		return reporter_email;
	}

	public void setReporter_email(String reporter_email) {
		this.reporter_email = reporter_email;
	}

	public String getReport_kind() {
		return report_kind;
	}

	public void setReport_kind(String report_kind) {
		this.report_kind = report_kind;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	
	
	
}