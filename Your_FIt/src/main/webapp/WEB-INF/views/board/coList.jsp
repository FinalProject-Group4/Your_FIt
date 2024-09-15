<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
</head>
	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/board/coboardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var co_No = $(this).attr("id");
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+co_No;
			});
		});
	</script>
<body>$
      <c:import url="../common/header.jsp"/>
	<div id="container">
	<br><br><br><br><br>
			<section id="board-container" class="container">
			<h2>커뮤니티</h2>
				<table id="tbl-board" class="table table table-hover">
					<tr>
						<th>게시판</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list}" var="co"> 
					<tr id="${co.co_No}">
						<td>[${co.co_Type}]</td>
						<td>${co.co_Title} (${co.commentcount})</td>
						<td>${co.nick}</td>
						<td>${co.co_Count}</td>
						<td>${co.co_Date }</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
				
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/> 
				
			<%-- 	<form name="form1" method="post" action="list.do">

				    <select name="search_option">
				        <option value="user_id"
							<c:if test="${map.search_option == 'user_id'}">selected</c:if>
								   >작성자</option>
				
				        <option value="title" 
							<c:if test="${map.search_option == 'title'}">selected</c:if>
				      			  >제목</option>
				
				        <option value="content" 
							<c:if test="${map.search_option == 'content'}">selected</c:if>
				   			     >내용</option>
				
				        <option value="all" 
							<c:if test="${map.search_option == 'all'}">selected</c:if>
				  			      >작성자+내용+제목</option>
				
				    </select>
				    <input name="keyword" value="${map.keyword}">
				    <input type="submit" value="조회">
				</form> --%>
				
				
			</section> 
	</div>
	
	
	<br><br><br>
	 <c:import url="../common/footer.jsp"/>
</body>
</html>