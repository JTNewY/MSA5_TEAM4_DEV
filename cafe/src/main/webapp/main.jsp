<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>DEV Cafe</title>

<!-- Fontawesome 아이콘+스크립트 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- 메인-->
	<jsp:include page="/layout/link_main.jsp" />
	
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
	

	<span id="top"></span>
	<input type="checkbox" name="bars" id="bars">


	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="static/img/slide02.gif">
			</div>
			<div class="swiper-slide" img src="">
				<img src="static/img/slide01.gif">
			</div>
			<div class="swiper-slide" img src="">
				<img src="static/img/slide02.gif">
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>

	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>

	<!-- 플로팅 버튼 -->
	<div class="floating">
		<a href="#top"><i class="fa fa-arrow-circle-up"></i></a>
	</div>


	<div class="container">
		<!-- 카드뷰 -->
		<section id="section2">
			<div class="content-box">
				<h3>음료 메뉴</h3>
				<ht></ht>
				<hr />

				<p></p>
				<div class="card-box row justify-content-around">
					<!-- 카드1 -->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn01.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">아메리카노</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							진한 에스프레소에 시원한 정수물과 얼음을 더하여 데브커피의 깔끔하고 강렬한 
							에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 3000원</li>
						</ul>
						<div class="card-body">
							<a href="detail01.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드2-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn02.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">녹차라떼</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">제주 천년의 숲 비자림을 연상시키는 음료로 제주 유기농
							 말차와 콜드 브루가 조화로운 제주 특화 라떼</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 305(mg)</li>
							<li class="list-group-item">가격: 4000원</li>
						</ul>
						<div class="card-body">
							<a href="detail02.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<!--카드3-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn03.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">말차푸치노</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">깊고 진한 말차 본연의 맛과 향을
                                시원하고 부드럽게 즐길 수 있는 프라푸치노</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 60(mg)</li>
							<li class="list-group-item">가격: 4500원</li>
						</ul>
						<div class="card-body">
							<a href="detail03.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<!--카드4-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn04.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">망고패션 블렌디드</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">망고 패션 프루트 주스와 패션 탱고 티가 상큼하게 어우러진 과일 블렌디드</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 0(mg)</li>
							<li class="list-group-item">가격: 4000원</li>
						</ul>
						<div class="card-body">
							<a href="detail04.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<h> </h>
					<!--카드5-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn05.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">쑥떡푸치노</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">쫄깃쫄깃한 흑임자 떡으로 씹는 재미를 즐길 수 있는 음료.
                                고소한 국내산 흑임자와 달콤하고 고소한 쑥떡 토핑이 올라간 음료</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 0(mg)</li>
							<li class="list-group-item">가격: 5000원</li>
						</ul>
						<div class="card-body">
							<a href="detail05.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드6-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn06.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카라멜 마끼아또</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">향긋한 바닐라 시럽과 시원한 우유와 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로
							 카라멜 드리즐을 올린 달콤한 커피 음료</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 75(mg)</li>
							<li class="list-group-item">가격: 4500원</li>
						</ul>
						<div class="card-body">
							<a href="detail06.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드7-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn07.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">흑당라떼</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">밀크 쉐이크 같은 부드럽고 달콤한 바닐라 크림 프라푸치노에 깊은 풍미의 
							단맛을 가진 흑당시럽이 어우러진 부드럽고 달콤한 프라푸치노</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 0(mg)</li>
							<li class="list-group-item">가격: 4500원</li>
						</ul>
						<div class="card-body">
							<a href="detail07.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드8-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn08.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">돌체라떼</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">깊은 에스프레소와 깔끔한 무지방 우유가 어우러진 달콤한 음료. 
							커피 향과 부드러운 연유의 조화가 아주 멋진 커피입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 75(mg)</li>
							<li class="list-group-item">가격: 4500원</li>
						</ul>
						<div class="card-body">
							<a href="detail08.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<p>
					<hr>
					</hr>
					</p>
					</p>
	
				<div style="margin-top: 10px;" class="card-body">
					<a href="menu.jsp" style="color: #332b23; font-size: 30px; font-weight: 800;"><p style="text-align: center;"> 전체메뉴 ▶</p></a>
				</div>				
		</section>
		

		<!-- 레이아웃B -->
		<section id="section4" class="layout-detail reverse">
			<div style="margin-top: 40px;" class="inner">
				<div class="detail-left">
					<img src="./static/img/sec-04.jpg" alt="섹션4 이미지">
				</div>
				<div class="detail-right">
					<div class="content-box">
						<h3>개발자들이 직접따온 커피콩으로 제조</h3>
						<p>Developers brew coffee with beans they personally picked.</p>
					</div>
					<div class="btn-box">
						<a href="" class="btn">카페 소개</a>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />

</body>
</html>