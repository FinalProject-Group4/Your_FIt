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
	<title>게시글 수정</title>

	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
		<script>
	
	
	function fileDownload(oName, rName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
	}

	function fileDelete(obj, attNo, rName){
		$.ajax({
			url : '${pageContext.request.contextPath}/board/fileDelete.do',
			data : { attNo : attNo, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
	}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/header.jsp"/>
		<div id="board-container">
			<form name="boardFrm" action="${pageContext.request.contextPath}/board/boardUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" name="co_No" value="${co_board.co_No }" />
				<input type="text" class="form-control" placeholder="제목" name="co_Title" id="co_Title" value="${co_board.co_Title}" required>
				<input type="text" class="form-control" name="co_board.nick" value="${co_board.nick}" readonly required>
				<c:forEach items="${board_file}" var="b" varStatus="vs">
					<div class="rows">
						<button type="button" class="btn btn-outline-success col-8"
							onclick="fileDownload('${b.f_Name}','${b.f_Cname}');" download>
						 ${b.f_Name}
					</button>
					<button type="button" class="btn btn-outline-danger col-3"
							onclick="fileDelete(this,'${b.f_No}', '${b.f_Cname}');">파일 삭제</button>
					</div>
				</c:forEach>
				<br>
					<div class="input-group mb-3" style="padding:0px; margin-bottom : 420px; margin-top:30px; border-bottom:1px solid #edeff2;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일1</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="inputfile" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" for="upFile1"></label>
				  </div>
				</div>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일2</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="inputfile" name="upFile" id="upFile2">
				    <label class="custom-file-label" for="upFile2"></label>
				  </div>
				</div>
			    <textarea class="form-control" name="co_Content" placeholder="내용" required>${co_board.co_Content}</textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" value="수정 완료" /> &nbsp;
				<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?co_No=${co_board.co_No}'"/>
			</form>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>