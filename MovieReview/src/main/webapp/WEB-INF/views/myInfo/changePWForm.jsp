<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 폼</title>
<style type="text/css">

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/checkJoinFrom.js"></script>
<script>
var pCheck=false;
var p2Check=false;

$(function(){
	$('#password_find').focus();
 
	$('#password_find').focusout(function() {
		pCheck=passwordCheck_find();
	}); //password_focusout

	
}); //ready

function inCheck() {
	// 개별적 오류 확인 : switch 변수
	p2Check=password2Check();
	
	if (pCheck==false) {
		$('#pMessage1').html('Password 를 확인하세요.');
	}
	

	if ( pCheck && p2Check ) {
		   // 오류 확인 완료
		  alert('변경 성공');

		  return true;  
	}else{
		
		return false;
	} 
		
		
	
} //inCheck
</script>
</head>
<body>
<form action="mupdate">
	<input type="text" id="id" name="id" value="${Apple.id}" hidden>
	<input type="text" id="email" name="email" value="${Apple.email}" hidden>
	<input type="text" id="nickName" name="nickName" value="${Apple.nickName}" hidden>
	<input type="text" id="grade" name="grade" value="${Apple.grade}" hidden>
	<input type="text" id="rid" name="rid" value="${Apple.rid}" hidden>
	<div  style="margin: 5px;">
		<label for="password">
		<p>비밀번호</p>
		</label>
		<span>
			<input type="password" id="password_find" name="password" maxlength="20">
		</span><br>
		<span id="pMessage" class="message"></span>
	</div>
	
	<div  style="margin: 5px;">
		<label for="checkpw">
		<p>다시입력</p> 
		</label>
		<span>
			<input type="password" id="password2" name="confirmPW" maxlength="20">
		</span><span id="p2OK"></span><br>
		<span id="p2Message" class="message"></span>
	</div>
	
	<div>
		<span>
			<input type="submit" onclick="return inCheck();" value="변경">&nbsp;
		</span>
		<span>
			<input type="reset" value="취소" >
		</span>
	</div>

<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>

</body>
</html>