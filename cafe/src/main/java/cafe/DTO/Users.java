package cafe.DTO;

import java.util.Date;

public class Users {

	private int user_no;
	private String user_id; 
	private String username;
	private String nickname;
	private String password;
	private String email;
	private String address;
	private String gender;
	private String grade;
	private Date reg_date;
	private Date upd_date;
	
	
	//-----------------상준-------------------
	private Orders orders;
	
	public Orders getOrders() {
		return orders;
	}


	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
	//------------------상준-----------------	
	
	
	public Users() {
		// 기본 값
		// 회원가입하면 자동으로 welcome으로 됨
		this (0,"Default","Default","닉네임을_지정해주세요","Default","Default","Default","Default","Welcome");
	}
	
	public Users(int user_no) {
		
		this.user_no = user_no;
	}


	public Users(int user_no, String user_id, String username, String nickname, String password, String email,
			String address, String gender, String grade) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.username = username;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.grade = grade;
	}




	public Users(int user_no, String user_id, String username, String nickname, String password, String email,
			String address, String gender, String grade, Date reg_date, Date upd_date, Orders orders) {
		
		this.user_no = user_no;
		this.user_id = user_id;
		this.username = username;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.grade = grade;
		this.reg_date = reg_date;
		this.upd_date = upd_date;
		//------------------상준-----------------	

		this.orders = orders;
		//------------------상준-----------------			
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


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	public Date getUpd_date() {
		return upd_date;
	}


	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}


	@Override
	public String toString() {
		return "Users [user_no=" + user_no + ", user_id=" + user_id + ", username=" + username + ", nickname="
				+ nickname + ", password=" + password + ", email=" + email + ", address=" + address + ", gender="
				+ gender + ", grade=" + grade + ", reg_date=" + reg_date + ", upd_date=" + upd_date + "]";
	}
	
	
	
}