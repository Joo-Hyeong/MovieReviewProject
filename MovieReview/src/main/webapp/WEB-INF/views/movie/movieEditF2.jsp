<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 영화 수정 **</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	
	
function openLoginF(){
	var url="loginSimpleF"
		open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
}// openLoginF

$(function(){
	
	$('#posterfilef').change(function(){
		if(this.files && this.files[0]) {
			
			var reader = new FileReader;
				
			reader.onload = function(e) {
					$("#select_img").attr("src", e.target.result)
					.width(70).height(70); 
				} // onload_function
				
				reader.readAsDataURL(this.files[0]);
	 		
			} // if
		}); // change
	
	$('#takeaway').click(function(){
		$('#ratingF').css('display', 'block');
		
		
	});// takeaway.click
	
	$('.rating').click(function(){
		var rating = $('input[name="rate"]:checked').val();
		$('#ratingValue').html(rating+'점');
		
	});// rating.click
	
	
});//ready


</script>
<style>
#container{height: 1500px;}
#form1 fieldset{
  	display: inline-block;	/* 하위 별점 이미지들이 있는 영역만 자리를 차지함. direction 테그를 적용해야함으로 중요.*/
    border: 0; /* 필드셋 테두리 제거 */
    direction: rtl; /* 이모지 순서 반전 - 그이유는 선택자'~'가 해당부분부터 맨 끝까지 선택해주는거라 순서를 바꿔줘야함*/
}
.rating{
    display: none; /* 라디오박스 감춤 */
}
.ratingLabel{
    font-size: 2.5em; /* 이모지 크기 */
    color: transparent; /* 이모지의 색을 투명하게*/
    text-shadow: 0 0 0 #f0f0f0;} /* 이모지부분에 색을줌 text-shadow: (x축) (y축) (확산효과) (색) */

.ratingLabel:hover{
    text-shadow: 0 0 0 #FFD700; /* 마우스 호버 */
}
.ratingLabel:hover ~ label{
    text-shadow: 0 0 0 #FFD700; /* 마우스 호버부분부터 맨뒤의 라벨 요소까지 색을 바꿔줌 */
}

#form1 fieldset legend{
    text-align: left; /* 인라인 속성 방향을 반대로 해줘서 기본적으로 오른쪽으로 나옴. 따라서 위치를 따로 지정해줘야함 */
}
.rating:checked ~ label{
    text-shadow: 0 0 0 #FFD700; /* 마우스 클릭 체크 */
}

#select_img{
	height: 70 px;
	width: 70 px;
}
</style>
</head>
<body>
<div id="header">
<h2>** 영화 정보 **</h2>

</div>
<!-- //header -->

<div id="container">

<div id="content">
<img src="${Movie.posterfile}"><br>
<form action="editMovie" method="post" enctype="multipart/form-data">
<table>
	<tr height="40">
		<td bgcolor="Lavender">영화 번호</td>
		<td><input type="text" value="${Movie.movie_num}" name="movie_num" readonly="readonly"></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">제목</td>
		<td><input type="text" value="${Movie.movie_title}" name="movie_title"></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">감독</td>
		<td><input type="text" value="${Movie.director}" name="director"></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">출연배우</td>
		<td>
		<c:forEach var="list" items="${Actors}">
		<input type="text" value="${list.actor}" name="actor"><br>
		</c:forEach>
		</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">개봉일</td>
		<td><input type="date" value="${Movie.release}" name="release"></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">예고편</td>
		<td>
		<input type="text" value="${Movie.trailer}" name="trailer" width=130px;>

		</td>
	</tr>
	
	<tr height="40">
		<td bgcolor="Lavender">포스터</td>
		<td>
		<label for="posterfilef">
		<p>포스터 등록</p> 
			<img src="${Movie.posterfile}" id="select_img" width=70px; height=70px;>
			</label><br>
  	 		<input type="file" id="posterfilef" name="posterfilef" value="${Movie.posterfile}">
  	 		
		</td>
	</tr>
	
</table>

	<input type="submit" value="수정완료">&nbsp;
	<input type="reset" value="리셋">
</form>
</div>
<!-- // content -->

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