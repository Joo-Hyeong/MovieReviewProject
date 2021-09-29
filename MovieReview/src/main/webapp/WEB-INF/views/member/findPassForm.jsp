<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>비밀번호 찾기</title>
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


<!-- findpass스크립트 -->
<script src="resources/library/checkJoinFrom.js"></script>
<script src="resources/library/ajaxForMember.js"></script>
<script>

var iCheck=false;
var eCheck=false;


$(function(){
	
	$('#findId').focus();
	
	$('#findId').focusout(function(){
		iCheck=findIdCheck();
	}); 
		
	$('#email').focusout(function(){
		eCheck=emailCheck();
	}); 

	
	$('#domainf').change(function(){
		
		var domainf = $('#domainf').val();
		
		if( domainf !='--선택해주세요--'){
		
			$('#domain').val(domainf);
			
			 if($('#domainf').val()=='직접입력'){
				 
			 	$('#domain').attr({
			 		readonly: false,
			 		placeholder: '주소를 입력해주세요.'
			 	});
			 	$('#domain').val('');
			}
		}else{
			$('#domain').attr({
		 		readonly: true,
		 		placeholder: '주소를 선택해주세요.'
		 	});
		 	$('#domain').val('');
		}
	});// domainf change
	
});//ready


function auth_Request(){
	
	
	if (iCheck==false) {
		$('#iMessage').html(' 아이디를 확인해주세요.');
	}
	if (eCheck==false) {
		$('#eMessage').html(' 이메일을 확인해주세요.');
	}

	if ( iCheck && eCheck ) {

			$.ajax({
			
				type:"Post",
				url:"findPass",
				data:{
					id:$('#findId').val(),
					email:$('#email').val()+'@'+$('#domain').val()
				},
				success:function(result){
					if(result.check=='T'){
						
						alert('개인정보인증 성공');
						/* opener.location.reload();
						self.close(); */
						$.ajax({
							type:"Post",
							url:"newpassf",
							data:{
								id:result.id
							},
							success:function(resultPage){
								$('#resultArea').html(resultPage);
							},
							error:function(){
								alert('서버오류입니다. 관리자에게 문의해주세요.');
							}
						});	//ajax_newpass
					}else{
						$('#message').html('아이디와 이메일을 확인해주세요.('+result.count+')회 시도');
						
					}
					
					/* 여기서 카운트 횟수 5회 이상이면 아이디 정지 기능 */
					
				},
				error:function(){
					console.log('서버오류입니다. 관리자에게 문의해주세요.');
				}
			});	//ajax_authrequest
		}//icheck if문
		
}//auth_Request

function simpleJoin(){
	
	opener.location.href="joinA";
	self.close();
}

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

</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="home"><h1>그린<span>영화리뷰</span></h1></a>
			</div>
			
			<!-- 서치버튼 -->
			<div class="w3_search">
				<form action="search" method="post">
					<input type="text" name="Search" placeholder="영화/감독/배우">
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
								<li><a href="editF">편집모드</a>
							</c:if>
							
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>

<!-- general -->
	<div class="general">
		<h4 class="latest-text w3_latest_text">비밀번호 찾기</h4>
		<div class="container">
			
			<form>
	<div style="margin: 5px;">
		<label for="findId">
		<p>아이디</p> 
		</label>
		<span>
			<input type="text" id="findId" name="id" maxlength="10">&nbsp;
		</span>

		<br>
		<span id="iMessage" class="message"></span>
	</div>
	
	<div style="margin: 5px;">
		<label for="email">
		<p>이메일</p> 
		</label>
		<span>
			<input type="text" id="email" name="email" maxlength="15">@
			<input type="text" id="domain" name="domain" readonly="true" size=15 placeholder="주소를 선택해주세요.">
			<select id="domainf">
				<option selected="selected">--선택해주세요--</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
				<option>직접입력</option>
			</select>
		</span><br>
		<span id="eMessage" class="message"></span>
	</div>

<br>
<a id="message"></a>

<input type="button" name="SUBMIT" value="인증요청" onclick="auth_Request()">
<input type="reset" value="취소" >

</form>

<div id="resultArea" style="margin: 5px;"></div>

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
</body>
</html>