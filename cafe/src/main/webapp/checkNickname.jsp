<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cafe.DAO.UserDAO" %>
<%@ page import="cafe.DTO.Users" %>

<%
    String nickname = request.getParameter("nickname");
    UserDAO userDAO = new UserDAO(); // UserDAO 객체 생성
    
    // 사용자의 현재 닉네임을 가져오는 코드
    // 이 부분은 프로젝트의 구조에 따라 수정되어야 합니다.
    String currentNickname = ""; // 사용자의 현재 닉네임 변수
    // 사용자의 현재 닉네임을 가져오는 코드 
    
    // 가져온 현재 닉네임과 사용자가 입력한 닉네임이 다르다면 중복 확인을 수행
    boolean isDuplicate = false;
    if (!currentNickname.equals(nickname)) {
        isDuplicate = userDAO.NickCheck(nickname); // 닉네임 중복 확인
    }
    
    response.setContentType("application/json"); // JSON 형식으로 응답을 보냄
    
    if (isDuplicate) {
        out.println("{ \"status\": \"duplicate\", \"nickDuplication\": \"nickDuplicate\" }");
    } else {
        out.println("{ \"status\": \"available\", \"nickDuplication\": \"nickAvailable\" }");
    }
%>