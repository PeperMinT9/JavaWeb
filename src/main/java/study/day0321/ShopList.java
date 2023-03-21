package study.day0321;

import java.util.ArrayList;
import java.util.List;

public class ShopList {
	private List<ShopDto> list = new ArrayList<>();
	
	public ShopList() {
		list.add(new ShopDto("0번 사진", 3, "GRAY", "00.jpg"));
		list.add(new ShopDto("1번 사진", 2, "Black", "01.jpg"));
		
		ShopDto dto = new ShopDto();
		dto.setSangpumName("2번사진");
		dto.setSangpumPrice(8);
		dto.setSangpumColor("PUPLE");
		dto.setSangpumPhoto("02.jpg");
		list.add(dto);
		
		list.add(new ShopDto("3번 사진", 7, "MAGENTA", "03.jpg"));
		list.add(new ShopDto("4번 사진", 12, "GREEN", "04.jpg"));
	}
	
	public List<ShopDto> getAllSangpum() {
		return list;
	}
}
