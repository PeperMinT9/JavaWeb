package study.day0321;

import java.util.List;
import java.util.Vector;

public class AnimalList {
	List<AnimalDto> list = new Vector<>();
	
	public AnimalList() {
		list.add(new AnimalDto("영식이", 23, "00"));
		list.add(new AnimalDto("춘식이", 20, "01"));
		
		AnimalDto dto0 = new AnimalDto();
		dto0.setAnimalName("아무개");
		dto0.setAnimalAge(19);
		dto0.setAnimalPhoto("02");
		list.add(dto0);
		
		list.add(new AnimalDto("이무개", 32, "03"));
		list.add(new AnimalDto("김무개", 36, "04"));
	}
	
	public List<AnimalDto> getAllAnimals() {
		return list;
	}
}
