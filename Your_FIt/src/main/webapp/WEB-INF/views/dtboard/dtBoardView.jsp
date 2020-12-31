<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	
	<style>
		a:link, a:visited {text-decoration: none; color: #656565;}
  
.board_list {width:100%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_list thead th:first-child{background-image:none}
.board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a;vertical-align:middle}
.board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle}
.board_list tbody tr:first-child td {border:none}
.board_list tbody td.title {text-align:left; padding-left:20px}
.board_list tbody td a {display:inline-block}
  
.board_view {width:50%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_view tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a}
.board_view tbody th.list_tit {font-size:13px;color:#000;letter-spacing:0.1px}
.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {border-bottom:none}
.board_view tbody th, .board_view tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc}
.board_view tbody td.view_text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px}
.board_view tbody th.th_file {padding:0 0 0 15px; vertical-align:middle}
  
.wdp_90 {width:90%}
.btn {border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#6b9ab8; border:1px solid #56819d;vertical-align:middle}
		img {
			width : 100px;
			height : 100px;
		}
	</style>
	
</head>
<body>
    <table class="board_view">
        <caption>상세보기</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>
                <td>${dtboard.dt_Title}</td>
                <th>조회수</th>
                <td>${dtboard.dt_Count }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${dtboard.dt_Content }
                </td>
            </tr>
             <tr>
                <th>사진</th>
                <td colspan="3">
                  <c:forEach items="${boardfileList }" var="a" varStatus="vs">
                  	<c:if test="${ ! empty a.f_Cname }">
								<img src="${pageContext.request.contextPath}/resources/dtboardUpload/${a.f_Cname}" />
							</c:if>
							<c:if test="${ empty a.f_Cname }">
									X
							</c:if>
					</c:forEach>
                </td>
            </tr>
        </tbody>
    </table>
    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardList.do'">목록</button>
  
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardUpdateView.do?dt_No=${dtboard.dt_No}'">수정 페이지</button>
		
   
     
    
</body>
</html>