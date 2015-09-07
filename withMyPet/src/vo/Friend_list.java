package vo;

public class Friend_list {
	private int friend_no;
	private String e_mail;
	private String friend_e_mail;
	private String reg_date;
	private String img;
	private String nickname;

	public Friend_list() {

	}




	public String getImg() {
		return img;
	}




	public void setImg(String img) {
		this.img = img;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public int getFriend_no() {
		return friend_no;
	}

	public void setFriend_no(int friend_no) {
		this.friend_no = friend_no;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getFriend_e_mail() {
		return friend_e_mail;
	}

	public void setFriend_e_mail(String friend_e_mail) {
		this.friend_e_mail = friend_e_mail;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}




	@Override
	public String toString() {
		return "Friend_list [friend_no=" + friend_no + ", e_mail=" + e_mail
				+ ", friend_e_mail=" + friend_e_mail + ", reg_date=" + reg_date
				+ ", img=" + img + ", nickname=" + nickname + "]";
	}



	

	
	

}