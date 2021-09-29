<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 내정보 확인 **</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/ajaxForMember.js"></script>

</head>
<body>
<h2>** 내정보 확인 **</h2>
<!-- Profile Image 설정 창 미구현 -->
<table>
	<tr height="40">
		<td bgcolor="Lavender">I  D</td><td>${Apple.id}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">Email</td><td>${Apple.email}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">NickName</td><td>${Apple.nickName}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">Grade</td><td>${Apple.grade}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">추천인ID</td><td>${Apple.rid}</td>
	</tr>
</table>
<hr>
<span id="${Apple.id}" class="mupdatef textLink">내프로필 수정</span>&nbsp;&nbsp;
<span id="${Apple.id}" class="newpassf textLink">비밀번호 재설정</span>&nbsp;&nbsp;
<hr>
<div id="resultArea"></div>
<!-- ** 내정보수정
		=> 내정보를 표시하는 폼이 출력 (mdetail) -> 수정후, 수정버튼 -> 수정 서블릿 
-->
<hr>

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