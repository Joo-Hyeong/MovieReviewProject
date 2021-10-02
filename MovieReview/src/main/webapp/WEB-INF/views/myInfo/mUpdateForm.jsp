<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/checkJoinFrom.js"></script>
<script src="resources/library/ajaxForMember.js"></script>

<script>

var eCheck=false;
var nCheck=false;


$(function(){
	$('#email').focus();
		
	$('#email').focusout(function(){
		eCheck=emailCheck();
	}); 
		
	$('#nickName').focusout(function() {
		nCheck=nickNameCheck();
	}); 
	
	$('#nickName').click(function(){
		
		$('#nickNameCheck').attr("disabled", false);
	});
	
	$('#domainf').change(function(){
		
		var domainf = $('#domainf').val();
		
		if( domainf !='--선택해주세요--'){
		
			$('#domain').val(domainf);
			
			 if($('#domainf').val()=='직접입력'){
				 
			 	$('#domain').attr({
			 		readonly: false,
			 		placeholder: '주소를 입력해주세요.'
			 	});
			 	$('#domain').val('');
			}
		}else{
			$('#domain').attr({
		 		readonly: true,
		 		placeholder: '주소를 선택해주세요.'
		 	});
		 	$('#domain').val('');
		}
	});// domainf change
	
});//ready

function checkForm(){

	if (eCheck==false) {
		$('#eMessage').html(' 이메일을 확인해주세요.');
	}
	if (nCheck==false) {
		$('#nMessage').html(' 닉네임을 확인해주세요.');
	}

	
	if ( eCheck && nCheck ) {
		   // 오류 확인 완료
		  alert('프로필 수정 성공!!!');
	
		  return true
	}else{ 
		
		alert('양식을 확인해주세요.');
		return false;
	}
	
}//checkForm()

	
</script>
</head>
<body>
<div>
<form action="mupdate" method="post">
	<input type="text" id="id" name="id" value="${Apple.id}" hidden>
	<input type="text" id="password" name="password" value="${Apple.password}" hidden>
	<input type="text" id="grade" name="grade" value="${Apple.grade}" hidden>

	<div>
	<!-- 아직 미구현 입니다. -->
		<label for="email">
		<p>이메일</p> 
		</label>
		<span>
			<input type="text" id="email" name="email" maxlength="15" value="${Email}">@
			<input type="text" id="domain" name="domain" readonly="true" size=15 value="${Domain}" placeholder="주소를 선택해주세요.">
			<select id="domainf">
				<option selected="selected">--선택해주세요--</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
				<option>직접입력</option>
			</select>
			<input type="button" value="인증번호 발송" id="sendEmail"></input>
		</span><br>
		<span id="eMessage" class="message"></span>
	</div>
	
	<div>
		<label for="nickName">
		<p>닉네임</p> 
		</label>
		<span>
			<input type="text" id="nickName" name="nickName" maxlength="10" value="${Apple.nickName}">&nbsp;
		</span>
		
		<span>
			<input type="button" value="중복확인" id="nickNameCheck" >
		</span>
		<br>
		<span id="nMessage" class="message"></span>
	</div>
	
	<div>
		<label for="rid">
		<p>추천인</p> 
		</label>
		<span>
			<input type="text" id="rid" name="rid" maxlength="10" placeholder="(선택사항)" value="${Apple.rid}">
		</span><br>
		<span id="rMessage" class="message"></span>
	</div><br>
	
	<div>
		<span>
			<input type="submit" onclick="return checkForm();" value="수정">&nbsp;
		</span>
		<span>
			<input type="reset" value="취소" >
		</span>
	</div>
</form>
	
	
	</div>
	<!-- //content  -->


</body>
</html>