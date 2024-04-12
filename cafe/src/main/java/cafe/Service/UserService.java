package cafe.Service;

import java.util.List;

import cafe.DTO.Users;

public interface UserService {
	
	
	// 로그인
	public Users login(Users user);
	
	// 회원가입
	public int register(Users user);
	
	// 아이디 중복체크
	public boolean idCheck(String user_id);
	
	// user_id로 데이터베이스 조회
	public Users select(String user_id);
	
	// user_no로 데이터베이스 조회
	public Users selectNO(int user_no);
	
	// 닉네임 중복체크
	public boolean NickCheck(String nickname);
	
	// 유저정보 수정
	public int update(Users users);
	
	//(상준)--------------------------------------------------------------------
	
	// 관리자 페이지 조회
	List<Users> list();

	// 관리자 페이지 정보 삭제 
	int delete(int no);
	
}