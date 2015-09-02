package vo;

import java.util.Date;

public class Reply {

	private int reply_no;
	private int post_no;
	private String reply_email;
	private String msg;
	private int like_count;
	private String img;
	private Date reply_date;

	public Reply() {

	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getReply_email() {
		return reply_email;
	}

	public void setReply_email(String reply_email) {
		this.reply_email = reply_email;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "\nReply [reply_no=" + reply_no + ", post_no=" + post_no
				+ ", reply_email=" + reply_email + ", msg=" + msg
				+ ", like_count=" + like_count + ", img=" + img
				+ ", reply_date=" + reply_date + "]";
	}

	
}