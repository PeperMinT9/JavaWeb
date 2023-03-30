package study.dto;

public class ChargerPortDto {
	private int id;
	private int port_cnt;
	private int port_type_c;
	private int port_type_a;
	private String port_info;
	
	public ChargerPortDto() {
		super();
	}

	public ChargerPortDto(int id, int port_cnt, int port_type_c, int port_type_a, String port_info) {
		super();
		this.id = id;
		this.port_cnt = port_cnt;
		this.port_type_c = port_type_c;
		this.port_type_a = port_type_a;
		this.port_info = port_info;
	}

	public int getId() {
		return id;
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

	public void setId(int id) {
		this.id = id;
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
}
