<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keywordTop').val('');
	}); //change
	
	$('#searchBtn').on("click", function() {
		self.location="qalist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+$('#keywordTop').val()	
				
	}); //on_click
	
	$("tr:nth-child(2n)").css({
		background: "#e6e6e6"
	}); //css
	
}) //ready
var id='${loginID}';
function checkLogin(){
	
	if(id.length==0){
		alert('로그인 후 이용해주세요.');
		var url="loginSimpleF"
		open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
		return false;
	}
}//checkLogin

function openInsertF(){
	
	if(id.length==0){
			alert('로그인 후 이용해주세요.');
			var url="loginSimpleF"
			open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
		}else{
			self.location="qainsertf";
		}
}//openInsertF

function secretCheck(id_list,secret_list) {
	if(id == id_list || id == 'admin' || secret_list == 'N'){
		// 글 조회 가능
		return true;
	}else {
		// 글 조회 불가능
		if(id != id_list){
			alert('비밀글은 작성자 및 관리자만 조회가 가능합니다');
		}else if(secret_list!='N'){
			alert('비밀글입니다');
		}

		return false;
	}
} //secretCheck

</script>
</head>
<body>
<h2>** 고객센터 **</h2>
<br>
<c:if test="${message!=null}">
 => ${message}<br> 
</c:if>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >---</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >Title</option>
		<option value="c" <c:out value="${pageMaker.cri.searchType=='c' ? 'selected':''}"/> >Content</option>
		<option value="w" <c:out value="${pageMaker.cri.searchType=='w' ? 'selected':''}"/> >Writer(ID)</option>
		<option value="tc" <c:out value="${pageMaker.cri.searchType=='tc' ? 'selected':''}"/> >Title or Content</option>
		<option value="cw" <c:out value="${pageMaker.cri.searchType=='cw' ? 'selected':''}"/> >Content or Writer</option>
		<option value="tcw" <c:out value="${pageMaker.cri.searchType=='tcw' ? 'selected':''}"/> >Title or Content or Writer</option>
	</select>
	<input type="text" name="keywordTop" id="keywordTop" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div>
<br><hr>
<table>
<tr height="40" bgcolor="PaleTurquoise">
	<th>번호</th><th>제목</th><th>ID</th><th>등록일</th><th>조회수</th>
</tr>
<c:forEach var="list" items="${Banana}"><tr height="40">
	<td align="center">${list.seq}</td>
	<td width="400">
		<!-- 답글 등록후 indent 에 따른 들여쓰기 
			=> 답글인 경우에만 적용  -->
		<c:if test="${list.indent>0}">
			<c:forEach begin="1" end="${list.indent}">
				<span>&nbsp;&nbsp;</span>
			</c:forEach>
			<span style="color:Purple">re..</span>
		</c:if>
	
		<!-- 비밀글인 경우 제목 앞에 자물쇠 이미지 추가 -->
		<c:if test="${list.secret=='Y'}"><img src="resources/image/secret_head.gif"></c:if>
		<c:if test="${list.secret!='Y'}">&nbsp;&nbsp;</c:if>
			<a onclick="return secretCheck('${list.id}','${list.secret}')" href="qadetail?seq=${list.seq}&id=${list.id}">${list.title}</a>

	</td>
	<td>${list.id}</td><td>${list.regdate}</td><td align="center">${list.cnt}</td>
</tr>

</c:forEach>
</table>
<br><hr>
<div align="center">
	<!-- Paging 2 : Criteria 적용 
		=> ver01 : pageMaker.makeQuery(?)
		=> ver02 : pageMaker.searchQuery(?)
	
		 1)  First << ,  Prev <  처리 -->
	<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
		<a href="qalist${pageMaker.searchQuery(1)}">1..</a>&nbsp;
		<a href="qalist${pageMaker.searchQuery(pageMaker.spageNo-1)}">[<]</a>
	</c:if>
	
	<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="qalist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
	&nbsp;
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
		<a href="qalist${pageMaker.searchQuery(pageMaker.epageNo+1)}">[>]</a>&nbsp;
		<a href="qalist${pageMaker.searchQuery(pageMaker.lastPageNo)}">..${pageMaker.lastPageNo}</a>&nbsp;&nbsp;
	</c:if>
	<br>
	<c:if test="${loginID!='admin'}">
	<a href="myqalist?id=${loginID}" onclick="return checkLogin()">내 문의</a>&nbsp;&nbsp;
	<button onclick="openInsertF()">문의하기</button><br>
	</c:if>
</div>

<br><hr>
<div id="resultArea"></div>
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