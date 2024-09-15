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
	<title>게시글 작성</title>
	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		th#column_row {background:#edeff2; padding:22px 14px 22px 14px;}
		table {border-bottom: 1px solid #edeff2; border-top: 1px solid #edeff2;}
		.input-group-prepend{width:200px;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=boardContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */

	</script>
</head>
<body>
  <c:import url="../common/header.jsp"/><br><br><br><br>
	<div id="container">
		<div id="board-container">																											<!--  사진도 업로드하기 위함 (라이브러리2개필요) -->
			<form name="boardFrm" action="${pageContext.request.contextPath}/board/coboardFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			 <input type="hidden" name="co_Mno" value="${member.m_No}" readonly>
				<table>
				<tbody>
					<tr>
						<th id="column_row">카테고리</th>
						<td>
							<select name="co_Type" id="co_Type">
								<option value=>게시판 선택</option>
								<option value="식단">식단</option>
								<option value="운동">운동</option>
								<option value="팁 & 노하우">팁 & 노하우</option>
								<option value="고민 & 질문">고민 & 질문</option>
								<option value="관리자에게">관리자에게</option>
							</select>
						</td>
					</tr>
					<tr>
					<th id="column_row">제목</th>
						<td>
							<input type="text" name="co_Title" id="co_Title" style="width:306px">
						</td>
					</tr>
				</tbody>
				</table>
				
				<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
				<!-- style.css에서 div의  padding:10px을 제거함 -->
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
			     <textarea class="form-control" name="co_Content" placeholder="내용" required style="height:250px;"></textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" value="저장" >
			</form>
		</div>
	</div>
	 <br><br><br><br> <c:import url="../common/footer.jsp"/>
</body>
</html>