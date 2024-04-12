
<%@page import="cafe.Service.AdminServiceImpl"%>
<%@page import="cafe.Service.AdminService"%>
<%@page import="cafe.DTO.Admin"%>

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
<!--
******************************	
			로그인 처리
******************************	
-->
    
 <%
 	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 아이디 저장
	String rememberId = request.getParameter("rememberId");
	
	// 쿠키 생성
	Cookie cookieRememberId = new Cookie("rememberId","");
	Cookie cookieUserId = new Cookie("userId","");
	
	Admin admin = new Admin();
	Users user = new Users();
	user.setUser_id(id);
	user.setPassword(password);
	admin.setAdmin_id(id);
	admin.setPassword(password);
	
	// 로그인 요청
	
	UserService userService = new UserServiceImpl();
	AdminService adminService = new AdminServiceImpl();
	
	Users loginUser = userService.login(user);
	Admin loginAdmin =  adminService.login(admin);
	
	// 체크 박스 체크 시, 값 : on
	if(rememberId != null && rememberId.equals("on")){
		// 쿠키생성
		cookieRememberId.setValue(URLEncoder.encode(rememberId,"UTF-8"));
		cookieUserId.setValue(URLEncoder.encode(id,"UTF-8"));
		
		// 7일간 유지
		cookieRememberId.setMaxAge(60*60*24*7);
		cookieUserId.setMaxAge(60*60*24*7);
	}
	// 체크박스 미 체크 시
	else {
		// 쿠키 삭제
		cookieRememberId.setMaxAge(0);
		cookieUserId.setMaxAge(0);
	}
	
	// 쿠키 응답에 등록
	response.addCookie(cookieRememberId);
	response.addCookie(cookieUserId);
	// 아이디저장 끝
	
	
	// 로그인 성공 (사용자)
	if( loginUser != null){
		// 세션에 아이디 등록 후, 메인 페이지로 이동
		session.setAttribute("loginUser",loginUser);
		session.setAttribute("loginId",loginUser.getUser_id());
		session.setAttribute("Nickname", loginUser.getNickname());
		session.setAttribute("userNo",loginUser.getUser_no());
		session.setAttribute("userAddress", loginUser.getAddress());
		session.setAttribute("usergrade", loginUser.getGrade());
		
		response.sendRedirect("main.jsp");
	}

 	// 로그인 성공 (관리자)
 	else if( loginAdmin != null){
		// 세션에 아이디 등록 후, 메인 페이지로 이동
		session.setAttribute("loginAdmin",loginAdmin);
		session.setAttribute("loginAdminID",loginAdmin.getAdmin_id());
		session.setAttribute("AdminName",loginAdmin.getAdminname());
	
		
		response.sendRedirect("main.jsp");
	}
	else{ // 로그인 실패
		response.sendRedirect("login.jsp?msg=0");
	} 
	
	
	
	
 %>
 