<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!-- 부트 스트랩 불러오기 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<style>
#menu_bar {
	background-color: gainsboro;
	height: 40px;
}

#menu_bar>ul>li>a, #submenu>ul>li>a {
	color: black;
}

#logo {
	text-align: right;
}

#submenu {
	position: absolute;
	top: 40px;
	left: 120px;
	height: 80px;
	border: 1px solid black;
}

#submenu>ul>li>a {
	line-height: 60px;
}

#submenu2 {
	left: 120px;
	background-color: palevioletred;
}

#submenu2>ul>li>a {
	color: white;
}
</style>
<header>
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<a href="${pageContext.request.contextPath}"> 
						<img src="${pageContext.request.contextPath}/resources/images/logo.png" height="120px"width="120px"> 
					</a>
					<div class="col-10" id="menu_bar">
						<ul class="nav nav-pills nav-justified">
						<c:if test="${empty member}">
							<c:if test="${fn:contains(path,'diet')||fn:contains(path,'')}">
								<li class="nav-item" style="background-color: white"><a class="nav-link" href="${pageContext.request.contextPath}">다이어트 정보</a></li>
								<li class="nav-item"><a class="nav-link" href="#">쇼핑몰</a></li>
							</c:if>
							<c:if test="${fn:contains(path,'shop')}">
							    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}">다이어트 정보</a></li>
								<li class="nav-item" style="background-color: white"><a class="nav-link" href="#">쇼핑몰</a></li>
							</c:if>
							<li class="nav-item"><br></li>
							<li class="nav-item"><br></li>
							<li class="nav-item"><br></li>
							<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
						</c:if>
						<c:if test="${!empty member }">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}">다이어트 정보</a></li>
							<li class="nav-item"><a class="nav-link" href="#">쇼핑몰</a></li>
							<li class="nav-item"><br></li>
							<li class="nav-item"><a class="nav-link" href="#">마이 페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="#">주문·배송</a></li>
							<li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
						</c:if>
						</ul>
					</div>
					<div class="col-10" id="submenu">
						<ul class="nav nav-pills nav-justified">
							<c:choose>
								<c:when test="${fn:contains(path,'diet')||fn:contains(path,'')}">
									<li class="nav-item" id="diet_tips"><a class="nav-link" href="${pageContext.request.contextPath}/diet/diet_tips.do">다이어트꿀팁</a></li>
									<li class="nav-item" id="home_training"><a class="nav-link" href="${pageContext.request.contextPath}/diet/home_training.do">홈트레이닝</a></li>
									<li class="nav-item" id="cal_dictonary"><a class="nav-link" href="${pageContext.request.contextPath}/diet/cal_dictonary.do">칼로리사전</a></li>
									<li class="nav-item" id="comunity"><a class="nav-link" href="${pageContext.request.contextPath}/diet/comunity.do">커뮤니티</a></li>
								</c:when>
								<c:when test="${fn:contains(path,'shop')}">
									<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
									<li class="nav-item"><a class="nav-link" href="#">베스트상품</a></li>
									<li class="nav-item"><a class="nav-link" href="#">할인상품</a></li>
									<li class="nav-item"><a class="nav-link" href="#">신상품</a></li>
									<form class="form-inline my-2 my-lg-0">
										<input class="form-control mr-sm-2" type="search"placeholder="Search" aria-label="Search">
										<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
									</form>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-10" id="submenu2">
				<ul class="nav nav-pills nav-justified">
				<c:choose>
					<c:when test="${fn:contains(path,'diet')&&fn:contains(path,'diet_tips')}">
							<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">칼럼</a></li>
							<li class="nav-item"><a class="nav-link" href="#">운동</a></li>
							<li class="nav-item"><a class="nav-link" href="#">식단</a></li>
							<script>
								$("#diet_tips").css('background-color','gainsboro');
							</script>
					</c:when>
					<c:when test="${fn:contains(path,'diet')&&fn:contains(path,'home_training')}">
							<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">전신</a></li>
							<li class="nav-item"><a class="nav-link" href="#">복부</a></li>
							<li class="nav-item"><a class="nav-link" href="#">상체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">하체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">스트레칭</a></li>
							<script>
								$("#home_training").css('background-color','gainsboro');
							</script>
					</c:when>
					<c:when test="${fn:contains(path,'diet')&&fn:contains(path,'cal_dictonary')}">
							<li class="nav-item"><a class="nav-link" href="#">음식 칼로리</a></li>
							<li class="nav-item"><a class="nav-link" href="#">운동 칼로리</a></li>
							<script>
								$("#cal_dictonary").css('background-color','gainsboro');
							</script>
					</c:when>
					<c:when test="${fn:contains(path,'diet')&&fn:contains(path,'comunity')}">
							<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">식단</a></li>
							<li class="nav-item"><a class="nav-link" href="#">운동</a></li>
							<li class="nav-item"><a class="nav-link" href="#">팁 & 노하우</a></li>
							<li class="nav-item"><a class="nav-link" href="#">고민 & 질문</a></li>
							<li class="nav-item"><a class="nav-link" href="#">관리자에게</a></li>
							<script>
								$("#comunity").css('background-color','gainsboro');
							</script>
					</c:when>
					<c:when test="${fn:contains(path,'shop')&&fn:contains(path,'category')}">
							<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
							<li class="nav-item"><a class="nav-link" href="#">해산물</a></li>
							<li class="nav-item"><a class="nav-link" href="#">육류</a></li>
							<li class="nav-item"><a class="nav-link" href="#">채소</a></li>
							<li class="nav-item"><a class="nav-link" href="#">야채</a></li>
							<li class="nav-item"><a class="nav-link" href="#">가공식품</a></li>
					</c:when>
				</c:choose>
				</ul>
			</div>
		</div>
	</div>
</header>