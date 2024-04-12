<%@page import="cafe.Service.OrderServiceImpl"%>
<%@page import="cafe.Service.OrderService"%>
<%@page import="cafe.DTO.Orders"%>
<%@page import="cafe.DTO.Food" %>
<%@page import="cafe.Service.UserServiceImpl"%>
<%@page import="cafe.Service.UserService"%>
<%@page import="cafe.DTO.Users"%>
<%@page import="cafe.DAO.UserDAO"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	주문내역 등록 처리
--%>   
<%
	
	// 세션에서 로그인된 사용자 정보 가져오기
	Users loginUser = (Users) session.getAttribute("loginUser"); 

// 	out.println("loginUser - user_no : " + loginUser.getUser_no());
// 	out.println("loginUser - user_id : " + loginUser.getUser_id());
	 
	if(loginUser != null) {
	    // 사용자 아이디 가져오기
	    String userId = loginUser.getUser_id();
	    int userNo = loginUser.getUser_no();
	   
	   	
	    // 주문 정보 가져오기
	    String food = request.getParameter("food_code"); // 상품명
	    int cnt = Integer.parseInt(request.getParameter("cnt")); // 수량
	    int price = Integer.parseInt(request.getParameter("price")); // 가격
	
	    // 주문 객체 생성 및 정보 설정
	    Orders newOrder = new Orders();
	    
	    newOrder.setUser_no(userNo);    // 사용자 번호 설정
	    newOrder.setUser_id(userId) ;   // 사용자 아이디 설정
	    newOrder.setFood_code(food); // food_code
	    newOrder.setCnt(cnt); // 수량
	    newOrder.setTotal_price(price * cnt); // 총 가격
	    newOrder.setOrder_check(1); // 주문 상태 (1: 주문완료)
	
	    // 주문 서비스를 이용하여 주문 등록
	    OrderService orderService = new OrderServiceImpl();
	    int result = orderService.insert(newOrder);
	
	    // 주문 결과에 따라 리다이렉트
	    if (result > 0) {
	        // 주문 성공 시
	        response.sendRedirect(request.getContextPath() + "/complete.jsp");
	    } else {
	        // 주문 실패 시
	        response.sendRedirect(request.getContextPath() + "/board/insert.jsp?msg=0");
	    }
	} else {
	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>