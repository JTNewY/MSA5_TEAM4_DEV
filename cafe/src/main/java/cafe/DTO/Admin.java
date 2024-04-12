package cafe.DTO; 

import java.util.Date;




public class Admin {
	
	private int admin_no;
	private String admin_id;
	private String adminname;
	private String password;
	private String email;
	private String gender;
	private Date join_date;
	
	
	
	public Admin() {
	
	}



	public Admin(int admin_no, String admin_id, String adminname, String password, String email, String gender,
			Date join_date) {
		
		this.admin_no = admin_no;
		this.admin_id = admin_id;
		this.adminname = adminname;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.join_date = join_date;
	}



	public int getAdmin_no() {
		return admin_no;
	}



	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}



	public String getAdmin_id() {
		return admin_id;
	}



	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}



	public String getAdminname() {
		return adminname;
	}



	public void setAdminname(String adminname) {
		this.adminname = adminname;
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



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public Date getJoin_date() {
		return join_date;
	}



	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}



	@Override
	public String toString() {
		return "Admin [admin_no=" + admin_no + ", admin_id=" + admin_id + ", adminname=" + adminname + ", password="
				+ password + ", email=" + email + ", gender=" + gender + ", join_date=" + join_date + "]";
	}

	
	
}