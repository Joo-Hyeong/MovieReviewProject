<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 영화 정보 **</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

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

svg { fill:red; }
svg:hover { cursor:pointer }


.wishToast { width: 250px; 
			height: 20px; 
			height:auto; 
			position: fixed; 
			left: 50%;
			margin-left:-125px; 
			bottom: 100px; 
			z-index: 9999; 
			background-color: #383838; 
			color: #F0F0F0; 
			font-family: Calibri; 
			font-size: 15px; 
			padding: 10px; 
			text-align:center; 
			border-radius: 2px; 
			-webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
			-moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
			box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
		}
		
		
	.Y{
		display: none;
		border: 1px solid red;
	}
</style>

<script type="text/javascript">

$(function(){
	
	/* $('#like').hover(function() {
		
	}); like_hover */
	$('.like').click(function(){
		$.ajax({
			type: 'Post',
			url: 'winsert',
			data:{
				id:'${loginID}',
				movie_num:'${Movie.movie_num}',
				
			},
			success:function(resultData){
				if(resultData.successIn=='T'){ 
				//등록 성공 => 위시리스트로가시겠습니까?	filledHeart addWishToast
				$('#addWishToast').fadeIn(400).delay(1000).fadeOut(400);
				$('#emptyHeart').css('display','none');
				$('#filledHeart').css('display','');
				}else if(resultData.successDel=='T'){
				//등록 취소 => 취소 성공		
				$('#deleteWishToast').fadeIn(400).delay(1000).fadeOut(400);
				$('#emptyHeart').css('display','');
				$('#filledHeart').css('display','none');
				}

			},
			error:function(){
				alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~');
			}
		}); //ajax
		

	  }); //like_click 
	
	$('#takeaway').click(function(){
		$('#ratingF').css('display', 'block');
		
		
	});// takeaway.click
	
	$('.rating').click(function(){
		var rating = $('input[name="rate"]:checked').val();
		$('#ratingValue').html(rating+'점');
		
	});// rating.click
	
	$('#spoilerCheck').click(function() {
		var checked = $('#spoilerCheck').is(':checked');
		
		if(checked){	
			$('.Y').css('display','block');
		}else{
			$('.Y').css('display','none');	
		}
	});
	
	
	
});//ready

function submitForm1(){
	 
	 var params = $("#form1").serialize();
	 
	 $.ajax({
				type: 'POST',
				url:'addRating',
				data: params,
				success:function(e){
					
					if(e.success=='T'){
						alert('한줄평이 정상적으로 등록되었습니다.');
						location.reload();
						
					}else{
						alert('오류. 관리자에게 문의해주세요.');
					}
					
				},
				error:function(){
					alert('서버 오류. 관리자에게 문의해주세요.');
				}

	 }); // ajax 
} // submitForm1


function openLoginF(){
	var url="loginSimpleF"
		open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
}// openLoginF

function checkLogin() {
	if(confirm('로그인 후 이용 가능합니다. 로그인하시겠습니까?')){
		   openLoginF(); 
		   return true;
	} else return false;
}//checkLogin
	
</script>

</head>
<body>

<div id="header">
<h2>** 영화 정보 **</h2>

</div>
<!-- //header -->

<div id="container">

<div id="content">
<img src="${Movie.posterfile}"><br>
<table>
	<tr height="40">
		<td bgcolor="Lavender">찜하기</td>
		<td>
	<span id="likeSpan">
		<c:if test="${loginID!=null}">
			<c:choose>
				<c:when test="${Movie.like=='F'}">
					<svg id="emptyHeart" class="emptyHeart like" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
					<path d="M0 0h24v24H0z" fill="none"/>
					<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 
					3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 
					22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 
					4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 
					14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/></svg>
					
					<svg id="filledHeart" class="filledHeart like" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24" style="display: none;">
					<path d="M0 0h24v24H0z" fill="none"/>
					<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 
					3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 
					8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
					
					<div id="deleteWishToast" class='wishToast' style='display:none'>찜목록 삭제</div>
					<div id='addWishToast' class='wishToast' style='display:none'>찜목록 추가</div>
				</c:when>
				
				<c:when test="${Movie.like=='T'}">
					<svg id="emptyHeart" class="emptyHeart like" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24" style="display: none;">
					<path d="M0 0h24v24H0z" fill="none"/>
					<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 
					3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 
					22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 
					4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 
					14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/></svg>
					
					
					<svg id="filledHeart" class="filledHeart like" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
					<path d="M0 0h24v24H0z" fill="none"/>
					<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 
					3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 
					8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
					
					<div id="deleteWishToast" class='wishToast' style='display:none'>찜목록 삭제</div>
					<div id='addWishToast' class='wishToast' style='display:none'>찜목록 추가</div>
				</c:when>
			</c:choose>
		</c:if>
	</span>
		<c:if test="${loginID==null}">
			<span onclick="return checkLogin()">
				<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
				<path d="M0 0h24v24H0z" fill="none"/>
				<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 
				3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 
				22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 
				4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 
				14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/></svg>
			</span>
		</c:if>
		</td>
	</tr>

	<tr height="40">
		<td bgcolor="Lavender">제목</td><td>${Movie.movie_title}</td>
	</tr>	
	<tr height="40">
		<td bgcolor="Lavender">평점</td><td>${rating}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">감독</td><td>${Movie.director}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">출연배우</td>
		<td>
		<c:forEach var="list" items="${Actors}">${list.actor},</c:forEach>
		</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">개봉일</td><td>${Movie.release}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">예고편</td>
		<td>
		<iframe width="560" height="315" src="${Movie.trailer}" title="YouTube video player" 
			style="border: none;" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>
	
</table>
</div>
<!-- // content -->
	
<hr>
<div id="ratingForm">
<h3>한줄평</h3>


<c:if test="${loginID==null}"><input type="text" onclick="openLoginF()" placeholder="로그인이 필요합니다." size="30"></c:if>

<c:if test="${loginID!=null}">
<form method="post" action="addRating" id="form1">
<input type="text" id="takeaway" name="takeaway" placeholder="리뷰 등록하기" size="30">
<div id="ratingF" style="display: none;" >
	<br>
    <fieldset> <!-- 폼 테그내에서 관련된 양식을 묶을수 있음. 사용안하려면 disabled  -->
        <legend><h3>평점</h3></legend> <!-- 해당 필드셋 제목 -->
        <input type="radio" class="rating" name="rate" value="5" id="rate1"><label for="rate1" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="4" id="rate2"><label for="rate2" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="3" id="rate3"><label for="rate3" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="2" id="rate4"><label for="rate4" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="1" id="rate5"><label for="rate5" class="ratingLabel">⭐</label>
    </fieldset>
    <span id="ratingValue">0점</span>
    <br>
    <br>
    <h3>스포일러 여부</h3>
	<input type="radio" id="spoilerY" name="spoiler" value="Y"><label for="spoilerY">Y</label>
	<input type="radio" id="spoilerN" name="spoiler" value="N" checked="checked"><label for="spoilerN">N</label>
	<br>
	<br>
	<input type="hidden" id="movie_num" name="movie_num" value='${Movie.movie_num}'>
	<input type="hidden" id="id" name="id" value="${loginID}">
	<input type="button" onclick="submitForm1()" value="한줄평 등록하기">
</div> <!-- RatingF -->
</form></c:if>
<br>
<hr>

<div id="ratingList">
<c:if test="${ratingVoList!=null}">
<label for="spoilerCheck"> 스포일러 포함 &nbsp; </label>
	<input type="checkbox" id="spoilerCheck">
	<br>
	<br>
</c:if>

	<c:forEach var="list" items="${ratingVoList}">
		<c:if test="${list.rating_num>0}">
		<div class="${list.spoiler}" style="margin: 5px;">
		<ul>
			<li>
				<strong>아이디: </strong>${list.id} &nbsp; &nbsp; 
				<strong>평점:</strong>
		<c:choose>
			<c:when test="${list.rate==1}">⭐</c:when>
			<c:when test="${list.rate==2}">⭐⭐</c:when>
			<c:when test="${list.rate==3}">⭐⭐⭐</c:when>
			<c:when test="${list.rate==4}">⭐⭐⭐⭐</c:when>
			<c:when test="${list.rate==5}">⭐⭐⭐⭐⭐</c:when>
			<c:otherwise ></c:otherwise>
		</c:choose>&nbsp; &nbsp;
				<strong>등록일: </strong>${list.regdate}&nbsp; &nbsp;
				<strong>스포일러: </strong>${list.spoiler}<br>
				<strong>한줄평: </strong>${list.takeaway}<br>
			</li>	
		</ul>
			
		
		<br><br>
		</div>
		
		</c:if>
	</c:forEach>
	<br>
	
	
	<%-- 
	<c:choose>
		<c:when test="${sPageNo>pageNoCount}">
			<a href="bpagelist?currentPage=1">&lt;&lt;</a>&nbsp;
			<a href="bpagelist?currentPage=${sPageNo-1}">&lt;</a>&nbsp;&nbsp;
		</c:when>
		<c:otherwise>
			<font color="gray">&lt;&lt;&nbsp;&lt;</font>&nbsp;&nbsp;
		</c:otherwise>
	</c:choose> 
	
	<c:forEach var="i" begin="${sPageNo}" end="${ePageNo}">
		<c:if test="${i==currentPage}"><font size="5">${i}</font>&nbsp;</c:if>
		<c:if test="${i!=currentPage}">
			<a href="bpagelist?currentPage=${i}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
	&nbsp;
	<c:choose>
		<c:when test="${ePageNo<totalPageNo}">
				<a href="bpagelist?currentPage=${ePageNo+1}">&gt;</a>&nbsp;	
				<a href="bpagelist?currentPage=${totalPageNo}">&gt;&gt;</a>&nbsp;
		</c:when>
		<c:otherwise>
			<font color="gray">&gt;&nbsp;&gt;&gt;</font>
		</c:otherwise>
	</c:choose> --%>

</div><!-- //ratingList -->
    
</div>
<!-- // ratingForm -->

</div>
<!-- // container -->
<br>
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