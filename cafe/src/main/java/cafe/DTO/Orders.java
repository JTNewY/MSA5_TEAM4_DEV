package cafe.DTO;

import java.util.Date;

public class Orders {
	
	private int order_no;
	private int user_no; 
	
	private String user_id;
	private String food_code;
	private int cnt;
	private Date order_date;
	private int total_price;
	private int order_check;		// 1이면 주문완료
	private Date order_time;
	
//****************************************************	
	private Users users;
	private Food food;
	private Admin admin;
	
	
// ****************데이터베이스 연결************************
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
// *****************************************************

	
	
	public Orders() {
		
		
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public Orders(int order_no, int user_no, String user_id, String food_code, int cnt, Date order_date,
			int total_price, int order_check) {
		
		this.order_no = order_no;
		this.user_no = user_no;
		this.user_id = user_id;
		this.food_code = food_code;
		this.cnt = cnt;
		this.order_date = order_date;
		this.total_price = total_price;
		this.order_check = order_check;
		
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFood_code() {
		return food_code;
	}
	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getOrder_check() {
		return order_check;
	}
	public void setOrder_check(int order_check) {
		this.order_check = order_check;
	}
	@Override
	public String toString() {
		return "Orders [order_no=" + order_no + ", user_no=" + user_no + ", user_id=" + user_id + ", food_code="
				+ food_code + ", cnt=" + cnt + ", order_date=" + order_date + ", total_price=" + total_price
				+ ", order_check=" + order_check + "]";
	}



	
}