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
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/checkJoinFrom.js"></script>
<script>

var iCheck=false;
var pCheck=false;
var eCheck=false;
var nCheck=false;


$(function(){
	
	$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
	});  
		
	$('#password').focusout(function() {
		pCheck=passwordCheck();
	}); 
		
	$('#email').focusout(function(){
		eCheck=emailCheck();
		}); 
		
	$('#nickName').focusout(function() {
		nCheck=nickNameCheck();
	}); 
		

});//ready

function checkForm(){
	if (iCheck==false) {
		$('#iMessage').html(' 아이디를 확인해주세요.');
	}
	if (pCheck==false) {
		$('#pMessage').html(' 비밀번호를 확인해주세요.');
	}
	if (eCheck==false) {
		$('#eMessage').html(' 이메일을 확인해주세요.');
	}
	if (nCheck==false) {
		$('#nMessage').html(' 닉네임을 확인해주세요.');
	}

	
	if ( iCheck && pCheck && eCheck &&  
		 nCheck && rCheck && wCheck	) {
		   // 오류 확인 완료
		  alert('축하합니다. 회원가입 되었습니다.');
		  return true;  
	}else return false;
	
}//checkForm()


</script>
</head>
<body>

<div id="header">
<!--header  -->

</div>
<!-- //header -->


<div id="container">
<!-- container  -->	


	<div id="join_content">
	<!-- content -->
	

	<form>
	
	<div>
		<label for="id">
		<p>아이디</p> 
		</label>
		<span>
			<input type="text" id="id" name="id" maxlength="10">
		</span><br>
		<span id="iMessage" class="message"></span>
	</div>
	
	<div>
		<label for="password">
		<p>비밀번호</p> 
		</label>
		<span>
			<input type="password" id="password" name="password" maxlength="20">
		</span><br>
		<span id="pMessage" class="message"></span>
	</div>
	
	<div>
	<!-- 아직 미구현 입니다. -->
		<label for="email">
		<p>이메일</p> 
		</label>
		<span>
			<input type="text" id="email" name="email" maxlength="15">@
			<select id="domain" name="domain">
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
			<input type="text" id="nickName" name="nickName" maxlength="10">
		</span><br>
		<span id="nMessage" class="message"></span>
	</div>
	
	<div>
		<label for="rid">
		<p>추천인</p> 
		</label>
		<span>
			<input type="text" id="rid" name="rid" maxlength="10" placeholder="(선택사항)">
		</span><br>
		<span id="rMessage" class="message"></span>
	</div>
	
	<span>
		<span>
			<a href="join" onclick="return checkForm();">확인</a>&nbsp;
		</span>
		<span>
			<a href="home">취소</a>
		</span>
	</span>
	</form>
	
	
	</div>
	<!-- //content  -->
</div>
<!-- //container -->
<div id="footer"></div>

</body>
</html>