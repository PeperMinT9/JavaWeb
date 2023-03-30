package study.dto;

public class ChargerDto {
	private int id;
	private String name;
	private int max_watt;
	private String img_src;
	private int port_cnt;
	private int port_type_c;
	private int port_type_a;
	private String port_info;
	private String certification;
	
	public ChargerDto() {
		super();
	}
	
	public ChargerDto(String name, int max_watt, String img_src) {
		super();
		this.name = name;
		this.max_watt = max_watt;
		this.img_src = img_src;
	}

	public ChargerDto(int id, String name, int max_watt, String img_src) {
		super();
		this.id = id;
		this.name = name;
		this.max_watt = max_watt;
		this.img_src = img_src;
	}

	public ChargerDto(int id, String name, int max_watt, String img_src, int port_cnt, int port_type_c,
			int port_type_a, String port_info, String certification) {
		super();
		this.id = id;
		this.name = name;
		this.max_watt = max_watt;
		this.img_src = img_src;
		this.port_cnt = port_cnt;
		this.port_type_c = port_type_c;
		this.port_type_a = port_type_a;
		this.port_info = port_info;
		this.certification = certification;
	}

	public int getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public int getMax_watt() {
		return max_watt;
	}


	public String getImg_src() {
		return img_src;
	}


	public int getPort_cnt() {
		return port_cnt;
	}


	public int getPort_type_c() {
		return port_type_c;
	}


	public int getPort_type_a() {
		return port_type_a;
	}


	public String getPort_info() {
		return port_info;
	}


	public String getCertification() {
		return certification;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setMax_watt(int max_watt) {
		this.max_watt = max_watt;
	}


	public void setImg_scr(String img_src) {
		this.img_src = img_src;
	}


	public void setPort_cnt(int port_cnt) {
		this.port_cnt = port_cnt;
	}


	public void setPort_type_c(int port_type_c) {
		this.port_type_c = port_type_c;
	}


	public void setPort_type_a(int port_type_a) {
		this.port_type_a = port_type_a;
	}


	public void setPort_info(String port_info) {
		this.port_info = port_info;
	}


	public void setCertification(String certification) {
		this.certification = certification;
	}
	
	
}
