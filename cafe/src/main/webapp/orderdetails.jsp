<%@page import="cafe.DTO.Orders"%>
<%@page import="java.util.List"%>
<%@page import="cafe.Service.OrderService"%>
<%@page import="cafe.Service.OrderServiceImpl"%>
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
<title>메인메뉴</title>

<!-- Fontawesome 아이콘+스크립트 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<title>Document</title>
<jsp:include page="/layout/link_orderdetails.jsp" />


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
    function confirmCancel() {
        // 주문 취소 여부를 묻는 팝업 창 표시
        var confirmCancel = confirm("주문을 취소하시겠습니까?");
        if (confirmCancel) {
            // 사용자가 "예"를 선택한 경우
            document.getElementById("cancelForm").submit(); // 폼 제출
        } else {
            // 사용자가 "아니오"를 선택한 경우
            // 아무런 동작이 필요하지 않음
        }
    }
</script>
	<%
	   OrderService orderService = new OrderServiceImpl();
	   String userId = (String) session.getAttribute("loginId");
	   
	   String userNick = (String) session.getAttribute("Nickname");
	   int userNo = (int) session.getAttribute("userNo");
	   Orders orders = new Orders();
	   orders.setUser_no(userNo);
	   
	   List<Orders> orderList = orderService.list(orders);
	%>
	


	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp" />

	<!-- 주문내역페이지 -->
	<div class="container">
		<section class="bg-light py-5">
			<h1 class="display-5 fw-bold text-center">주문 내역</h1>

			<div class="px-4 py-5 my-5 text-margin">
				<div class="list-wrapper">
					<div class="order-user" style="font-size: 30px;">주문 회원 :<%= userNick%>(<%= userId %>) </div>

					<a href="main.jsp"><button type="button"
							style="margin-right: 57px;"
							class="btn order-list">상품목록</button></a>
				</div>



				<table style="text-align: center;" class="table">
					<thead>
						<tr class="table table-dark table-hover">
							<th scope="col">No.</th>
							<th scope="col">주문일시</th>
							<th scope="col">상품명</th>
							<th scope="col">결제 금액</th>
							<th scope="col">수량</th>
							<th scope="col">주문</th>
							<th scope="col">환불</th>
						</tr>
							                            
							<% if( orderList == null || orderList.size() == 0 ) { %>
					    <tr>
					        <td colspan="7">주문내역이 없습니다.</td>
					    </tr>
								<% } else { 
								        for(Orders order : orderList) { %>
					<tr style="vertical-align: top;">    
						     <td><%= order.getOrder_no() %></td>
						     <td><%= order.getOrder_date() %></td>
						     <td><%= order.getFood_code() %></td>						   
						     <td><%= order.getTotal_price() %></td>
						     <td><%= order.getCnt() %></td>
						     <td>주문완료</td>
						     
						     <td style="display: flex; justify-content: center;">
			                    <!-- ---------------------------------------------- -->
			                    <form method="post" action="<%= request.getContextPath() %>/orderdetailDelete.jsp">
			                        <input type="hidden" name="delete" value="<%= order.getOrder_no() %>">
			                        <button type="submit" onclick="confirmCancel()" class="btn cancelbtn btn-outline-danger" style="float: right;">취소</button>
			                    </form>
			                    <!-- ---------------------------------------------- -->
				            </td>          
				     </tr>
				<%      } 
				   } %>
													
								        
			</tr>
				
					</tbody>
				</table>
			</div>
		</section>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>