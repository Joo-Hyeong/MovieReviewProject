<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>편집 모드</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


	function openSearch(){
		$('#search').toggle();
	}

	$(document).keydown(function(e) {
	    if ( e.keyCode == 27 || e.which == 27 ) {
	    	if($('#search').is(':visible')){
	    		$('#search').toggle();
	    	}
	    }//esc 누르면 서치창 꺼지게
	    
	    if ( e.keyCode == 13 || e.which == 13 ) {
	    	if($('#search').is(':visible')){
	    		$("#searchF").submit();
	    	}
	    }//엔터키 누르면 검색 실행
	    
	}); 
	
	$(function(){
		
		$('#searchButton').click(function(){
			$("#searchF").submit();
		});	
		
	});//ready
	


</script>
<style>
.menu{
	border:1px solid black;
	padding:5px;
	
}

.menu_input{
	display: none;

}

.menu_nav{
	display: none;
}

.menu_input:checked +.menu_nav{
	display:block;
}

.menubox{
	
	height: 40px;
	margin: 30px;
	float: left;
}
</style>
</head>
<body>

<!-- 
	1. 영화 저장, 수정
	2. 회원관리( 해당 회원의 한줄평들 까지 나오도록)
	3. 문의관리( 문의화면 그대로 가져오면서 답변안한거 찾기, 실시간 문의)
 -->

<h2>운영자 모드</h2>

<div id="header"></div>
<br>
<br>
<div id="container">
<br>
<h3>${message}</h3>
<hr>
	<div class="menubox">
		<label class="menu" for ="menu1" >영화 관리</label>
		<br>
		<br>
		<input id="menu1" class="menu_input" type="checkbox">
		<nav id="menu1_nav" class="menu_nav">
			<ul>
				<li><a href="movieAddF">영화 저장</a></li>
				<li><a href="search?keyword=&searchType=all">영화 수정</a></li>
				<li><a href="calendarF">영화 캘린더</a></li>
			</ul>
		</nav>
	</div>

	<div class="menubox">
		<a href="memberList" class="menu">회원 관리</a>
	</div>

	<div class="menubox">
		<label class="menu" for ="menu2" >문의 관리</label>
		<br>
		<br>
		<input id="menu2" class="menu_input" type="checkbox">
		<nav id="menu2_nav" class="menu_nav">
			<ul>
				<li><a href="#" onclick="alert('공사중 입니다.');">실시간 상담</a></li>
				<li><a href="qaAnswer">문의 답변</a></li>
			</ul>
		</nav>
	
	</div>



</div>
<!-- // container -->


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