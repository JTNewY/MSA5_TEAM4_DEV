<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>


<%
    HttpSession loginUser = request.getSession(false);
	HttpSession loginId = request.getSession(false);
	HttpSession Nickname = request.getSession(false);
	HttpSession userNo = request.getSession(false);
	
    if (session != null) {
        session.invalidate(); // 세션 무효화
    }
    
    // 로그인 페이지로 리다이렉트
    response.sendRedirect("login.jsp");
%>
