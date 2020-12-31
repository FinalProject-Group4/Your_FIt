<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 사전 검색 결과</title>
<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
</style>
<script>
		function fn_cbBoardForm(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardForm.do";
		}

		function searchCalorie(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardSearch.do?keyword="+$('#keyword').val();
		}
		
</script>
</head>
<body>
<c:import url="../common/header.jsp"/>

	<section id="wrap-contents">
      <div class="mypage-content">
         <div class="container" >
 
            <h2 class="content content-title">음식 칼로리 사전</h2>
            
          	<c:if test="${!empty member and member.m_Id eq 'admin' || !empty member and member.m_Id eq 'ADMIN'}">
            	<div class="add-cal"><input type="button" value="칼로리 정보 추가" id="btn-add" class="btn btn-primary" onclick="fn_cbBoardForm();"/></div>
            </c:if>
            
            <div class="sch-div"> <!-- 음식 칼로리 검색 -->
				<form name="searchFrm" method="get" onsubmit="return false;">
					<fieldset class="sch2 clfix">
						<legend></legend>
						<input type="text" id="keyword" class="keyword" name="keyword" placeholder="검색어 입력" style="width:619px" onKeyPress="if (event.keyCode == 13){searchCalorie();return;}"/>
						<a class="cal-search" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" onclick="searchCalorie();"><i class="fa fa-search"></i></a>
						<p class="p-info">칼로리 사전은 <span class="span-color">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐 아니라 건강한 식습관 형성에도 도움이 됩니다.</p>
					</fieldset>
				</form>
			</div>
             
                <div class="outer">
                      <div id="mainWrapper">
                      
                      <h2 class="content">'${cbBoard.cb_foodname}' 검색 결과</h2>
		
						<table id="result">
							<tr>
								<th>음식명</th>
								<th>단위</th>
								<th>칼로리</th>
							</tr>
							<tr>
								<td>${cbBoard.cb_foodname}</td>
								<td>${cbBoard.cb_unit}</td>
								<td>${cbBoard.cb_cal}</td>
							</tr>
						</table>
						
						<br>
						<p class="p-info"><span class="span-color">[주의]</span> 음식 칼로리는 사용되는 재료와 1인 분량 기준의 차이에 의해 다소 차이가 있을 수 있습니다.</p>
						<br>
						
						<h2 class="content">'${cbBoard.cb_foodname}' 영양소 구성</h2>
						
						<table id="nutrient">
							<tr>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
							</tr>
							<tr>
								<td>${cbBoard.cb_carbohydrate}g</td>
								<td>${cbBoard.cb_protein}g</td>
								<td>${cbBoard.cb_fat}g</td>
							</tr>
						</table>
	
						<br>
						    
						<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/cbBoard/cbBoard.do'">돌아가기</button>
						
          				<c:if test="${!empty member and member.m_Id eq 'admin' || !empty member and member.m_Id eq 'ADMIN'}">
							<button class="btn btn-primary" id="btn-update" type="button" onclick="location.href='${pageContext.request.contextPath}/cbBoard/cbBoardUpdateView.do?cb_no=${cbBoard.cb_no}'">수정하기</button>
						</c:if>
					</div>

                	</div>   
                </div>      
                
         </div>
      </div>
   </section>

<c:import url="../common/footer.jsp"/>
</body>
</html>