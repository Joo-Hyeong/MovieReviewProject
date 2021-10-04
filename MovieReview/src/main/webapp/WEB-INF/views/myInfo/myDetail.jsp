<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 확인</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/ajaxForMember.js"></script>
</head>
<body>
<h2>내 정보</h2>

	<div class="input-group w3_w3layouts">
		<span class="input-group-addon" id="basic-addon1">아이디</span>
		<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Apple.id}" readonly="readonly" style="width:15%">
	</div>
	
	<div class="input-group w3_w3layouts">
		<span class="input-group-addon" id="basic-addon2">이메일</span>
		<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Apple.email}" readonly="readonly" style="width:15%">
	</div>
	
	<div class="input-group w3_w3layouts">
		<span class="input-group-addon" id="basic-addon3">닉네임</span>
		<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Apple.nickName}" readonly="readonly" style="width:15%">
	</div>
	
	<div class="input-group w3_w3layouts">
		<span class="input-group-addon" id="basic-addon4">등&nbsp;&nbsp;&nbsp;급</span>
		<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Apple.grade}" readonly="readonly" style="width:15%">
	</div>
	
	<div class="input-group w3_w3layouts">
		<span class="input-group-addon" id="basic-addon5">추천인</span>
		<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Apple.rid}" readonly="readonly" style="width:15%">
	
	</div>

<hr>
<span id="${Apple.id}" class="mupdatef textLink">내프로필 수정</span>&nbsp;&nbsp;
<span id="${Apple.id}" class="newpassf textLink">비밀번호 재설정</span>&nbsp;&nbsp;
<hr>
<div id="resultArea"></div>
<!-- ** 내정보수정
		=> 내정보를 표시하는 폼이 출력 (mdetail) -> 수정후, 수정버튼 -> 수정 서블릿 
-->
<br>
<br>
</body>
</html>