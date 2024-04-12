<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <title>상세페이지 1 [아메리카노]</title>  
  
  <!-- Fontawesome 아이콘+스크립트 라이브러리 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

	<jsp:include page="/layout/link_detail.jsp" />

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

	<!-- 상품 상세 -->
    <div class="container">
        <!-- 레이아웃A -->
        <form action="detail_pro.jsp" method="post">        
            <section class="layout-detail">
                <div class="inner">
                    <div class="detail-left">
                        <img class="img-food" src="static/img/mn01.jpg" alt="아메리카노">
                    </div>
                    <div class="detail-right">
                        <div class="content-box">
                            <h3>아메리카노</h3>
                            <p>Developer Americano</p>
                            <hr>
                            <p>진한 에스프레소에 시원한 정수물과 얼음을 더하여 데브커피의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피</p>
                            <hr>
                            <div class="nutrition">
                                <h4>제품 영양 정보</h4>
                                <p>Tall(톨)/355ml (12fl oz)</p>
                            </div>
                            <hr>
                           <div class="nutrition-list">
                                <div class="nut-left">
                                    <p>1회 제공량(kcal)</p>
                                    <p>포화지방 (g)</p>
                                    <p>단백질 (g)</p>
                                    <p>나트륨 (mg)</p>
                                    <p>당류 (g)</p>
                                    <p>카페인 (mg)</p>
                                    <p>가격(원)</p>
                                </div>
                                <div class="nut-right">
                                    <p>10</p>
                                    <p>0</p>
                                    <p>1</p>
                                    <p>5</p>
                                    <p>0</p>
                                    <p>150</p>
                                    <p>3000</p>
                                </div>
                            </div>
                            
                            
                        </div>
                        <div class="btn-box">
                        	<input type="hidden" name="food_code" value="아메리카노" />
                        	<input type="hidden" name="price" value="3000" />
                            <input class="cnt" type="number" value="1" name="cnt" min="1" id="points" name="points" step="1">
                            <input type="submit" value="주문하기" class="btn" />
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </div>
    
  
  	<!-- 푸터  -->
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>