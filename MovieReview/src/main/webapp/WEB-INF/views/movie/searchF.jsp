<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색</title>
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
		});	// 메뉴에서 올리온 서치 버튼 눌렀을때
		
		
		$('#searchFormButton').click(function() {
			self.location="search"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType=all"
			+'&keyword='
			+$('#keywordForm').val();
		});
			
		
		
	});//ready
	


</script>
<style>

	
#searchFormMenu{
	position: relative;
	left: 25%;
	height: 60px;
	width: 50%;

}

#searchFormdiv{
	height: 60px;
	width: 85%;
	float: left;
}

#searchFormdiv2{
	height: 60px;
	width: 15%;
	float: left;

}

	#keywordForm{
		height:60px;
		width:100%;
		font-size:25px;
		text-align: center;	
	}
	
	#searchFormImg{
		height:56.5px;
		width:100%;
	}

</style>
</head>
<body>

<div id="header">
<h2 style="text-align: center">영화검색</h2>
</div>
<!-- //header -->


<div id="container">


<div id="searchFormMenu">
	
		<div id="searchFormdiv">
			<form action="search" method="get" id="searchForm">
				<input type="text" placeholder="검색어를 입력해주세요." name="keyword" id="keywordForm" value="${param.keyword}">
				<input type="text" value="all" name="searchType" hidden="true">
			</form>
		</div>
		
		<div id="searchFormdiv2">
			<button id="searchFormButton">
				<img src="resources/image/search.jpg" id="searchFormImg">
			</button>
		</div>

</div>
<br>
<br>
<div id="content">

<h3>${message}</h3>

<hr>

<c:forEach var="list" items="${movieList}">
	<c:choose>
		<c:when test="${loginID=='admin'}">
		<div style="float:left; margin: 40px">
			<a href="movieEditF?movie_num=${list.movie_num}&searchType=n"><img src="${list.posterfile}" width=300px; height=450px;>
			<br>${list.movie_title}
			</a>
		</div>
		</c:when>
		
		<c:otherwise>
		<div style="float:left; margin: 40px">
			<a href="mvdetail?movie_num=${list.movie_num}&searchType=n"><img src="${list.posterfile}" width=300px; height=450px;>
			<br>${list.movie_title}
			</a>
		</div>
		</c:otherwise>
	</c:choose>
</c:forEach>

</div> <!-- //content -->
<br>
<div style="position: absolute; bottom: 100px; width: 100%; text-align: center;">

	<font size="6">-</font>&nbsp;
	
	<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
		<a href="bcplist${pageMaker.searchQuery(1)}">처음으로</a>&nbsp;
		<a href="bcplist${pageMaker.searchQuery(pageMaker.spageNo-1)}">이전으로</a>&nbsp;&nbsp;
	</c:if>
	
	
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i==pageMaker.cri.currPage}"><font size="6">${i}</font>&nbsp;</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="bcplist${pageMaker.searchQuery(i)}"><font size="6">${i}</font></a>&nbsp;
		</c:if>
	</c:forEach>
	
	
	<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
		<a href="bcplist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&nbsp;다음으로</a>&nbsp;
		<a href="bcplist${pageMaker.searchQuery(pageMaker.lastPageNo)}">맨끝으로</a>&nbsp;
	</c:if>
	
	<font size="6">-</font>
</div>

</div><!-- //container -->

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