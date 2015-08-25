package vo;

import java.util.Date;

public class Pet extends Animal_detail{
	private int pet_no;
	private String e_mail;
	private String name;
	private Date birthdate;
	private char gender;
	private String img;	
	private Date pet_reg_date;
	
	public Pet() {
		super();
		
	}
	
	public Pet(int animal_code, String animal_name, int breed_code,
			String breed_name, String e_mail, int pet_no, Date birthdate,
			char gender, String img, String name, Date pet_reg_date) {
		super(animal_code, animal_name, breed_code, breed_name);
		this.e_mail = e_mail;
		this.pet_no = pet_no;
		this.birthdate = birthdate;
		this.gender = gender;
		this.img = img;
		this.name = name;
		this.pet_reg_date = pet_reg_date;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public int getPet_no() {
		return pet_no;
	}

	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getPet_reg_date() {
		return pet_reg_date;
	}

	public void setPet_reg_date(Date pet_reg_date) {
		this.pet_reg_date = pet_reg_date;
	}	
	
	



}
