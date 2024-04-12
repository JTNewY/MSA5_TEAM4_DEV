package cafe.DAO;

import java.sql.SQLException;

import cafe.DTO.Admin;

public class AdminDAO extends JDBConnection{

	// 로그인
		public Admin login(Admin admin) {
			
			String sql = " SELECT * "
						+" FROM admin "
						+" WHERE admin_id = ? and password = ? ";
			

			System.out.println("id : " + admin.getAdmin_id());
			System.out.println("pw : " + admin.getPassword());
			
			try {
				psmt = con.prepareStatement(sql);
				
				psmt.setString(1, admin.getAdmin_id() );
				psmt.setString(2, admin.getPassword() );
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					admin.setAdmin_no(rs.getInt("admin_no"));
					admin.setAdmin_id(rs.getString("admin_id"));
					admin.setAdminname(rs.getString("adminname"));
					admin.setPassword(rs.getString("password"));
					admin.setEmail(rs.getString("email"));
					admin.setGender(rs.getString("gender"));
					admin.setJoin_date(rs.getDate("join_date"));
				
					System.out.println("관리자 로그인 성공!!");
					return admin;
				}
				return null;
			}catch(SQLException e) {
				System.out.println("로그인 시 , 예외발생하였습니다.");
				e.printStackTrace();
			}
			return null;
		}
}
