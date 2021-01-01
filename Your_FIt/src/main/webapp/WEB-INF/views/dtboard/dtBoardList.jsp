<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

	<style>
		table {
			width : 70%;	
			border : 1px solid black;
		}
		th,tr, td {
			border : 1px solid black;
			text-align : center;
		}
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		img {
			width : 100px;
			height : 100px;
		}
	</style>
	
	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/dtboard/dtBoardForm.do";
		}
		
	</script>
</head>
<body>
	<p>총 ${totalContents }건의 게시물이 있습니다.</p>
	<div id="container">
			<section id="board-container" class="container">
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>사진</th>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>조회수</th>
						
					</tr>
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.dt_No}">
						<td>${b.dt_No }</td>
						<td>
							<c:if test="${ ! empty b.files }">
								<img src="${pageContext.request.contextPath}/resources/dtboardUpload/${b.files[0].f_Cname}" />
								
							</c:if>
							<c:if test="${ empty b.files }">
									X
							</c:if>
						</td>
						<td>${b.dt_Mno}</td>
						<td><a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}">${b.dt_Title}</a></td>
						<td>${b.dt_Content}</td>
						<td>${b.dt_Count}</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
	</div>
	
</body>
</html>