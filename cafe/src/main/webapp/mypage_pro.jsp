<%@page import="cafe.Service.UserServiceImpl"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="cafe.Service.UserService"%>
<%@page import="cafe.DTO.Users"%>
<%@page import="cafe.DAO.UserDAO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

/*  
 ******* 필요한 정보 **********
	userName - 이름
	nickname - 닉네임
	inputPW - 패스워드
	PWCHECK - 비밀번호 확인
	email - 이메일
	address - 주소
	grade - 회원 등급
	duplicate - 중복확인 버튼
 ****************************	
*/


try {
    Users loginUser = (Users) session.getAttribute("loginUser"); 
    UserService userService = new UserServiceImpl();

    String userId = loginUser.getUser_id();
    int userNo = loginUser.getUser_no();

    // 필요한 정보를 파라미터로부터 받아옵니다.
   
    String nickname = request.getParameter("Nickname"); // 닉네임 받아오기
    String password = request.getParameter("inputPW"); // 비밀번호 받아오기
    String checkPW = request.getParameter("PWCHECK"); // 확인비밀번호 받아오기
    String email = request.getParameter("email"); // 이메일 받아오기
    String address = request.getParameter("address"); // 주소 받아오기
    String grade = request.getParameter("grade"); // 등급
    String check = request.getParameter("nickDuplication"); // 중복닉네임 유효성 (숨은 input값)
    
 
	if (!password.equals(checkPW)) { // 확인 비밀번호가 같지 않을 때
	    response.sendRedirect("mypage.jsp?msg=3");
	
	} else if (password.length() < 8) { // 비밀번호 길이가 8자 이하일 때
	    response.sendRedirect("mypage.jsp?msg=4");
	
	} else if (!password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")) { // 비밀번호에 특수문자 포함 여부 확인
	    response.sendRedirect("mypage.jsp?msg=5"); 
	
	} else {
	    // 닉네임 중복 여부 확인
	   
	    if (!check.equals("nickAvailable")) { // 닉네임이 이미 존재하는 경우
	        response.sendRedirect("mypage.jsp?msg=6"); // 닉네임 중복 메시지 출력
	    } else {
	        // 닉네임이 중복되지 않고 비밀번호도 확인되었으므로 수정을 진행합니다.
	        loginUser.setNickname(nickname);
	        loginUser.setPassword(password);
	        loginUser.setEmail(email);
	        loginUser.setAddress(address);
	        
	        
	        int result = userService.update(loginUser);
	        session.setAttribute("loginUser",loginUser);
	        session.setAttribute("Nickname", loginUser.getNickname());

	        if (result > 0) {
	            // 수정 성공
	            response.sendRedirect("mypage.jsp?msg=1");
	            
	          
	        } else {
	            // 수정 실패
	            response.sendRedirect("mypage.jsp?msg=2");
	        }
	    }
	}
} catch (NullPointerException e) {
    // NullPointerException이 발생한 경우 로그인 페이지로 리디렉션합니다.
    response.sendRedirect(request.getContextPath() + "/login.jsp");
}
%>
