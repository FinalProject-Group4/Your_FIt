<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#dropdown01, #dropdown02, #dropdown03, #dropdown04 {
	font-size: 20px;
}
</style>
<!-- Basic -->
<c:set var="path"
	value="${requestScope['javax.servlet.forward.servlet_path']}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Site Metas -->
<title>Cloapedia - Stylish Magazine Blog Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/images/apple-touch-icon.png">

<!-- Design fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,400i,500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">

<!-- FontAwesome Icons core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

<!-- Responsive styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/responsive.css"
	rel="stylesheet">

<!-- Colors for this template -->
<link href="${pageContext.request.contextPath}/resources/css/colors.css"
	rel="stylesheet">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<div id="wrapper">

	<div class="topbar-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6 hidden-xs-down">
					<div class="topsocial">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#">다이어트 정보</a></li>
							<li class="list-inline-item"><a href="#">쇼핑몰</a></li>
						</ul>
						<!-- end ul -->
					</div>
					<!-- end social -->
				</div>
				<!-- end col -->

				<div class="col-lg-8 hidden-md-down">
					<div class="topmenu text-right">
						<ul class="list-inline">
							<c:choose>
							<c:when test="${empty member}">
								<li class="list-inline-item"><a
									href="${pageContext.request.contextPath}/member/login.do"><i
										class="fa fa-user-circle-o"></i> 로그인</a></li>
								<li class="list-inline-item"><a href="#"><i
										class="fa fa-user-circle-o"></i> 회원가입</a></li>
							</c:when>
							<c:when test="${!empty member and member.m_Id eq 'admin' || !empty member and member.m_Id eq 'ADMIN'}">
								<li class="list-inline-item">
									<i class="fa fa-user-circle-o"></i>${member.m_Nick}님 안녕하세요
								</li>
								<li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/Logout.do">로그아웃</a></li>
								<li class="list-inline-item"><a href="#">관리자 페이지</a></li>
							</c:when>
							<c:otherwise>
								<li class="list-inline-item">
									<i class="fa fa-user-circle-o"></i>${member.m_Nick}님 안녕하세요
								</li>
								<li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/Logout.do">로그아웃</a></li>
								<li class="list-inline-item"><a href="#">마이페이지</a></li>
								<li class="list-inline-item"><a href="#">주문배송조회</a></li>
								<li class="list-inline-item"><a href="#">장바구니</a></li>
							
							</c:otherwise>
							</c:choose>
						</ul>
						<!-- end ul -->
					</div>
					<!-- end topmenu -->
				</div>
				<!-- end col -->

			</div>
			<!-- end row -->
		</div>
		<!-- end header-logo -->
	</div>
	<!-- end topbar -->

	<div class="header-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> <img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							width="300px" height="100px">
						</a>
					</div>
					<!-- end logo -->
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end header-logo -->
	</div>
	<!-- end header -->

	<header class="header">
		<div class="container">
			<nav class="navbar navbar-inverse navbar-toggleable-md">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#cloapediamenu" aria-controls="cloapediamenu"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="cloapediamenu">
					<ul class="navbar-nav col-12">
						<c:choose>
							<c:when test="${fn:contains(path,'shop')}">
								<li class="nav-item dropdown has-submenu col-2"><a
									class="nav-link dropdown-toggle" href="#" id="shop_dropdown01"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">카테고리</a>
									<ul class="dropdown-menu" aria-labelledby="shop_dropdown01">
										<li><a class="dropdown-item" href="#">야채·채소류</a></li>
										<li><a class="dropdown-item" href="#">육류</a></li>
										<li><a class="dropdown-item" href="#">해산물류</a></li>
										<li><a class="dropdown-item" href="#">가공식품</a></li>
									</ul></li>
								<li class="nav-item col-2"><a
									class="nav-link color-pink-hover" href="#">신상품</a></li>
								<li class="nav-item col-2"><a
									class="nav-link color-pink-hover" href="#">베스트 상품</a></li>
								<li class="nav-item col-2"><a
									class="nav-link color-pink-hover" href="#">할인 상품</a></li>
								<form class="form-inline my-2 my-lg-0 col-4">
									<input class="form-control mr-sm-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-success my-2 my-sm-0"
										type="submit">Search</button>
								</form>
							</c:when>

							<c:otherwise>
								<li class="nav-item dropdown has-submenu col-3"><a
									class="nav-link dropdown-toggle" href="#" id="dropdown01"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">다이어트 꿀팁</a>
									<ul class="dropdown-menu col-3" aria-labelledby="dropdown01">
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardList.do">전체</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListCal.do">칼럼</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListExe.do">운동</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListDiet.do">식단</a></li>
									</ul></li>

								<li class="nav-item dropdown has-submenu col-3"><a
									class="nav-link dropdown-toggle" href="#" id="dropdown02"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">홈트레이닝</a>
									<ul class="dropdown-menu" aria-labelledby="dropdown02">
										<li><a class="dropdown-item" href="#">전체</a></li>
										<li><a class="dropdown-item" href="#">전신</a></li>
										<li><a class="dropdown-item" href="#">복부</a></li>
										<li><a class="dropdown-item" href="#">상체</a></li>
										<li><a class="dropdown-item" href="#">하체</a></li>
										<li><a class="dropdown-item" href="#">스트레칭</a></li>

									</ul></li>

								<li class="nav-item col-3"><a
									class="nav-link color-pink-hover" href="#" id="dropdown03">칼로리
										사전</a></li>

								<li class="nav-item dropdown has-submenu col-3"><a
									class="nav-link dropdown-toggle" href="#" id="dropdown04"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">커뮤니티</a>
									<ul class="dropdown-menu" aria-labelledby="dropdown04">
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coList.do">전체</a></li>
										<li><a class="dropdown-item" href="#">식단</a></li>
										<li><a class="dropdown-item" href="#">운동</a></li>
										<li><a class="dropdown-item" href="#">팁&노하우</a></li>
										<li><a class="dropdown-item" href="#">고민&질문</a></li>
										<li><a class="dropdown-item" href="#">관리자에게</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</nav>
		</div>
</div>
<!-- end container -->
</header>
<!-- end header -->
