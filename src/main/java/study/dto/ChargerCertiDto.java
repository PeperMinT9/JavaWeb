package study.dto;

public class ChargerCertiDto {
	private int id;
	private String certification;
	
	public ChargerCertiDto() {
		super();
	}
	
	public ChargerCertiDto(int id, String certification) {
		super();
		this.id = id;
		this.certification = certification;
	}
	
	public int getId() {
		return id;
	}
	public String getCertification() {
		return certification;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
}
