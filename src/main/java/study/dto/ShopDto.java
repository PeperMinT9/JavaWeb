package study.dto;

public class ShopDto {
	private int num;
	private String sangpum;
	private String color;
	private String photo;
	private String ipgoday;
	private int su;
	private int dan;
	
	public ShopDto() {
		super();
	}

	public ShopDto(int num, String sangpum, String color, String photo, String ipgoday, int su, int dan) {
		super();
		this.num = num;
		this.sangpum = sangpum;
		this.color = color;
		this.photo = photo;
		this.ipgoday = ipgoday;
		this.su = su;
		this.dan = dan;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getNum() {
		return num;
	}
	
	public String getSangpum() {
		return sangpum;
	}
	
	public String getColor() {
		return color;
	}
	
	public String getIpgoday() {
		return ipgoday;
	}
	
	public int getSu() {
		return su;
	}
	
	public int getDan() {
		return dan;
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
	
	public void setIpgoday(String ipgoday) {
		this.ipgoday = ipgoday;
	}
	
	public void setSu(int su) {
		this.su = su;
	}
	
	public void setDan(int dan) {
		this.dan = dan;
	}
}
