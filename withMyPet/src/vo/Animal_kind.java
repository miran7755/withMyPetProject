package vo;

public class Animal_kind {

	private int animal_code;
	private String animal_name;

	public Animal_kind(){

	}

	public Animal_kind(int animal_code, String animal_name) {
		super();
		this.animal_code = animal_code;
		this.animal_name = animal_name;
	}

	public int getAnimal_code() {
		return animal_code;
	}

	public void setAnimal_code(int animal_code) {
		this.animal_code = animal_code;
	}

	public String getAnimal_name() {
		return animal_name;
	}

	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}


}