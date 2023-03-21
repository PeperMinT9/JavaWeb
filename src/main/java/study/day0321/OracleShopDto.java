package study.day0321;

import java.sql.Timestamp;

public class OracleShopDto {
	private int num;
	private String sangpum;
	private String color;
	private int su;
	private int dan;
	private Timestamp today;
	
	public int getNum() {
		return num;
	}
	public String getSangpum() {
		return sangpum;
	}
	public String getColor() {
		return color;
	}
	public int getSu() {
		return su;
	}
	public int getDan() {
		return dan;
	}
	public Timestamp getToday() {
		return today;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	public void setToday(Timestamp today) {
		this.today = today;
	}
	
	
}
