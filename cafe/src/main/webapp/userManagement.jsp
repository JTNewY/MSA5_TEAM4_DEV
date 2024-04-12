<%@page import="cafe.Service.OrderServiceImpl"%>
<%@page import="cafe.Service.OrderService"%>
<%@page import="cafe.DTO.Orders"%>
<%@page import="cafe.DTO.Users"%>
<%@page import="java.util.List"%>
<%@page import="cafe.Service.UserService"%>
<%@page import="cafe.Service.UserServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
******************************   
      유저 관리자 페이지
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

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="./date/js/bootstrap-datepicker.js"></script>


<link rel="stylesheet" href="./date/css/bootstrap-datepicker3.standalone.css">



<!--한국어  달력 쓰려면 추가 로드-->
<script src="./date/js/bootstrap-datepicker.ko.min.js"></script>
<jsp:include page="/layout/header.jsp" />
</head>
<body>



<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="./date/js/bootstrap-datepicker.js"></script>


<!--한국어  달력 쓰려면 추가 로드-->
<script src="./date/js/bootstrap-datepicker.ko.min.js"></script>




    
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

<%
    UserService userService = new UserServiceImpl();
    OrderService orderService = new OrderServiceImpl();
    List<Users> userList = userService.list();
      
    String selectedDate = request.getParameter("datePicker");
    List<Orders> orderList = orderService.getOrderByDate(selectedDate);
    
    boolean hasOrder = orderList != null && !orderList.isEmpty();
    
%>



<!-- 사용자 관리 페이지 -->
<div class="container">
    <h2 class="text-center my-5">사용자 관리</h2>
    <div>
        <input type="text" id="datePicker" name="datePicker" class="form-control" value="" style="width:300px">
    </div>
    <div class="table-responsive">
        <table style="text-align: center;" class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">주문번호</th>
                    <th scope="col">회원번호</th>
                    <th scope="col">ID</th>
                    <th scope="col">사용자명</th>
                    <th scope="col">주문내역</th>
                    <th scope="col">주문시간</th>
                    <th scope="col"></th>
                    <th scope="col">환불</th>
                </tr>
            </thead>
            <tbody id="orderList">
                   <% if (hasOrder) {
                    for (Orders order : orderList) { 
                %>
                <tr>   
                    <td><%= order.getOrder_no() %></td>
                    <td><%= order.getUsers().getUser_no() %></td>
                    <td><%= order.getUsers().getUser_id() %></td>
                    <td><%= order.getUsers().getUsername() %></td>
                    <td><%= order.getFood_code() %></td>
                    <td><%= order.getOrder_date() %></td>
                    <td><%= order.getOrder_time() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <!-- 주문 내역이 없을 때 -->
                <tr>
                    <td colspan="7" style="text-align: center;">해당 날짜에 주문 내역이 없습니다.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>

$(document).ready(function () {
    // 오늘 날짜 가져오기
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해줍니다.
    var day = today.getDate().toString().padStart(2, '0'); // 일은 1부터 시작합니다.

    // 오늘 날짜를 yyyy-mm-dd 형식으로 포맷팅
    var todayFormatted = year + '-' + month + '-' + day;

    // Datepicker 초기화
    $('#datePicker').datepicker({
        format: "yyyy-mm-dd",
        startDate: '-10d',
        language: "ko",
        autoclose: true,
        todayHighlight: true
    }).val(todayFormatted).trigger('change'); // 기본값으로 오늘 날짜 설정

    // 주문 내역을 로드하는 함수
    function loadOrderList(selectedDate) {
        $.ajax({
            url: "<%= request.getContextPath() %>/userManagement.jsp",
            method: "POST",
            data: { datePicker: selectedDate },
            success: function (response) {
                var tableBody = $('#orderList');
                tableBody.empty();
                // 서버에서 받은 HTML에서 필요한 정보만을 추출하여 추가
                var hasData = false;
                $(response.trim()).find('tr').each(function () {
                    var orderId = $(this).find('td:eq(0)').text();
                    var userId = $(this).find('td:eq(1)').text();
                    var userName = $(this).find('td:eq(2)').text();
                    var foodName = $(this).find('td:eq(4)').text();
                    var orderDate = $(this).find('td:eq(5)').text();
                    var orderTime = $(this).find('td:eq(6)').text(); // 주문 시간 데이터 추가
                    var refund = "";

                    // 주문 내역이 있는 경우에만 행을 추가
                    if (orderId !== '') {
                        hasData = true;
                        // 필요한 정보만을 포함한 새로운 행을 추가
                        tableBody.append('<tr><td>' + orderId + '</td><td>' + userId + '</td><td>' + userName + '</td><td>' + foodName + '</td><td>' + orderDate + '</td><td>' + orderTime + '</td><td>' + refund + '</td><td><button type="button" class="btn cancelbtn btn-outline-danger" style="float: center;">취소</button></td></tr>');
                    }
                });

                // 데이터가 없으면 취소 버튼 숨기기
                if (!hasData) {
                    $('.cancelbtn').hide();
                } else {
                    $('.cancelbtn').show();
                }
            },
            error: function () {
                alert("주문 내역을 불러오는데 실패했습니다.");
            }
        });
    }

    // 페이지 로드 시 오늘 날짜로 주문 내역 로드
    loadOrderList(todayFormatted);

    // Datepicker 값이 변경될 때마다 주문 내역 다시 로드
    $('#datePicker').on('change', function () {
        var selectedDate = $(this).val();
        loadOrderList(selectedDate);
    });

    // 취소 버튼 클릭 시 주문 취소
    $('#orderList').on('click', '.cancelbtn', function () {
        var orderNo = $(this).closest('tr').find('td:eq(0)').text();
        cancelOrder(orderNo);
    });

    // 주문 취소 함수
    function cancelOrder(orderNo) {
    // 확인 대화상자 표시
    if (confirm("주문을 취소하시겠습니까?")) {
        // 사용자가 확인을 클릭한 경우
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath() %>/userManagementDelete.jsp",
            data: { delete: orderNo },
            success: function (response) {
                // 성공적으로 처리되었을 때의 동작
                alert("주문이 취소되었습니다.");
                // 페이지 새로고침
                location.reload();
            },
            error: function () {
                // 오류 발생 시의 동작
                alert("주문 취소에 실패했습니다.");
            }
        });
    }
}
});
</script>
 <jsp:include page="/layout/footer.jsp" />
</body>
</html>