package vo;

import java.util.Date;

public class Pet extends Animal_detail{
	private int pet_no;
	private String e_mail;
	private String name;
	private String birthdate;
	private String gender;
	private String img;	
	private Date pet_reg_date;
	private int animal_code;
	public Pet() {
		super();
		
	}


	public int getAnimal_code() {
		return animal_code;
	}


	public void setAnimal_code(int animal_code) {
		this.animal_code = animal_code;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
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

	

	

	public String getBirthdate() {
		return birthdate;
	}


	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
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


	@Override
	public String toString() {
		return "Pet [pet_no=" + pet_no + ", e_mail=" + e_mail + ", name="
				+ name + ", birthdate=" + birthdate + ", gender=" + gender
				+ ", img=" + img + ", pet_reg_date=" + pet_reg_date
				+ ", animal_code=" + animal_code + "]";
	}	
	
	



}
