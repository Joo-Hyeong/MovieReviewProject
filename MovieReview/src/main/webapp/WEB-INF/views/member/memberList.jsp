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

$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#topKeyword').val('');
	}); //change
	// 검색후 요청
	$('#searchBtn').on("click", function() {
		
		self.location="memberUpdateMenu"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&Keyword='
			+$('#topKeyword').val()
	}); //on_click
	
	

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
		height: 600px;
		width: 548px;
		border: 1px solid black;
		
	}

	#memberTH> th{
		text-align: center;
		color: white;
	
	}
</style>
</head>
<body>
<div id="container" style="margin: 0 auto; width:1100px; height:600px;" >

<div id="searchMember">

<h2>회원 목록</h2>
<br>
<br>
<br><hr>
<br>
<table border="1"  style="margin-left: auto; margin-right: auto; width: 500px;">
<tr height="30" bgcolor="#FF8D1B" id="memberTH">
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
<br>
<br>
<br>
<br>
<br>
</body>
</html>