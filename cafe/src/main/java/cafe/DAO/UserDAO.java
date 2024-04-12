package cafe.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.DTO.Orders;
import cafe.DTO.Users;

public class UserDAO extends JDBConnection {
	
	// 유저 정보 조회(상준) --------------------------------------
	
	public List<Users> list() {
		
		List<Users> userlist = new ArrayList<Users>();
		
		String sql =   " SELECT o.order_no"
					+ "			,u.user_no"
					 + "		,u.user_id "
					 + "       	,u.username "
					 + "	  	,o.food_code "
					 + "	   	,o.order_date " 
		             + " FROM ORDERS o " 
		             + " JOIN USERS u ON o.USER_NO = u.USER_NO "
		             + " ORDER BY user_id ASC ";
		try {
			
			stmt = con.createStatement(); 
			rs = stmt.executeQuery(sql);
			
			while( rs.next() ) {	
				Users users = new Users();
				Orders orders = new Orders();
				
				orders.setOrder_no(rs.getInt("order_no"));
				users.setUser_no(rs.getInt("user_no"));
				users.setUser_id( rs.getString("user_id") );
				users.setUsername(rs.getString("username"));
				orders.setFood_code(rs.getString("food_code")); 
				orders.setOrder_date(rs.getDate("order_date"));
				users.setOrders(orders);
				// 게시글 목록에 추가
				userlist.add(users);
			}
		} catch(SQLException e) {
			System.err.println("유저 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 목록 반환
		return userlist;
	}
	// (상준)------------------------------------------------
		// 해당 열 삭제  ----------------------------------------------------------------------------
	public int delete(int no) {
		int result = 0;
		
		String sql = "DELETE FROM ORDERS "
		           + "WHERE order_no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,no);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("주문 내역 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
		
	}

	// (상준)-----------------



	// 로그인
	public Users login(Users user) {
		
		String sql = " SELECT * "
					+" FROM users "
					+" WHERE user_id = ? and password = ? ";
		

		System.out.println("id : " + user.getUser_id());
		System.out.println("pw : " + user.getPassword());
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, user.getUser_id() );
			psmt.setString(2, user.getPassword() );
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				user.setUser_no(rs.getInt("user_no"));
				user.setUser_id(rs.getString("user_id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setGrade(rs.getString("grade"));
				user.setAddress(rs.getString("address"));
				user.setNickname(rs.getString("nickname"));
				user.setReg_date( rs.getDate("reg_date"));
				user.setUpd_date(rs.getDate("upd_date"));
			
				System.out.println("로그인 성공!!");
				return user;
			}
			return null;
		}catch(SQLException e) {
			System.out.println("로그인 시 , 예외발생하였습니다.");
			e.printStackTrace();
		}
		return null;
	}
	
	
	// 회원가입 
	
	public int register(Users user) {
		int result = 0; //결과 : 적용된 데이터 개수
		
		String sql = "INSERT INTO users(user_no,user_id,username,nickname,password,email,gender,grade,reg_date,upd_date)"
				+ " VALUES(SEQ_USER_NO.nextval,?,?,?,?,?,?,?,sysdate,sysdate)";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1,user.getUser_id());
			psmt.setString(2,user.getUsername());
			psmt.setString(3,"닉네임을_지정해주세요");
			psmt.setString(4,user.getPassword());
			psmt.setString(5,user.getEmail());
			psmt.setString(6,user.getGender());
			psmt.setString(7, "Welcome");
			result = psmt.executeUpdate();
			
			
		}catch (Exception e) {
			System.err.println("회원 등록 중 오류 발생: " + e.getMessage());
	       e.printStackTrace();
		}
	
		return result;
	}
	
	// 유저 정보 조회
	public Users select(String user_id) {
		Users user = new Users();
		
		String sql = "SELECT * FROM Users WHERE user_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql); // 실행
			psmt.setString(1,user_id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String userId = rs.getString("user_id");
				// 계정 추가정보 넣기
				
				user.setUser_id(userId);
				
			}else {
				return user;
			}
			
		}catch (Exception e){
			
		}
		return user;
	}
	
	// userNO 유저 정보 ID 조회
	// 유저 정보 조회

	public Users selectNO(int user_no) {
		Users user = new Users();
		
		String sql = "SELECT * FROM Users WHERE user_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql); // 실행
			psmt.setInt(1,user_no);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int userNO = rs.getInt("user_no");
				// 계정 추가정보 넣기
				
				user.setUser_no(userNO);
				
			}else {
				return user;
			}
			
		}catch (Exception e){
			
		}
		return user;
	}
	
	
	// 아이디 중복여부 확인
	
	public boolean idCheck(String user_id) {
		
		String sql = "SELECT count(*) cnt FROM Users WHERE user_id= ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			
			// 0 이면 아아디생성 가능 1이면 불가능
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt("cnt")== 1) { 
					System.out.println("중복된 아이디 발견!");
					return true;
					
				}else {
					System.out.println("아이디 생성가능");
					return false;
				}
			}
			
		}catch (Exception e) {
			System.err.println("아이디 중복 확인 중 오류 발생: " + e.getMessage());
	        e.printStackTrace();
			
		}
		return false;
		
		
	}
	
	// 닉네임 체크
	
	public boolean NickCheck(String nickname) {
		
		
		String sql = "SELECT count(*) cnt FROM Users WHERE nickname= ?";
		
		System.out.println("nickname : " + nickname);
	
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nickname);
			
			// 0 이면 닉네임 생성 가능 1이면 불가능
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt("cnt") == 1) {
					System.out.println("중복된 닉네임 발견!");
					return true;
					
				}else {
					System.out.println("닉네임 생성가능");
					return false;
				}
			}
			
		}catch (Exception e) {
			System.err.println("아이디 중복 확인 중 오류 발생: " + e.getMessage());
	        e.printStackTrace();
			
		}
		return false;
		
		
	}
	
	
	// 회원 정보 수정
	
	public int update(Users users) {
		int result = 0 ;
		
		String sql = "UPDATE Users "
	            + "SET nickname = ?, "
	            + "    password = ?, "
	            + "    email = ?, "
	            + "    address = ?, "
	            + "    upd_date = sysdate "
	            + "WHERE user_no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, users.getNickname());
			psmt.setString(2, users.getPassword());
			psmt.setString(3, users.getEmail());
			psmt.setString(4, users.getAddress());
			psmt.setInt(5, users.getUser_no());
			
			System.out.println("수정 완료!");
			result = psmt.executeUpdate();  
			
			
		} catch (SQLException e) {
			System.err.println("회원 정보 수정 중, 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	
	
	
}