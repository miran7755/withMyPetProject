package vo;

public class Animal_detail extends Animal_kind{

	private int breed_code;
	private String breed_name;
	
	public Animal_detail() {
		super();
	}
	
	public Animal_detail(int animal_code, String animal_name , int breed_code, String breed_name) {
		super(animal_code, animal_name);
		this.breed_code = breed_code;
		this.breed_name = breed_name;
	}
	
	

}