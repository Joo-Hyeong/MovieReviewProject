<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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


$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#topKeyword').val('');
	}); //change
	// 검색후 요청
	$('#searchBtn').on("click", function() {
		self.location="memberList"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&Keyword='
			+$('#topKeyword').val()
	}); //on_click
	
	
	$('#searchButton').click(function(){
		$("#searchF").submit();
	});	
	
}) //ready

function memberDetail(id) {
	$.ajax({
		type: 'Get',
		url:'memberUpdateF?id='+id,
		
		success:function(resultPage){
			$('#updateMemberF').html(resultPage);
		},
		error:function(){
			alert('서버 오류. 관리자에게 문의해주세요.');
		}
	}); //ajax
}
</script>
<style>	
	
	#searchMember, #updateMember{
	
		float: left;
		height: 700px;
		width: 698px;
		border: 1px solid black;
		
	}

</style>
</head>
<body>
<h2 align="center">회원 정보관리</h2>
<br>
<br>
<div id="container" style="margin: 0 auto; width:1400px; height:700px;" >

<div id="searchMember">

<h2>회원 목록</h2>
<br>
<br>
<br><hr>
<br>
<table border="1"  style="margin-left: auto; margin-right: auto; width: 500px;">
<tr height="30" bgcolor="Azure">
	<th>아이디</th><th>이메일</th><th>닉네임</th><th>등급</th>	<th>추천인</th>
</tr>
<c:forEach var="list" items="${memberList}">
<tr height="30" align="center">
	<td><a href="javascript:void(0);" onclick="memberDetail('${list.id}')">${list.id}</a></td><td>${list.email}</td><td>${list.nickName}</td><td>${list.grade}</td>
	<td>${list.rid}</td>
</tr>
</c:forEach>
</table>
<br>
<div id="topSearchBar" style="margin-left: auto; margin-right: auto; width: 300px;">
	<select name="searchType" id="searchType" >
		<option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >---</option>
		<option value="a" <c:out value="${pageMaker.cri.searchType=='a' ? 'selected':''}"/> >전체</option>
		<option value="i" <c:out value="${pageMaker.cri.searchType=='i' ? 'selected':''}"/> >ID</option>
		<option value="nn" <c:out value="${pageMaker.cri.searchType=='nn' ? 'selected':''}"/> >NickName</option>
	</select>
	<input type="text" name="topKeyword" id="topKeyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div>
<br><hr>
<div align="center">
	<!-- Paging 2 : SearchCriteria 적용 
		 1)  First << ,  Prev <  처리 -->
	<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
		<a href="mcplist${pageMaker.searchQuery(1)}">FF</a>&nbsp;
		<a href="mcplist${pageMaker.searchQuery(pageMaker.spageNo-1)}">Prev</a>
	</c:if>
	<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="mcplist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
	&nbsp;
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
		<a href="mcplist${pageMaker.searchQuery(pageMaker.epageNo+1)}">Next</a>&nbsp;
		<a href="mcplist${pageMaker.searchQuery(pageMaker.lastPageNo)}">LL</a>&nbsp;&nbsp;
	</c:if>
</div>
</div> <!-- searchMember -->
<div id="updateMember">
<h2>회원정보 수정</h2>
<br>
<br>
<div id="updateMemberF" style="text-align: center; margin: 0 auto;"></div>
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