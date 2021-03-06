<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>그린 영화리뷰 홈</title>
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

<!-- 영화 분류 ajax 처리 -->
<script type="text/javascript">

$.ajax({
	type:"Get",
	url:"mvlist",
	data:{orderID:'new'},
	success:function(resultPage) {
		$('#new').html(resultPage);
		},
	error:function() {
		alert("new 영화처리 에러.");
	}
}); // new영화 ajax 처리


 $.ajax({
	type:"Get",
	url:"mvlist",
	data:{orderID:'random'},
	success:function(resultPage) {
		$('#random').html(resultPage);
		},
	error:function() {
		alert("random 영화처리 에러.");
	}
}); //random영화 ajax 처리


$.ajax({
	type:"Get",
	url:"mvlist",
	data:{orderID:'rating'},
	success:function(resultPage) {
		$('#rating').html(resultPage);
		},
	error:function() {
		alert("rating 영화처리 에러.");
	}
}); // rating영화 ajax 처리


var id = '${loginID}';
$.ajax({
	type:"Get",
	url:"wishlist",
	data:{
		orderID:'wish',
		id:id,
		searchType:'a'},
	success:function(resultPage) {
		$('#wish').html(resultPage);
		},
	error:function() {
		alert("wish 영화처리 에러.");
	}
}); //ajax */


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
						
					}else if(result.check=='F'){
						$('#loginMessage').html('비밀번호가 틀렸습니다.');
					}else{
						$('#loginMessage').html('일치하는 정보가 없습니다.');
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
<style type="text/css">

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

.message{
	color: red;
}

</style>

<!-- footer메뉴바 고정 -->
<style type="text/css">

.wrap {
position: relative;
min-height: 100vh;
}

.general {
padding-bottom: 2.5rem; /* 푸터 높이 */
}

.footer {
position: absolute;
bottom: 0;
width: 100%;
height: 2.5rem; /* 푸터 높이 */
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
		<h4 class="latest-text w3_latest_text">영화 분류</h4>
		<div class="container">
			
			<!-- 메뉴 탭화면 분류-->
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<!-- 주소에 #을 넣으면 해당 아이디로 찾아간다. 
						class active는 해당 영역 활성화-->
					<li role="presentation"  class="active"><a href="#new" role="tab" id="new-tab" data-toggle="tab" aria-controls="new" aria-expanded="false">최신 영화</a></li>
					<li role="presentation"><a href="#random" id="random-tab" role="tab" data-toggle="tab" aria-controls="random" aria-expanded="true">랜덤 영화</a></li>
					<li role="presentation"><a href="#rating" id="rating-tab" role="tab" data-toggle="tab" aria-controls="rating" aria-expanded="true">평점순 영화</a></li>
					<li role="presentation"><a href="#wish" id="wish-tab" role="tab" data-toggle="tab" aria-controls="wish" aria-expanded="true">찜한영화</a></li>
				</ul>
				
			<!-- 탭화면 분류 영화 -->
				<div id="myTabContent" class="tab-content">
					
					<!-- new 영화 리스트 -->
					<div role="tabpanel" class="tab-pane fade active in" id="new" aria-labelledby="new-tab">
						
					</div>
				
					<!-- 아이디가 랜덤 aria-controll이 randon-tab -->
					<div role="tabpanel" class="tab-pane fade" id="random" aria-labelledby="random-tab">
					
					</div>
				
					<!-- rating 영화 리스트 -->
					<div role="tabpanel" class="tab-pane fade" id="rating" aria-labelledby="rating-tab">
					
					</div>
					
					<!-- 찜한 영화 리스트 -->
					<div role="tabpanel" class="tab-pane fade" id="wish" aria-labelledby="wish-tab">
					
					</div>
					
				</div>
				<!-- // div(myTabContent) -->
				
			</div>
				<!-- 메뉴+영화박스 끝 -->
			
		</div>
			<!-- //container -->
		<br><br><br>
		
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
						<a href="contact">Contact Us</a>
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