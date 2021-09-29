<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 회원탈퇴 **</title>
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
		$('#dMessage').html('~~ "지금삭제"라고 입력하세요  ~~');
		$('#OK').html('');
		return false;
	}else {
		$('#dMessage').html('');
		$('#OK').html('OK').css({fontWeight:"bold",color:"red"});
		return true;
	}
}
function mDelete() {

	if (dCheck==false) {
		$('#dMessage').html(' "지금삭제"를 입력하세요. ');
	}
	if ( dCheck ) {
		   // 오류 확인 완료
		  alert('안녕히 가십시오');
		  opener.location.reload();
		  return true;  
	}else return false;
	
} //inCheck
</script>
</head>
<body>
<h3>정말로 탈퇴하시겠습니까?탈퇴하시려면 '지금삭제'를 입력하고 확인을 눌러주세요.</h3>
<form action="mDelete" >
	<input type="text" id="id" name="id" value="${Apple.id}" hidden>

	<div>
		<label for="delete">
		<span>지금삭제 :</span>
		</label>
		<span>
			<input type="text" id="delete" maxlength="20">
		</span><span id="OK"></span><br>
		<span id="dMessage"></span>
	</div>
	
	<div>
		<span>
			<input type="submit" onclick="return mDelete();" value="확인">&nbsp;
		</span>
		<span>
			<input type="button" value="취소" onclick="javascript:history.go(-1);">
		</span>
	</div>
</form>

<div id="footer"><!-- footer -->
	
	<div id="search" hidden="true" >
	
		<div id="search1">
			<form action="search" method="get" id="searchF">
				<input type="text" placeholder="검색어를 입력해주세요." name="keyword" id="keyword">
				<input type="text" value="all" name="searchType" hidden="true">
			</form>
		</div>
		
		<div id="search2">
			<button id="searchButton">
				<img src="resources/image/search.jpg" id="searchImg">
			</button>
		</div>

		
	</div>

	<c:if test="${loginID==null}">
	<div id="menu1" class="footmenu"><a href="loginF">로그인</a></div>
	</c:if>
	<c:if test="${loginID!=null}">
	<div id="menu1" class="footmenu"><a href="logout">로그아웃</a></div>
	</c:if>
	
	<c:choose>
		<c:when test="${loginID==null}">
			<div id="menu2" class="footmenu"><a href="joinA">회원가입</a></div>
		</c:when>
		
		<c:when test="${loginID=='admin'}">
			<div id="menu2" class="footmenu"><a href="editF">편집모드</a></div>
		</c:when>
		
		<c:otherwise>
			<div id="menu2" class="footmenu"><a href="myinfo">내 정보</a></div>
		</c:otherwise>
	</c:choose>

	
	<div id="menu3" class="footmenu"><a href="home">홈</a></div>
	<div id="menu4" class="footmenu"><a href="#" onclick="openSearch()">검색</a></div>
	<div id="menu5" class="footmenu"><a href="qalist">고객센터</a></div>
	
</div><!-- //footer -->
</body>
</html>