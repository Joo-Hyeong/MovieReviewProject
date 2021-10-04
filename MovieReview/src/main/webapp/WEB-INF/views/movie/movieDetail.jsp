<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>영화 상세정보</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="resources/bootstrap/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="resources/bootstrap/css/faqstyle.css" type="text/css" media="all" />
<link href="resources/bootstrap/css/single.css" rel='stylesheet' type='text/css' />
<link href="resources/bootstrap/css/medile.css" rel='stylesheet' type='text/css' />
<!-- banner-slider -->
<!-- <link href="resources/bootstrap/css/jquery.slidey.min.css" rel="stylesheet"> -->
<!-- //banner-slider -->
<!-- pop-up -->
<link href="resources/bootstrap/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="resources/bootstrap/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript" src="resources/bootstrap/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- banner-bottom-plugin -->
<link href="resources/bootstrap/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="resources/bootstrap/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
	 
		});
	 
	}); 
</script> 
<!-- //banner-bottom-plugin -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="resources/bootstrap/js/move-top.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->


<script type="text/javascript">

/* 로그인 스크립트 */
var iCheck=false;
var pCheck=false;


$(function(){

	$('#id').focusout(function(){
		iCheck=idCheckLogin();
		}); 
		
	$('#password').focusout(function() {
		pCheck=passwordCheckLogin();
		
		});

});//ready


function login(){
	
	
	if (iCheck==false) {
		$('#loginMessage').html(' 아이디를 확인하세요.');
		
	}else if (pCheck==false) {
		$('#loginMessage').html(' Password 를 확인하세요.');
	
	}

	if ( iCheck && pCheck ) {
		
			$.ajax({
			
				type:"Post",
				url:"login",
				data:{
					id:$('#id').val(),
					password:$('#password').val()
				},
				success:function(result){
					if(result.check=='T'){
						alert('로그인 되었습니다.');
						return location.reload();
						
					}else{
						$('#loginMessage').html('해당 회원 정보가 없습니다.');
					}
				},
				error:function(){
					alert('서버오류입니다. 관리자에게 문의해주세요.');
				}
				
				
			});

		}
}//login


function idCheckLogin(){
	var id=$('#id').val();
	
//아이디 조건: 5~10글자, 영문 숫자


		if(id==null){
			$('#loginMessage').html('아이디를 입력해주세요.');
		}else if (id.length<5||id.length>10) {
			$('#loginMessage').html('아이디는 5~10자 이내 입니다.');
			return false;
		}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
			$('#loginMessage').html('아이디는 영문, 숫자로 입력해주세요.');
			return false;
		}else {
			$('#loginMessage').html('');
			return true;
		}
}



function passwordCheckLogin(){
	var password=$('#password').val();
			
//패스워드 조건: 8~20자, 영문 숫자 특수문자 조합 
			if (password.length<8||password.length>20) {
				$('#loginMessage').html('비밀번호는 8~20자 이내 입니다. ');
				return false;
			}else if (password.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi,'').length == password.length
			||password.replace(/[a-z]/gi,'').length == password.length
			||password.replace(/[0-9]/gi,'').length == password.length) {
				$('#loginMessage').html('비밀번호는 반드시 영문, 숫자, 특수문자를 조합해주세요.');
				return false;
			}else {
				$('#loginMessage').html('');
				return true;
			}
}//passCheck


</script>
<script type="text/javascript">

$(function(){
	
	
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
				alert('서버 오류 !! 관리자에게 문의해주세요.');
			}
		}); //ajax
		

	  }); //like_click 
	
	$('#takeaway').click(function(){
		var url="inputRatingF?movie_num=${Movie.movie_num}"
			open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
	});// takeaway.click	
	
	
	$('#spoilerCheck').click(function() {
		var checked = $('#spoilerCheck').is(':checked');
		
		if(checked){	
			$('.Y').css('display','block');
		}else{
			$('.Y').css('display','none');	
		}
	});
	
});//ready

function openLoginF(){
	
	alert('로그인이 필요합니다.');
	
	}// openLoginF
	
	

	
</script>



<style type="text/css">
	.Y{
		display: none;
		border: 1px solid #FF8D1B;
	}

.form-module input[type="button"] {
	background: #919191;
    width: 100%;
    border: 0;
    padding: 10px 15px;
    color: #ffffff;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
    font-size: 1em;
    font-weight: bold;
    text-transform: uppercase;
	outline:none;
}
.form-module input[type="button"]:hover {
  background:#FF8D1B;
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
			background-color: #FF8D1B;
			color: white; 
			font-family: Calibri; 
			font-size: 15px; 
			padding: 10px; 
			text-align:center; 
			border-radius: 2px; 
			-webkit-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
			-moz-box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
			box-shadow: 0px 0px 24px -1px rgba(56, 56, 56, 1); 
		}
		
		
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
</style>

<!-- footer메뉴바 고정 -->
<style type="text/css">

.wrap {
position: relative;
min-height: 100vh;
}

.general {
padding-bottom: 150px; /* 푸터 높이 */
}

.footer {
position: absolute;
bottom: 0;
width: 100%;
height: 150px; /* 푸터 높이 */
}


</style>

</head>
	
<body>
<div class="wrap">

<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="home"><h1>그린<span>영화리뷰</span></h1></a>
			</div>
			
			<!-- 서치버튼 -->
			<div class="w3_search">
				<form action="search" method="post">
					<input type="text" name="keyword" placeholder="영화/감독">
					<input type="text" name="searchType" value="all" hidden="">
					<input type="submit" value="검색">
				</form>
			</div>
			
			<!-- 로그인/대표번호 -->
			<div class="w3l_sign_in_register">
				<ul>
					<c:if test="${loginID!=null}">
						<li>${loginNickName}님 안녕하세요.</li><br>
						<li><a href="myinfo">내 정보</a></li>
						<li><a href="logout">로그아웃</a></li>
					</c:if>
					<c:if test="${loginID==null}">
						<li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
					</c:if>

				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->


<!-- 로그인 -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					로그인
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">

								<h3>로그인 정보 입력</h3>
								<form>
								  <input type="text" id="id" name="id" placeholder="아이디" required="">
								  <input type="password" id="password" name="password" placeholder="비밀번호" required="">
									<span id="loginMessage" class="message"></span>
								  <input type="button" value="Login" onclick="login()">
								</form>
							  </div>
							  
							  
							  <span class="cta"><a href="joinA">회원가입</a></span>/
							  <span class="cta"><a href="findPassF">비밀번호 찾기</a></span>
							  
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

	

<!-- nav -->
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="home">Home</a></li>
							<li><a href="qalist">고객센터</a></li>
							
							<c:if test="${loginID=='admin'}">
								<li><a href="addMovieMenu">영화 추가</a>
								<li><a href="memberUpdateMenu">회원 관리</a>
								<li><a href="qaAnswerMenu">고객문의 답변</a>
							</c:if>
							
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>

<!-- general -->
	<div class="general">
	<span id="likeSpan">
		<h4 class="latest-text w3_latest_text">${Movie.movie_title}
		
		
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
		</h4>
	</span> <!--// like span -->
		

		<div class="container">
			
						<!-- 메뉴 탭화면 분류-->
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
				
					<!-- 주소에 #을 넣으면 해당 아이디로 찾아간다. 
						class active는 해당 영역 활성화-->
					<li role="presentation"  class="active"><a href="#movieDetail" role="tab" id="movieDetail-tab" data-toggle="tab" aria-controls="movieDetail" aria-expanded="false">상세정보</a></li>
					<li role="presentation"><a href="#comments" id="comments-tab" role="tab" data-toggle="tab" aria-controls="comments" aria-expanded="true">한줄평</a></li>

				</ul>
				
			<!-- 탭화면 분류 영화 -->
				<div id="myTabContent" class="tab-content">
					
					<!-- 영화 상세탭 -->
					<div role="tabpanel" class="tab-pane fade active in" id="movieDetail" aria-labelledby="movieDetail-tab">
						
						<div>
							<iframe width="560" height="315" src="${Movie.trailer}" title="YouTube video player" 
							style="border: none;" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
						</div>	
						
						<div style="display: inline-block;">
							<font style="font-size: 20px">유저 평점: &nbsp;</font>
			
									<div class="block-stars">
									<ul class="w3l-ratings">
										<c:forEach var="i" begin="1" end="${rating}">
    										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>	
										</c:forEach>	
										</ul>	
									</div>
									
									<c:if test="${rating<1}">
										<font style="font-size: 20px">아직 등록된 평점이 없습니다.</font>
									</c:if>

						</div>	
						<br>
						<br>
						<div class="input-group w3_w3layouts">
							<span class="input-group-addon" id="basic-addon1" style="width:60px">제목</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="movie_title" value="${Movie.movie_title}" readonly="readonly" style="width:300px">
						</div>
	
						<div class="input-group w3_w3layouts">
							<span class="input-group-addon" id="basic-addon2" style="width:60px">감독</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Movie.director}" readonly="readonly" style="width:300px">
						</div>
	
						<div class="input-group w3_w3layouts">
							<span class="input-group-addon" id="basic-addon3" style="width:60px">배우</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value='<c:forEach var="list" items="${Actors}" begin="0" end="2">"${list.actor}"&nbsp;</c:forEach>' readonly="readonly" style="width:300px">
						</div>
	
						<div class="input-group w3_w3layouts">
							<span class="input-group-addon" id="basic-addon4" style="width:60px">출시일</span>
							<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" value="${Movie.release}" readonly="readonly" style="width:300px">
						</div>
	
					</div>
					<!-- 영화 상세탭 -->
					
					
					
					
					<!--한줄평 -->
					<div role="tabpanel" class="tab-pane fade" id="comments" aria-labelledby="comments-tab">
					
					
						<h3>한줄평</h3>
						<c:if test="${loginID==null}"><input type="text" onclick="openLoginF()" placeholder="로그인이 필요합니다." size="30"></c:if>
						<c:if test="${loginID!=null}">
							<input type="text" id="takeaway" name="takeaway" placeholder="리뷰 등록하기" size="30">
						</c:if>
					
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
		</c:choose>
		
		
		&nbsp; &nbsp;
				<strong>등록일: </strong>${list.regdate}&nbsp; &nbsp;
				<strong>스포일러: </strong>${list.spoiler}<br>
				<strong>한줄평: </strong>${list.takeaway}<br>
			</li>	
		</ul>
			
		
		<br><br>
		</div>
		
		</c:if>
	</c:forEach>

</div><!-- //ratingList -->					

					</div>
					<!--//한줄평  -->
					
				</div>
				<!-- // div(myTabContent) -->
				
			</div>
				<!-- 메뉴+영화박스 끝 -->
			
			
			
		</div>
			<!-- //container -->
		
	</div>
<!-- //general -->

<!-- footer -->
	<div class="footer">
		<div class="container">
			
			
			<div class="col-md-5 w3ls_footer_grid1_left">
				<p>&copy; All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
			<div class="col-md-7 w3ls_footer_grid1_right">
				<ul>
					<li>
						<a href="#">Company</a>
					</li>
					<li>
						<a href="#">Contact Us</a>
					</li>
					<li style="color: white;"><i class="fa fa-phone" aria-hidden="true"></i> (+031) 712-7557</li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- //Bootstrap Core JavaScript -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</div>
</body>
</html>