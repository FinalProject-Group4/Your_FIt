<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
<script type="text/javascript" src="경로"></script>

	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	<style>
		div#board-container{width:600px; margin:0 auto; text-align:center;}

		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		textarea.form-control{height:250px;}
		div#comment-write{display:flex;}
		textarea.comment{height:100px; width:490px;}
		button.commentbtn{height:100px; width:100px; margin-left:10px;}
		
		input {border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; margin-left:0px;}
		
	</style>
	<script>
	
	
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
	
	<script>

	$(function(){

		listReply();
		
	 $("#btnReply").click(function(){
		        
			    var coContent = $("#coContent").val();    //댓글의 내용
			    var memberMno =  ${member.m_No};    // 세션에서 멤버 no가져와야함
			    
			    
			    var co_No = '${co_board.co_No}';
			   /*  var params = {"coContent" : coContent, "member_bno" : member_bno}; */
			    var params = {"coContent" : coContent, "memberMno" : memberMno, "co_No" : co_No};
			    
			    $.ajax({
			        type: "post", //데이터를 보낼 방식
			        url: "${pageContext.request.contextPath}/board/commentinsert.do", //데이터를 보낼 url
			        data: params, //보낼 데이터
			        
			        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
			            alert("댓글이 등록되었습니다.");
			            location.reload();
			                }
			            });
			        });

	//댓글 목록을 출력하는 함수
	 function listReply(){

		 var co_No = '${co_board.co_No}';
		 var params = {"co_No" : co_No};
	     $.ajax({
	         type: "post",    //get방식으로 자료를 전달
	         url: "${pageContext.request.contextPath}/board/commentlist.do",    //컨트롤러에 있는 commentlist.do로 맵핑되고 게시글 번호도 같이 보낸다.
	         data : params,
	         
	         success: function(result){    //자료를 보내는것이 성공했을때 출력되는 메시지
	        	console.log(bclist);
	        	console.log(board_comment);
	             
	             //댓글목록을 실행한 결과를 가져온다.
	         $("#listReply").html(result);
	             }
	         });
	 }
     
	});

	</script>
	
	<script>


	    //댓글 삭제
	   function commentdelete(obj){
			var bc_no = $(obj).siblings('input').val();

			var co_no = '${co_board.co_No}';

			location.href="${pageContext.request.contextPath}/board/commentdelete.do?bc_no="+bc_no+"&co_no="+co_no;
		   };

		   // 수정하기 버튼
	    function commentup(obj){
			  $(obj).siblings('textarea').removeAttr('readonly');
			  $(obj).siblings('#commentupdate').css('display','inline');
			  $(obj).css('display','none');
		};

		// 수정 완료버튼
		function commentupdate(obj){
			var bc_content =  $(obj).siblings('textarea').val();
			var bc_no = $(obj).siblings('input').val();
			var co_no = '${co_board.co_No}';
			
			location.href="${pageContext.request.contextPath}/board/commentupdate.do?bc_no="+bc_no+"&bc_content="+bc_content+"&co_no="+co_no;	
		alert("수정이 완료되었습니다!");
		}
	


	</script>
	
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div id="container">
		<div id="board-container">
			<div class="title">	<input type="text" placeholder="제목" name="co_Title" id="boardTitle" value="${co_board.co_Title}" readonly required style="width:max-content;}"></div>
			<hr />
			<div class="info">
				<input type="text"  name="boardWriter" value="${co_board.nick}" readonly required>
				<span>${co_board.co_Date} &nbsp; | &nbsp; ${co_board.co_Count} </span>
			</div>
			<hr />
			
			<c:forEach items="${board_file}" var="b" varStatus="vs">
				<button type="button" 
						
						onclick="fileDownload('${b.f_Name }','${b.f_Cname }');">
					첨부파일  ${b.f_Name } 
				</button>
			</c:forEach> 
		  	  <textarea class="form-control" name="co_Content" placeholder="내용" readonly required>${co_board.co_Content}</textarea>
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/coList.do'">리스트로</button>
		   <%--  <c:if test="${member.userId eq co_board.co_Mno}"> --%> <!-- 1이 아닌 세션에서 회원 불러와 비교예정 -->
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?co_No=${co_board.co_No}'">수정 페이지</button>
			<%-- </c:if> --%>
	
		<!-- 댓글 area -->
		<br /><br />
		 <div id="commlist">
			<p>댓글 쓰기</p>
		
		  <div id="comment-write">
		  	<form action=""></form>
				<div>
					<textarea class="comment" name="coContent" id="coContent" cols="30" rows="10"></textarea>
				</div>
	  			<div>
	  				<button type="button" id="btnReply" class="commentbtn">전송</button> 
	  			</div>
	  		</form>
	      </div>
	      <hr />
	      <p>댓글 <!-- 총개수 --> </p>
	      <hr />
	     <c:forEach items="${bclist}" var="bc"> 
	     		  ${bc.bc_Date } ${bc.nick }
	     		  <textarea id="bc_Content" name="bc_Content" rows="3" cols="80" readonly>${bc.bc_Content }</textarea>
	     		
	     		  <input type="hidden" id="bc_No" name="bc_No" value="${bc.bc_No }" />
	     		  <input type="hidden" id="bc_Mno" name="bc_Mno" value="${bc.bc_Mno }" />
	     	
	     	
	     			
		     	  <button type ="button" id="commentup" onclick="commentup(this);">댓글 수정</button>
		     	  <button type="button" id="commentupdate" onclick="commentupdate(this);" style="display:none;">수정 완료</button>
		     	  <button type ="button" id="commentdelete" onclick="commentdelete(this);">댓글 삭제</button>
	     		
	     		<br>
            </c:forEach>
<div id="listReply'> </div>

	  
	  </div> 
	 </div>
	</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>