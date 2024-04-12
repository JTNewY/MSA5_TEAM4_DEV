<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--  
**********************************	
		로그인 및 회원가입 화면
**********************************	
-->
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link href="<%= request.getContextPath() %>/logincss/css/login.css" rel="stylesheet" />
  
  <script>
  	function showAlert(message){
  		alert(message);
  	}
  </script>
</head>
<body>
	<!-- 
**************** msg 코드 *******************

	param.msg == 0 아이디 비밀번호 일치X
	param.msg == 1 로그인 성공
	param.msg == 6 아이디와 비밀번호 입력X
	
	param.msg == 3 회원가입 실패
	param.msg == 4 회원가입 성공
	param.msg == 5 중복된 아이디 O
	param.msg == 6 확인 비밀번호가 같지 X
	param.msg == 7 비밀번호 유효성 X
	
*********************************************
	 -->
	 
	<%
		// 아이디 저장 스크립틀릿
		String rememberId = "";
		String userId = "";
		Cookie[] cookies = request.getCookies();
		if ( cookies != null ){
			for(int i = 0; i< cookies.length ; i++){
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			String cookieValue = URLDecoder.decode(cookie.getValue(),"UTF-8" );
			switch(cookieName){
			case "userId" : userId = cookieValue; break;
			case "rememberId" : rememberId = cookieValue; break;
				}
			
			}
		}
		
	%>
	 <!-- 동영상 삽입 -->
   <video autoplay muted loop id="myVideo">
  <source src="static/video/movie.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>
	
	
  <div class="container">
  
    <div class="welcome">
      <div class="pinkbox">
        <div class="signup nodisplay">
          <h1>register</h1>
          <c:if test="${ param.msg == 3 }">
          <script>
				showAlert("회원가입에 실패하였습니다.");
			</script>
		<p style="color: red;">회원가입에 실패하였습니다.</p>
		</c:if>
		
		<c:if test="${ param.msg == 4 }">
		<script>
				showAlert("회원가입 성공");
			</script>
		<p style="color: red;">회원가입 성공</p>
		</c:if>
		
		 <c:if test="${ param.msg == 5 }">
		 <script>
				showAlert("중복된 아이디가 존재합니다.");
			</script>
		 
		<p style="color: red;">중복된 아이디가 존재합니다.</p>
		</c:if>
		<c:if test="${ param.msg == 6 }">
			<script>
				showAlert("비밀번호가 같지 않습니다.");
			</script>
			<p style="color: red;">비밀번호가 같지않습니다.</p>
		</c:if>
		<c:if test="${ param.msg == 7 }">
         <script>
            
            showAlert("8글자 이상, 영문, 숫자, 특수문자를 사용하세요");
         </script>
         <p style="color: red;">8글자 이상, 영문, 숫자, 특수문자 사용하세요.</p>
      </c:if>           
		
          <form action ="register_pro.jsp" method="post">
          <form autocomplete="off">
          
       		<input type="text" name="add_id" id="add_id" placeholder="user_id">
            <input type="text" name="add_username" id="add_username"placeholder="username">
            <input type="email" name="add_email"id="add_email" placeholder="email">
            <input type="password" name="add_pw" id="add_pw" placeholder="password">
            <input type="password" name="confirmPW" id="confirmPW" placeholder="confirm password">
            
             <div class="checkbox ">
              <input type="radio" name="gender" id="male" value="남자" checked/><label for="male">Male</label>
            </div>
             <div class="checkbox check1">
              <input type="radio" name="gender" id="female" value="여자"/><label for="female">Female</label>
            </div>
            <button class="button submit">create account </button>
            
         	 </form>
          </form>
          </div>
        
       <!-- 로그인창 -->
        <div class="signin">
          <h1>sign in</h1>
         <form action="login_pro.jsp" class="more-padding" autocomplete="off" method="post">
           
            <input type="text" name="id" id ="id" value="<%= userId %>" placeholder="username">
            <input type="password" name="password" id ="password" placeholder="password">
           <!-- 아이디 저장 -->
           
           <div class="checkbox">
		    <input type="checkbox" id="remember" name="rememberId" <%= rememberId.equals("on") ? "checked" : "" %> />
		    <label for="remember" draggable="true">Save loginID</label>
		</div>
  			<c:if test="${ param.msg == 0 }">
			<p style="color:red;">
				아이디 또는 비밀번호가 일치하지 않습니다.
			</p>
			</c:if>
			
            <button class="button submit">login</button>
          </form>
        </div>
      </div>
      
      
      <div class="leftbox">
        <h2 class="title"><span>4조 카페</span>&<br>회원가입</h2>
        <p class="desc">pick your perfect <span>bouquet</span></p>
        <img class="flower smaller" src="https://i.ibb.co/LzcwzLd/logo00.png" alt="1357d638624297b" border="0">
        <p class="account">have an account?</p>
        <button class="button" id="signin">login</button>
      </div>
      <div class="rightbox">
        <h2 class="title"><span>4조 카페</span>&<br>로그인</h2>
        <p class="desc"> pick your perfect <span>bouquet</span></p>
        <img class="flower" src="https://i.ibb.co/LzcwzLd/logo00.png"/>
        <p class="account">don't have an account?</p>
        <button class="button" id="signup">sign up</button>
      </div>
    </div>
   </div>
  
 
 <script src="logincss/js/jquery-3.7.1.min.js"></script>
 <script src="logincss/js/login.js"></script>

</body>
</html>