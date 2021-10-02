<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
var dCheck=false;

$(function(){
	$('#delete').focus();
 
	$('#delete').keyup(function() {
		dCheck=confirmCheck();
	}); //password2_keypress

}); //ready
function confirmCheck(){
	var confirmword=$('#delete').val();
	if (confirmword != '지금삭제') {
		$('#dMessage').html('"지금삭제"를 입력해 주세요.');
		return false;
	}else {
		$('#dMessage').html('입력완료. 확인을 눌러주세요.').css({fontWeight:"bold",color:"green"});
		return true;
	}
}
function mDelete() {

	if (dCheck==false) {
		$('#dMessage').html('양식을 제대로 입력해 주세요.');
	}
	if ( dCheck ) {
		   // 오류 확인 완료
		  alert('회원탈퇴가 정상적으로 처리되었습니다.');
		  opener.location.reload();
		  return true;  
	}else return false;
	
} //inCheck
</script>
</head>
<body>
<h3>정말로 탈퇴하시겠습니까?</h3>
<form action="mDelete" >
	<input type="text" id="id" name="id" value="${Apple.id}" hidden="true">

	<div class="input-group w3_w3layouts">	
				<input type="text" id="delete" style="width:300px"class="form-control" placeholder="삭제를 원하시면 '지금삭제' 를 입력해주세요." aria-describedby="basic-addon1">	
	</div>
		<span id="dMessage"></span>
	<div>
		<span>
			<input type="submit" onclick="return mDelete();" value="확인">&nbsp;
		</span>

	</div>
</form>


</body>
</html>