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

<script>
    function validateForm() {
        var pw = document.getElementById("add_pw").value;
        var confirmPW = document.getElementById("confirmPW").value;
        
        // 비밀번호 입력 여부 확인
        if (pw === "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        
        // 비밀번호 길이 확인
        if (pw.length < 8) {
            alert("비밀번호는 8자 이상으로 입력해야 합니다.");
            return false;
        }
        
        // 비밀번호에 특수문자 포함 여부 확인
        var regex = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
        if (!regex.test(pw)) {
            alert("비밀번호에는 특수문자가 하나 이상 포함되어야 합니다.");
            return false;
        }
        
        // 비밀번호 확인
        if (pw !== confirmPW) {
            alert("확인 비밀번호가 일치하지 않습니다.");
            return false;
        }
        
        return true;
    }
</script>

<%
    String id = request.getParameter("add_id");
    String username = request.getParameter("add_username");
    String password = request.getParameter("add_pw");
    String email = request.getParameter("add_email");
    String confirmPW = request.getParameter("confirmPW");
    String male = request.getParameter("gender");
    
    Users user = new Users();
    UserService userService = new UserServiceImpl();
    boolean duplicate = userService.idCheck(id);
    
    // 비밀번호 확인
    if (!password.equals(confirmPW)) { // 확인 비밀번호가 같지 않을 때
        response.sendRedirect("login.jsp?msg=6");
    
    } else if (password.length() < 8) { // 비밀번호 길이가 8자 이하일 때
        response.sendRedirect("login.jsp?msg=7");
    
    } else if (!password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")) { // 비밀번호에 특수문자 포함 여부 확인
        response.sendRedirect("login.jsp?msg=8");
    
    } else if (duplicate) { // 중복된 아이디가 있을 때
        response.sendRedirect("login.jsp?msg=5");
    
    } else { // 회원가입 진행
        user.setUser_id(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setGender(male);
        
        int result = userService.register(user);
        
        if (result > 0) { // 회원가입 성공
            response.sendRedirect("login.jsp?msg=4");
        
        } else { // 회원가입 실패
            response.sendRedirect("login.jsp?msg=3");
        }
        
    }   // 비밀번호 같을때만 실행
%>
