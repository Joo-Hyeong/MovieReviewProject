<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 답변달기 **</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
</head>
<body>
<h2>** 답변달기 **</h2>
<table><form action="reply" method="post">
	<tr height="40"><td bgcolor="yellow">Id</td>
		<td><input type="text" name="id" value="${loginID}" readonly></td></tr>
	<tr height="40"><td bgcolor="yellow">Title</td>
		<td><input type="text" name="title"></td></tr>	
	<tr height="40"><td bgcolor="yellow" >Content</td>
		<td><textarea name="content" rows="10" cols="40"></textarea></td>
	</tr>
	<tr><td></td> 
		<!-- 답글등록시 필요한 부모글의 root, step, indent,secret 전달 위함 -->
		<td>
			<input type="text" name="seq" value="${qABoardVO.seq}" hidden>
			<input type="text" name="root" value="${qABoardVO.root}" hidden>
			<input type="text" name="step" value="${qABoardVO.step}" hidden>
			<input type="text" name="indent" value="${qABoardVO.indent}" hidden>
			<input type="text" name="secret" value="${qABoardVO.secret}" hidden>
			<input type="text" name="adminMod" value="${adminMod}" hidden>
		</td>
	</tr>
	<tr height="40"><td></td>
		<td><input type="submit" value="전송">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>
	<hr>

</form></table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br>

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