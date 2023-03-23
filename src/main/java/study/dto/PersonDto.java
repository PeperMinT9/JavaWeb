package study.dto;

import java.sql.Timestamp;

public class PersonDto {
	private int num;
	private String name;
	private int birthyear;
	private String address;
	private String job;
	private String photo;
	
	public PersonDto() {
		super();
	}
	
	public PersonDto(String name, int birthyear, String address, String job, String photo) {		
		this.name = name;
		this.birthyear = birthyear;
		this.address = address;
		this.job = job;
		this.photo = photo;
	}
	
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public int getBirthyear() {
		return birthyear;
	}
	public String getAddress() {
		return address;
	}
	public String getJob() {
		return job;
	}
	public String getPhoto() {
		return photo;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBirthyear(int birthyear) {
		this.birthyear = birthyear;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	
	
}
