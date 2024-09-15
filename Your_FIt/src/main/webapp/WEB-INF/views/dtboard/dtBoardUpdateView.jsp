<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
	<style>
#single-project {
    padding-top: 4rem;
    padding-bottom: 6rem;
}

.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

.row {
    margin-right: -15px;
    margin-left: -15px;
}

div {
    display: block;
}
.sub_news,.sub_news th,.sub_news td{
  border:0;
}

.sub_news a{
  color:#383838;
  text-decoration:none;
}

.sub_news{
  width:100%;
  border-bottom:1px solid #999;
  color:#666;
  font-size:15px;
  table-layout:fixed;
}

.sub_news caption{
  display:none;
}

.sub_news th{
  padding:5px 0 6px;
  border-top:solid 1px #999;
  border-bottom:solid 1px #b2b2b2;
  background-color:#f1f1f4;
  color:#333;
  font-weight:bold;
  line-height:20px;
  vertical-align:top;
}

.sub_news td{
  padding:8px 0 9px;
  border-bottom:solid 1px #d2d2d2;
  border-top: solid 1px #d2d2d2;
  line-height:18px;
}

.sub_news .date,.sub_news .hit{
  padding:0;
  font-family:Tahoma;
  font-size:11px;
  line-height:normal;
}

.sub_news .title{
  text-align:left; 
  padding-left:15px; 
  font-size:13px;
}

.sub_news .title .pic,.sub_news .title .new{
  margin:0 0 2px;
  vertical-align:middle;
}

.sub_news .title a.comment{
  padding:0;
  background:none;
  color:#f00;
  font-size:12px;
  font-weight:bold;
}

.sub_news tr.reply .title a{
  padding-left:16px;
  background:url(../images/ic_reply.png) 0 1px no-repeat;
}

.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}

.btn-default:hover {background: #ddd;}

#btnReset {
		margin-left: 450px;
}

th {
	text-align:center;
}
</style>
<script>
	function validate(){
		var content = $("[name=dt_Content]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=upFile]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    //var fileName = this.files[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val());
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
	function fileDelete(obj, fNo, cName){
		$.ajax({
			url : '${pageContext.request.contextPath}/board/dtfileDelete.do',
			data : { fNo : fNo, cName : cName }, 
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
	
	<div class="outer">
		
			<br/>
		<section id="single-project">
   			<div class="container">
      			<div class="row">	
				<div class="tableArea">
				<form action="${pageContext.request.contextPath}/dtboard/dtBoardUpdate.do"
				      method="post" onsubmit="return validate();" enctype="multipart/form-data">
				     <input type="hidden" name="dt_No" value="${ dtboard.dt_No }"/>
		      		<input type="hidden" name="dt_board.Nick" value="${ dt_board.nick }" />
		      		<input type="hidden" name="dt_Type" value="1" />
				    <table  class="sub_news" border="1px solid gray" align="center" >
				      	<tr>
				      		<th style="vertical-align: middle;">제목</th>
				      		<td colspan="10"><input type="text" size="150" class="form-control tinput" name="dt_Title" value="${dtboard.dt_Title} " style="width:100%;"  placeholder="제목을 입력하세요." /></td>
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">작성자</th>
							<td colspan="10" title="">${ dtboard.nick } </td>     		
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">첨부 파일</th>
				      		<td colspan="10">
				      			&nbsp;<input type="file" name="upfiles" id="upfiles" />
				      			
				      		</td>
				  
				      	</tr>
						<tr style="overflow-y:auto;text-align:left;">
				      		<th style="vertical-align: middle;">내 용</th>
				      		<td colspan="10">
				      			<textarea name="dt_Content" 
				      				style="resize:none; height: 350px; width:100%;" class="form-control cinput" placeholder="내용을 입력하세요." required>${dtboard.dt_Content}</textarea>
				      		</td>
				      	</tr>
				    </table>
				    
				    <br/>
				    <div>
				    	<button class="btn btn-default"><a href="" style="color: #333; align:left;">목록으로</a></button>
				      	<button class="btn btn-default" type="reset" id="btnReset">취소</button>
				    	<button class="btn btn-default" type="submit">등록</button>
				    	<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardDelete.do?dt_No=${dtboard.dt_No}'"/>
				    	
				    </div>
				    <br />
				    <br />
				    <br />
				    <br />
				    <br />
				</form>
			</div>
		</div>
		</div>
		</section>
		</div>
	
	</div>
</body>
</html>