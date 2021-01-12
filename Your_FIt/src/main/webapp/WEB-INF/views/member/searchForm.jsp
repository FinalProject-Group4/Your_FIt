<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>${page_name}</title>
<style>
	#id_area, #pwd_area{
		height: 75px;
	}
	
	#find_info{
		height: 50px;
	}
	
	#login_text{
		text-align: center;
	}
	
	#info_label, #email_label, #phone_label{
		line-height: 35px;
		font-size: 20px;
	}
	
	#find_info{
		text-align: right;
	}
	
</style>
</head>
<body>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<c:choose>
	<c:when test="${ page_info eq 'id_Find' or page_info eq 'pw_Find'}">
	<div class="container">
		<div class="row">
			<div class="col-12" id="login_area">
				<form class="form-signin" action="${pageContext.request.contextPath}/member/search_action.do?${page_info}" onsubmit="return form_chk();" method="post">
					<h1 class="h1 font-weight-normal" id="login_text"><br />${page_name}<br /><br /></h1>
					<div class="col-10 offset-1" id="id_area">
						<div class="row">
							<c:if test="${page_info eq 'pw_Find'}">
								<div class="col-4">					
									<label for="userInfo" id="info_label">ID : </label>
								</div>
								<div class="col-8" style="margin: 0; padding: 0;">
									<input type="text" name="userInfo" id="userInfo" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus>
								</div>
							</c:if>
							<c:if test="${page_info eq 'id_Find'}">
								<div class="col-4">					
									<label for="userInfo" id="info_label">이름 : </label>
								</div>
								<div class="col-8" style="margin: 0; padding: 0;">
									<input type="text" name="userInfo" id="userInfo" class="form-control" placeholder="이름을 입력해 주세요" required autofocus>
								</div>
							</c:if>
						</div>
					</div>
					
					<div class="col-10 offset-1" id="phone_area" style="height: 75px;">
						<div class="row">
							<div class="col-4">
								<label for="phone_first_text" id="phone_label">연락처 : </label>
							</div>
							<div class="col-8">
								<div class="row">
									<div class="col-4" style="margin: 0; padding: 0;">
										<select class="form-control" id="phone_first_text" required>
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="0130">0130</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<input type="hidden" id="phone1_ok" name="phone1_ok" />
									</div>
									<div class="col-1">
										<p style="font-size: 20px; height: 20px;">-</p>
									</div>
									<div class="col-3" style="margin: 0; padding: 0;">
										<input class="form-control" type="text" id="phone_middle_text" maxlength="4" style="width: 100px;" required>
									</div>
									<div class="col-1">
										<p style="font-size: 20px; height: 20px;">-</p>
									</div>
									<div class="col-3" style="margin: 0; padding: 0;">
										<input class="form-control" type="text" id="phone_last_text" maxlength="4" style="width: 100px;" required>
									</div>
									<input type="hidden" id="phone_address" name="phone_address" val/>
									<input type="hidden" id="phone2_ok" name="phone2_ok" />
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-10 offset-1" id="pwd_area">
						<div class="row">
							<div class="col-4">
								<label for="userEmail" id="email_label">email : </label>
							</div>
							<div class="col-8" style="margin: 0; padding: 0;">
								<input type="text"  name="userEmail" id="userEmail" class="form-control" placeholder="이메일을 입력해 주세요" required>
							</div>
						</div>
					</div>
						<div class="col-4 offset-4" id="btn_area">
							<button class="btn btn-lg btn-primary btn-block" type="submit">${page_name}</button>
						<br><br><br><br>
					</div>
				</form>
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
		${msg }
	</c:otherwise>
	</c:choose>
	
	<script>
	// 핸드폰 번호 선택 값 확인
	$('#phone_first_text').on('change',function(){

		if (this.value != ''){
			$('#phone1_ok').val(1);
		} else{
			$('#phone1_ok').val(0);
		}
	});

	
	// 핸드폰 번호 입력 텍스트칸 숫자만 입력받게 설정
	$('#phone_middle_text, #phone_last_text').keyup(function(e) {

		var reg_phone = /[^0-9]/g;
		var str_phone = $(this).val();
		var phone_num = $('#phone_middle_text').val()+$('#phone_last_text').val();
		
		if (reg_phone.test(str_phone)) {
			
			$(this).val(str_phone.replace(reg_phone, ''));
			
		} else if(phone_num.length>6){
			$('#phone2_ok').val(1);
		} else{
			$('#phone2_ok').val(0);
		}
	});

	function form_chk() {

	    if($("#phone2_ok").val()==0){
	        alert("연락처를 정확하게 입력해 주세요.");
	        $('#phone_middle_text').focus();
	        return false();
		}
		
	    $('#phone_address').val($('#phone_first_text').val() + "-" + $('#phone_middle_text').val() + "-" + $('#phone_last_text').val());
		return true; 
	}
	</script>
</body>
</html>