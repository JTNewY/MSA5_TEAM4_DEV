package cafe.DTO;

public class Food {
		
	private int price;
	private String img;
	private String code;
	private String category;
	private String info;
	
	public Food () {
		
		this.code = "없음";
		this.category = "없음";
		this.info = "없음";
	}
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "Food [code=" + code + ", category=" + category + ", price=" + price + ", info=" + info + ", img=" + img
				+ "]";
	}
	
	
}
