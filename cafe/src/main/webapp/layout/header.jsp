<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
	String AId = (String) session.getAttribute("loginAdminID");
	String AName = (String) session.getAttribute("AdminName");
	
	String Nick = (String) session.getAttribute("Nickname");
	String userId = (String) session.getAttribute("loginId");
	String userGrade = (String) session.getAttribute("usergrade");
    // 사용자가 로그아웃을 눌렀을 때의 URL
    String logoutUrl = "./login.jsp";
    
    
    boolean isAdmin = (AId != null && !AId.isEmpty()); // 어드민 확인여부 (true, false)
   
%>

<script>
    var userId = "<%= userId %>"; 
</script>
<!-- util -->
<div class="util">
    <ul class="util-menu">
        <% if (isAdmin) { %>
            <!-- Admin 계정일 때의 출력 -->
            <li style="color:#FFD400; "><span style="font-weight: bold;"><%=AName %>(<%=AId%>)</span> 관리자님 환영합니다.</li>
            <li><a href="./userManagement.jsp">관리자 페이지</a></li>

        <% } else { %>
            <!-- 사용자 계정일 때의 출력 -->
            <li style="color:#FFD400;"><span style="font-weight: bold;"><%=Nick %>(<%=userId%>)</span> 님 환영합니다.</li>
            <li><a href="mypage.jsp">내 정보</a></li>
        <% } %>
        <li>
            <a href="javascript:void(0);" onclick="confirmLogout()">로그아웃</a>
        </li>
    </ul>
</div>
<script>
    // 로그아웃 확인창 표시
    function confirmLogout() {
        if (confirm("로그아웃 하시겠습니까?")) {
            // 예를 선택한 경우 로그아웃 페이지로 이동
            window.location.href = "logout.jsp";
        } else {
            // 아니오를 선택한 경우 아무 작업도 수행하지 않음
        }
    }
</script>

<header>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a href="./main.jsp"><img src="./static/img/logo00.png"><a class="navbar-brand" href="./main.jsp" img src="./static/img/logo00.png">DEVcafe</a></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./main.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                         <a class="nav-link" href="menu.jsp">Menu</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">

                        </a>
                        <ul class="dropdown-menu">
                         <%-- 일반사용자한테 나옴 --%>
                      	   <% if (session.getAttribute("loginUser") != null) { %>
                            <li><a class="dropdown-item" href="./orderdetails.jsp">주문내역 페이지</a></li>
                            <li><a class="dropdown-item" href="./mypage.jsp">마이페이지</a></li>
                            <li>
                            <% } %>
                            <%-- 관리자로 로그인했을 때만 보여지도록 함 --%>
                             <% if (session.getAttribute("loginAdmin") != null) { %>
                            <li><a class="dropdown-item" href="./userManagement.jsp">관리자 페이지</a></li>
                            <%	} %>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="./menu.jsp">Coffee & Dessert</a></li>
                        </ul>
                    </li>
                    
                    
                   
                    
                    <%-- 관리자로 로그인했을 때만 보여지도록 함 --%>
                <% if (session.getAttribute("loginAdmin") != null) { %>
                 <li class="nav-item">
                        <a class="nav-link" style="color:green; font-weight:bold;">CoffeManager</a>
                    </li>
                    
                <% } %>
                	<%-- 일반사용자로 로그인했을 때, 등급표시 --%> 
                 <% if (session.getAttribute("loginUser") != null) { %>
                 <li class="nav-item">
                        <a class="nav-link" style="color:#688A08; font-weight:bold;">등급 : <span style="color:silver; font-weight:bold;"><%=userGrade%></span> </a>
                    </li>
                    
                <% } %>
                    
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

</header>


<!-- 플로팅 버튼 -->
<div class="floating" style="z-index: 10;">
    <a href="#top" style="z-index: 11;"><i style="margin-top: 10px;" class="fa fa-arrow-circle-up"></i></a>
</div>