<%@page import="cafe.Service.OrderServiceImpl"%>
<%@page import="cafe.Service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String reqNo = request.getParameter("delete");
    int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
    
    OrderService orderService = new OrderServiceImpl();
    int result = orderService.delete(no);
    
    String root = request.getContextPath();
    if( result > 0 ) {
        response.sendRedirect(root + "/userManagement.jsp");
    }
    else {
        response.sendRedirect(root + "/userManagement.jsp?error");
    }
%>