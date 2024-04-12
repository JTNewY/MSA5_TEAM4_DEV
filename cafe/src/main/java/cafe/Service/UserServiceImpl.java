package cafe.Service;

import java.util.List;

import cafe.DAO.UserDAO;
import cafe.DTO.Users;

public class UserServiceImpl  implements UserService{

		private UserDAO userDAO = new UserDAO();

		// 로그인
		@Override
		public Users login(Users user) {
			
			Users loginUser = userDAO.login(user);
			
			if(loginUser != null) {
				System.out.println("로그인 성공");
				return loginUser;
			}
			else {
				System.out.println("로그인 실패!");
				return null;
			}
		}
		
		
		// 회원가입
		public int register(Users user) {
			int result = userDAO.register(user);
			
			if(result > 0) {
				System.out.println("회원 가입 처리 성공!");
			}else {
				System.out.println("회원 가입 실패!");
			}
			
			
			return result;
		}
		
		// 아이디체크
		public boolean idCheck(String user_id) {
			boolean isidCheck = userDAO.idCheck(user_id);
			
			if(isidCheck) {
				System.out.println("중복 있음");
				
				return true;
			}else {
				System.out.println("중복 없음");
				
				return false;
			}
			
		}
		
		// 닉네임체크
		public boolean NickCheck(String nickname) {
			boolean nickCheck = userDAO.NickCheck(nickname);
			
			if(nickCheck) {
				System.out.println("중복 있음");
				
				return true;
			}else {
				System.out.println("중복 없음");
				
				return false;
			}
			
		}
		

		
		//유저 정보조회 (user_id)
		@Override
		public Users select(String user_id) {
			Users result = userDAO.select(user_id);
			
			
			return result;
		}
		
		//유저 정보조회 (user_no)
		public Users selectNO(int user_no) {
			Users result = userDAO.selectNO(user_no);
			
			
			return result;
		}
		
		// 유저 정보 수정
		public int update(Users users) {
			// 1. 유저 정보를 전달하여 게시글 데이터 수정 요청
			int result = userDAO.update(users);
			
			// 2. 적용된 데이터 건수를 반환
			//   - 결과 : 0 --> 데이터 수정 실패
			//           1 --> 데이터 수정 성공
			
			return result;
		}
		
		//(상준)-------------------------------------------------------------------
		
		// 주문 리스트
		@Override
		public List<Users> list() {
			
			List<Users> Userlist = userDAO.list();
			
			return Userlist;
		}

		//-----------------------------------------------------
		// 관리자 페이지 삭제 
		@Override
		public int delete(int no) {
			int result =  userDAO.delete(no);
			
			return result;
		}
				
		//-------------------------------------
		// ----------------------------------------------------
		// 회원정보조회
				

		
		
}
