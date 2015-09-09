package dao;

import java.util.ArrayList;

import exception.AddException;
import exception.DeleteException;
import exception.UpdateException;
import vo.Pet;

public interface PetDAO {

	public void insert(Pet p) throws AddException;
	public ArrayList<Pet> selectByPetName(String name); 
	public void delete(Pet p) throws DeleteException;
	public void revise(Pet p) throws UpdateException;
	public ArrayList<Pet> selectByEmail(String email);
	public void deleteByPetNo(int petNo);
}
