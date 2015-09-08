package vo;

import java.util.Date;
import java.util.List;

public class Post {

	private int post_no;
	private String subject;
	// private String e_mail;
	private Member member;
	private String msg;
	private int hate_count;
	private int like_count;
	private Date post_date;
	private char tb_flag;
	private List<Media_tag> list;

	public Post() {

	}

	@Override
	public String toString() {
		return "\nPost [post_no=" + post_no + ", subject=" + subject
				+ ", member=" + member + ", msg=" + msg + ", hate_count="
				+ hate_count + ", like_count=" + like_count + ", post_date="
				+ post_date + ", tb_flag=" + tb_flag + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + hate_count;
		result = prime * result + like_count;
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((msg == null) ? 0 : msg.hashCode());
		result = prime * result
				+ ((post_date == null) ? 0 : post_date.hashCode());
		result = prime * result + post_no;
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
		result = prime * result + tb_flag;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Post other = (Post) obj;
		if (hate_count != other.hate_count)
			return false;
		if (like_count != other.like_count)
			return false;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (msg == null) {
			if (other.msg != null)
				return false;
		} else if (!msg.equals(other.msg))
			return false;
		if (post_date == null) {
			if (other.post_date != null)
				return false;
		} else if (!post_date.equals(other.post_date))
			return false;
		if (post_no != other.post_no)
			return false;
		if (subject == null) {
			if (other.subject != null)
				return false;
		} else if (!subject.equals(other.subject))
			return false;
		if (tb_flag != other.tb_flag)
			return false;
		return true;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getHate_count() {
		return hate_count;
	}

	public void setHate_count(int hate_count) {
		this.hate_count = hate_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public char getTb_flag() {
		return tb_flag;
	}

	public void setTb_flag(char tb_flag) {
		this.tb_flag = tb_flag;
	}

	public Post(int post_no, String subject, Member member, String msg,
			int hate_count, int like_count, Date post_date, char tb_flag) {
		super();
		this.post_no = post_no;
		this.subject = subject;
		this.member = member;
		this.msg = msg;
		this.hate_count = hate_count;
		this.like_count = like_count;
		this.post_date = post_date;
		this.tb_flag = tb_flag;
	}

}