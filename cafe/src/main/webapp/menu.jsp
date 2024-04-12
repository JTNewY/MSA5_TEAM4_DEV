<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
******************************	
		개발자커피 메인화면
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

<!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2"><p class="lead fw-normal text-white-50 mb-4">제주도에서 직접 개발자들이 따온</p> 개발자 말차 푸치노</h1>
                                <p class="lead fw-normal text-white-50 mb-4">왜 개발자들이 일하다 말고 제주도가서 녹찻잎을 따왔을까? 그 안에 서려있는 개발자의 진한 피땀눈물을 즐겨보세요! </p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-success btn-lg px-4 me-sm-3" href="#features">구매하기</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="detail03.jsp">상세보기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-4 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="./static/img/mn03.jpg" alt="..." /></div>
                    </div>
                </div>
            </header>
	<span id="top"></span>
	<input type="checkbox" name="bars" id="bars">



	<!-- 플로팅 버튼 -->
	<div class="floating">
		<a href="#top"><i class="fa fa-arrow-circle-up"></i></a>
	</div>


	<div class="container">
	
		<!-- 카테고리 -->

		<div class="content-box">
			<hr />
			<div class="row">
				<div class="col-md-3">
					<div class="category">
						<!-- 카테고리별로 필터링하는 링크를 추가할 수 있습니다 -->
					</div>
				</div>
				<!-- 필요한 만큼 더 많은 카테고리를 추가하세요 -->
			</div>
		</div>
		</section>
		

		<!-- 음료 메뉴 -->
		<section id="section2">
			<div class="content-box">
				<h3>음료 메뉴</h3>
				<hr>
				<div class="card-box row justify-content-around">
					<!-- 카드뷰 -->
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							제주 천년의 숲 비자림을 연상시키는 음료로 제주 유기농
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							깊고 진한 말차 본연의 맛과 향을
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							망고 패션 프루트 주스와 패션 탱고 티가 상큼하게 어우러진 과일 블렌디드</p>
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							쫄깃쫄깃한 흑임자 떡으로 씹는 재미를 즐길 수 있는 음료.
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							향긋한 바닐라 시럽과 시원한 우유와 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							밀크 쉐이크 같은 부드럽고 달콤한 바닐라 크림 프라푸치노에 깊은 풍미의 
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
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							깊은 에스프레소와 깔끔한 무지방 우유가 어우러진 달콤한 음료. 
							커피 향과 부드러운 연유의 조화가 아주 멋진 커피입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 75(mg)</li>
							<li class="list-group-item">가격: 4500원</li>
						</ul>
						<div class="card-body">
							<a href="detail08.jsp" class="btn btn-success">상세보기</a>
		</section>

	<!-- 디저트메뉴 -->
		<hr>
		<h3>디저트 메뉴</h3>
				<hr />
				<div class="card-box row justify-content-around">
					<!-- 카드뷰 -->
					<!-- 카드1 -->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn01_1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">가나슈 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6000원</li>
						</ul>
						<div class="card-body">
							<a href="dessert01.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드2-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn02_2.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">레드벨벳 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6000원</li>
						</ul>
						<div class="card-body">
							<a href="dessert02.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<!--카드3-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn03_3.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">말차 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert03.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<!--카드4-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn04_4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">꾸덕덕 치즈케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert04.jsp" class="btn btn-success" id="btn01">상세보기</a>
						</div>
					</div>
					<h> </h>
					<!--카드5-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn05_5.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">딸기 생크림케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert05.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드6-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn06_6.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">한라봉 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 7500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert06.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드7-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn07_7.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">딸기초코 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 150(mg)</li>
							<li class="list-group-item">가격: 6500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert07.jsp" class="btn btn-success">상세보기</a>
						</div>
					</div>
					<!--카드8-->
					<div class="card" style="height: auto; width: 18rem;">
						<img src="./static/img/mn08_8.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">티라미슈 케이크</h5>
							<p class="card-text" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
							초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">카페인 함량: 0(mg)</li>
							<li class="list-group-item">가격: 6500원</li>
						</ul>
						<div class="card-body">
							<a href="dessert08.jsp" class="btn btn-success">상세보기</a>
							</div>
							</div>
							</div>
							
</div>

	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>