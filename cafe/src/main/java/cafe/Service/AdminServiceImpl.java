package cafe.Service;

import cafe.DTO.Admin;
import cafe.DAO.AdminDAO;


public class AdminServiceImpl implements AdminService  {
	private AdminDAO adminDAO = new AdminDAO();
	
	// 로그인
	@Override
	public Admin login(Admin admin) {
		
		Admin loginAdmin = adminDAO.login(admin);
		
		if(loginAdmin != null) {
			System.out.println("로그인 성공");
			return loginAdmin;
		}
		else {
			System.out.println("로그인 실패!");
			return null;
		}
	}
}
