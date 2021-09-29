<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="resources/library/checkBox.js"></script>
<script type="text/javascript">
function checkDelete() {
	var answer = confirm('위시리스트에서 삭제됩니다.진행하시겠습니까?');
	if (answer)
		return true;
	else
		return false;

}//checkDelete
</script>
</head>
<body>
<form action="wdelete" method="get">
	<table>
		<tr>
			<th><input type="checkbox" name="chkAll" id="chkAll"
				onclick="check()"></th>
			<th><label for="chkAll">전체체크</label></th>
			<th>영화제목</th>
			<th>영화감독</th>
			<th>평점</th>
			<th>개봉일</th>
		</tr>

		<c:forEach var="list" items="${Banana}">
			<tr>
				<td></td>
				<td><input type="checkbox" name="chk[]" class="chkd"
					value="${list.movie_num}">&nbsp;&nbsp;</td>
				<td><a
					href="mvdetail?movie_num=${list.movie_num}&searchType=n">${list.movie_title}</a>
				</td>

				<td>${list.director}</td>
				<td>평균평점구현</td>
				<td>${list.release}</td>
			</tr>
		</c:forEach>
	</table>



		<input type="submit" value="삭제하기" onclick="return checkDelete()"
			disabled id="submit">
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