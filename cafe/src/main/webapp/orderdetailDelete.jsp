<%@page import="cafe.Service.OrderService"%>
<%@page import="cafe.Service.OrderServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	
	String reqNo = request.getParameter("delete");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	
	OrderService orderService = new OrderServiceImpl();
	int result = orderService.delete(no);
	
	String root = request.getContextPath();
	
	if( result > 0 ) {
		
		response.sendRedirect(root + "/orderdetails.jsp");
	}
	else {
		// 삭제 실패 -> 수정으로 이동
		
		response.sendRedirect(root + "/orderdetails.jsp");
	}
	
	
	

%>
    