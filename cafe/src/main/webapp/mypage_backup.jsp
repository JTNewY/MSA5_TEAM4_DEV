<%@page import="cafe.Service.OrderService"%>
<%@page import="java.util.List"%>
<%@page import="cafe.DTO.Orders"%>
<%@page import="cafe.Service.OrderService"%>
<%@page import="cafe.Service.OrderServiceImpl"%>
<%@page import="cafe.DTO.Users"%>
<%@page import="cafe.Service.UserServiceImpl"%>
<%@page import="cafe.Service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!--
******************************	
		  마이 페이지
******************************	

param.msg == 1 수정성공
param.msg == 2 수정실패
param.msg == 3 닉네임 중복 
param.msg == 4 닉네임 가능 O

*******************************
-->	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<!-- 메인 배너 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	
	<jsp:include page="/layout/link_complete.jsp" />
<title>마이페이지</title>

<!-- Fontawesome 아이콘+스크립트 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	/********************************* 세션이 없을때 로그인페이지로 이동*******************************************/
	    // 세션에서 loginUser 속성을 가져옴
Object loginUserObj = session.getAttribute("loginUser");
Object loginAdminObj = session.getAttribute("loginAdmin");

// loginUser 속성이 없을 경우 또는 loginAdmin 속성이 없을 경우 로그인 페이지로 리다이렉트
if (loginUserObj == null && loginAdminObj == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
}
    /**************************************************************************************************/
%>

<script>
    $(document).ready(function () {
        $(".checkNick").click(function () {
            var nickname = $("input[name='Nickname']").val(); // 입력된 닉네임 가져오기
            $.ajax({
                url: "checkNickname.jsp", // 닉네임 중복 확인을 수행하는 JSP 페이지
                type: "POST",
                data: { nickname: nickname }, // 서버에 전달할 데이터 (사용자가 입력한 닉네임)
                dataType: "json", // JSON 형식으로 응답을 받음
                success: function (response) {
                    if (response.status === "duplicate") {
                        alert("이미 사용 중인 닉네임입니다.");
                    } else if (response.status === "available") {
                        alert("사용 가능한 닉네임입니다.");
                    }
                    // 닉네임 중복 확인 결과를 nickDuplication 값으로 설정
                    $("#nickDuplication").val(response.nickDuplication);
                },
                error: function () {
                    alert("서버와 통신 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>


  
<%
    // 기타 코드 작성

    // 회원정보가 수정 성공 또는 실패한 경우에 대한 메시지를 출력합니다.
    String message = "";
    if (request.getParameter("msg") != null) {
        int msg = Integer.parseInt(request.getParameter("msg"));
        if (msg == 1) {
            message = "수정 성공!";
        } else if (msg == 2) {
            message = "수정 실패!";
        }else if (msg == 3) {
            message = "확인 비밀번호가 같지 않습니다!";
        }else if (msg == 4) {
            message = " 비밀번호 길이가 8자 이상이여야 합니다!";
        }else if (msg == 5) {
            message = "특수문자 1가 들어가있어야합니다!";
        }
    }
%>

<script>
    var message = "<%= message %>";
    if (message !== "") {
        alert(message); // 수정된 부분: showAlert 대신 alert 함수 사용
    }
</script>

	<%
	/* userNo로 불러옴 */
	
	Users loginUser = (Users) session.getAttribute("loginUser"); 
	String userId = loginUser.getUser_id();
	

	
	%>
	
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp" />
    
    
 <!-- 마이페이지 테이블 시작 -->
 
 	<%
	   OrderService orderService = new OrderServiceImpl();
	   int userNo = (int) session.getAttribute("userNo");
	   Orders orders = new Orders();
	   orders.setUser_no(userNo);
	   List<Orders> orderList = orderService.list(orders);
	%>
 
<div class="container py-5">

<main>

  <div class="row g-5">
	  
	  
	     <div class="col-md-5 col-lg-4 order-md-last">
      <%{
        	int ordersum=0;
        	for (Orders order : orderList) {
        	ordersum += order.getCnt();
        
        	
        %>
          <% } %>
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-success">구매내역</span>
        <span class="badge bg-success rounded-pill"><%= ordersum %></span>
      </h4>
    <% } %>
      
		  
	  <ul class="list-group mb-3">
    <% if (orderList == null || orderList.size() == 0) { %>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <h6 class="my-0">주문내역이 없습니다.</h6>
            </div>
        </li>
    <% } else { 
        for (Orders order : orderList) { %>
            <li class="list-group-item d-flex justify-content-between lh-sm">
                <div>
                    <h6 class="my-0"><%= order.getFood_code() %></h6>
                    <small class="text-body-secondary"><%= order.getCnt() %>(개)</small>
                </div>
                <span class="text-body-secondary"><%= order.getFood().getPrice() %></span>
            </li>
        <% } %>
    <% } %>
    
     <% if (orderList == null || orderList.size() == 0) { %>
    <li class="list-group-item d-flex justify-content-between">
        <span>Total (KR)</span>
        <strong>0</strong>
    </li>
		<% } else { 
		    int total = 0;
		    for (Orders order : orderList) {
		        total += order.getTotal_price();
		    }
		%>
		    <li class="list-group-item d-flex justify-content-between">
		        <span>Total (KR)</span>
		        <strong><%= total %></strong>
		    </li>
		<% } %>
        
</ul>







      <form class="card p-4">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Promo code">
          <button type="submit" class="btn btn-secondary">Redeem</button>
        </div>
      </form>
    </div>
    <div class="col-md-7 col-lg-8">
      <h4 class="mb-3">회원정보 수정</h4>
      <hr>






<!-- 데이터 입력 시작  -->
<form action="mypage_pro.jsp" class="more-padding" autocomplete="off" method="post">
	<!-- 조회할때 user_no를 확인해서 조회함 (숨겨짐)  -->
	<input type="hidden" id="no" name="id " value="<%= loginUser.getUser_no()%>">
      <form class="needs-validation" novalidate>
        <div class="row g-3">
          <div class="col-sm-6">
            <label for="userName" class="form-label">Name</label>
            <input type="text" placeholder="데이터에서 불러온 이름들어감(수정불가)" class="form-control"  
            id="userName" value="<%= loginUser.getUsername() %>" placeholder="" value="" disabled>
            <div class="invalid-feedback">
            </div>
          </div>
        

	<div class="col-sm-6">
            <label for="Nickname" class="form-label">Nickname</label>
            <span class="text-body-secondary" style="float:right;">
            </span>  
            <!--닉네임 설정  -->
            <div class="nicknameCheck">
                <div class="input-group">
                    <input type="text" name="Nickname" class="form-control" id="Nickname" value="<%=loginUser.getNickname()%>" onkeydown="inputNickChk()" required>     
                    <button class="checkNick btn btn-success" type="button" name="dbCheckNick" >중복확인</button>
                    <!-- 닉네임 중복 체크 여부 -->
                    <input type="hidden" name="nickDuplication" id="nickDuplication" value="nickUncheck" name="nickDuplication">
                </div>
            </div> <!-- nicknameCheck div 끝 -->
            <div class="invalid-feedback"></div>
        </div>

		<!-- 비밀번호  -->
          <div class="col-12">
            <label for="inputPW" class="form-label">Password</label>
            <input type="password" class="form-control" id="inputPW" name="inputPW" placeholder="비밀번호" required>
          </div>
        <!-- 비밀번호 확인  -->
          <div class="col-12">
            <label for="username" class="form-label">Comfirm Password</label>
            <div class="input-group has-validation">
              <input type="password" class="form-control" id="PWCHECK" name="PWCHECK" placeholder="비밀번호 확인" required>
              
            <div class="invalid-feedback">
        
              </div>
            </div>
          </div>

          <div class="col-12">
            <label for="email" class="form-label">Email <span class="text-body-secondary"><!-- 빈자리 --></span></label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com"
            value="<%= loginUser.getEmail() %>">
            <div class="invalid-feedback">
        
            </div>
          </div>

          <div class="col-12">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="<%= loginUser.getAddress() %>" 
            value="<%= loginUser.getAddress() %>"
            required>
            <div class="invalid-feedback">
        
            </div>
          </div>

          <div class="col-14">
            <label for=grade class="form-label">회원 등급 <span class="text-body-secondary">(월별 적용)</span></label>
            <input type="text" class="form-control" id="grade" name="grade" value="<%= loginUser.getGrade() %>" placeholder="회원등급 데이터" disabled>

        <hr class="my-4">

        <button class="w-100 btn btn-success btn-lg" type="submit">수정완료</button>
      </form>
    </form> 
<!--mypage_pro form 끝  -->


    </div>
     
  </div>
 
</main>


</div>








<jsp:include page="/layout/footer.jsp" />
</body>
</html>