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
//ID : 길이(4이상), 영문자,숫자 로만 구성
//password : 길이(4이상), 영문,숫자와 특수문자로 구성, 특수문자는 반드시 1개 이상 포함할것
//Name : 길이(2이상), 영문 또는 한글로 만 입력
//Level : select 를 이용 (X)
//BirthDay : 입력 여부 확인  ( length == 10 )
//Point : 정수의 범위  ( 숫자이면서, '.'이 없어야함 )
//Weight: 구간 (20 ~ 200)

var iCheck=false;

$(function(){
	
	$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
		}); // 영화 중복체크
		
		
	$('#posterfile').change(function(){
		if(this.files && this.files[0]) {
			
			var reader = new FileReader;
 			
			reader.onload = function(e) {
 				$("#select_img").attr("src", e.target.result)
 				.width(70).height(70); 
 			} // onload_function
 			
 			reader.readAsDataURL(this.files[0]);
	 		
			} // if
		}); // change		
		
		
	$('#addActor').click(function(){
		
		$('#addActorF').append('<input type="text" name="actor" placeholder="배우 입력">\
				<input type="button" class="deleteActor" value="제거"><br>');
		

		$('.deleteActor').click(function(){
			$(this).prev().remove();
			$(this).next().remove();
			$(this).remove();

		});
	});// addActor click
	

	$('#add').click(function(){
		
		var actor_arr = document.getElementsByName('actor');
		
		for(var i=0; i<actor_arr.length; i++){
			
			if(actor_arr[i].value==''){
				
				alert('배우이름이 비어있습니다. 확인해주세요.');
				
				return;
			}
		}
		
		$('#myForm').submit();
		
	});
	
}); // //ready
	

// inCheck 실행
function inCheck(){
	if (iCheck==false) {
		$('#iMessage').html('이미 존재하는 영화입니다.');
		return false;
	}else{
		alert('영화추가 완료');
		return true; }
	
}//inCheck


</script>
</head>
<body>

<div id="header">
<h2>영화 추가 입력폼</h2>
</div>
								
<div id="container">

<div id="content">
<form action="movieAdd" method="post" id="myForm" enctype="multipart/form-data">
	
	<div>
		<label for="movie_title">
		<p>영화 제목</p> 
		</label>
		<span>
			<input type="text" id="movie_title" name="movie_title" placeholder="영화제목 입력">
		</span>
		<br>
		<span id="mMessage"></span>
	</div>
	<br>
	
	<div>
		<label for="director">
		<p>감독</p> 
		</label>
		<span>
			<input type="text" id="director" name="director" placeholder="영화감독 입력">
		</span><br>
	</div>
	<br>
	
	<div>
		<label for="actor">
		<p>배우</p> 
		</label>
		<span>
			<input type="text" name="actor" placeholder="배우 입력"> 
			<input type="button" id="addActor" value="추가">
		</span><br>
	</div>
	<div id="addActorF">
	</div>
	
	<br>
	
	<div>
		<label for="release">
		<p>출시일</p> 
		</label>
		<span>
			<input type="date" id="release" name="release">
		</span><br>
	</div>
	<br>
	
	<div>
		<label for="posterfilef">
		<p>포스터 등록</p> 
		</label>
		<span>
			<img src="" id="select_img"><br>
  	 		<input type="file" id="posterfilef" name="posterfilef">
		</span>
	</div>
	<br>
	
	<div>
		<label for="trailer">
		<p>예고편 등록</p> 
		</label>
		<span>
			<input type="text" id="trailer" name="trailer">
		</span><br>
	</div><br>
	
	
	
	
	<div>
		<span>
			<input type="button" id="add" value="등록">&nbsp;
		</span>
		<span>
			<input type="button" value="취소">
		</span>
	</div>


</form>
</div>
<!-- //content -->

</div> 
<!-- //container -->
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