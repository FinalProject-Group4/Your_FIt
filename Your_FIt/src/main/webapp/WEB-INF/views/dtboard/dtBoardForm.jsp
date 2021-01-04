<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
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
	
</script>


</head>
	
	<div class="outer">
		
			<br/>
		<section id="single-project">
   			<div class="container">
      			<div class="row">	
				<div class="tableArea">
				<form action="${pageContext.request.contextPath}/dtboard/dtBoardFormEnd.do"
				      method="post" onsubmit="return validate();" enctype="multipart/form-data">
		      		<input type="hidden" name="dt_Mno" value="${member.m_No }" />
				    <table  class="sub_news" border="1px solid gray" align="center" >
				      	<tr>
						<th id="column_row">카테고리</th>
						<td>
							<select name="dt_Type" id="dt_Type">
								<option value=>게시판 선택</option>
								<option value="식단">식단</option>
								<option value="운동">운동</option>
								<option value="칼럼">칼럼</option>
					    	</select>
						</td>
					</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">제목</th>
				      		<td colspan="10"><input type="text" size="150" class="form-control tinput" name="dt_Title" style="width:100%;"  placeholder="제목을 입력하세요." /></td>
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">작성자</th>
							<td colspan="10" title="" readonly>${ member.m_Nick }</td>     		
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
				      				style="resize:none; height: 350px; width:100%;" class="form-control cinput" placeholder="내용을 입력하세요." required></textarea>
				      		</td>
				      	</tr>
				    </table>
				    
				    <br/>
				    <div>
				    	<button class="btn btn-default"><a href="${pageContext.request.contextPath}/dtboard/dtBoardList.do" style="color: #333; align:left;">목록으로</a></button>
				      	<button class="btn btn-default" type="reset" id="btnReset">취소</button>
				    	<button class="btn btn-default" id="btnSave" type="submit">등록</button>
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