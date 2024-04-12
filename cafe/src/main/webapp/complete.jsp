<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
******************************	
		주문완료페이지
******************************	
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
<title>주문 완료</title>

<!-- Fontawesome 아이콘+스크립트 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	
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
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp" />
	
	<!-- 주문완료페이지 -->
	<div class="container">
		<section class="bg-light py-5">
			<div class="px-4 py-5 my-5 text-center">
				<img class="d-block mx-auto mb-4" src="./static/img/complete.png"
					alt="" width="100" height="100">
				<h1 class="display-5 fw-bold">주문이 완료되었습니다.</h1>
				<div class="col-lg-6 mx-auto">
					<p class="lead mb-4">음료가 준비되면 알려드리겠습니다.</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
						<a href="orderdetails.jsp">
							<button type="button" class="btn btn-primary btn-lg px-4 gap-3">주문내역</button>
						</a>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />
	
</body>
</html>



