package vo;

import java.util.Date;

public class Member{
	private String e_mail;
	private String password;
	private String img;
	private String nickname;
	private char gender;
	private Date birthdate;
	private Date reg_date;
	private char bl_flag;
	
	public Member(){

	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public char getBl_flag() {
		return bl_flag;
	}

	public void setBl_flag(char bl_flag) {
		this.bl_flag = bl_flag;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((e_mail == null) ? 0 : e_mail.hashCode());
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
		Member other = (Member) obj;
		if (e_mail == null) {
			if (other.e_mail != null)
				return false;
		} else if (!e_mail.equals(other.e_mail))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [e_mail=" + e_mail + ", password=" + password + ", img="
				+ img + ", nickname=" + nickname + ", gender=" + gender
				+ ", birthdate=" + birthdate + ", reg_date=" + reg_date
				+ ", bl_flag=" + bl_flag + "]";
	}
	
	

}