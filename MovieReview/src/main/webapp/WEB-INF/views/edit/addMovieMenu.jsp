<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>μν μΆκ°</title>
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

/* λ‘κ·ΈμΈ μ€ν¬λ¦½νΈ */
var iCheck=false;
var pCheck=false;


$(function(){

	$('#id').focusout(function(){
		iCheck=idCheckLogin();
		}); 
		
	$('#password').focusout(function() {
		pCheck=passwordCheckLogin();
		
		});

	
	
	$.ajax({
		type:"Get",
		url:"movieAddF",
		success:function(resultPage) {
			$('#insertMovie').html(resultPage);
			},
		error:function() {
			alert("μνμ μ₯ νΌ μ²λ¦¬ μλ¬.");
		}
	}); //ajax */

});//ready


function login(){
	
	
	if (iCheck==false) {
		$('#loginMessage').html(' μμ΄λλ₯Ό νμΈνμΈμ.');
		
	}else if (pCheck==false) {
		$('#loginMessage').html(' Password λ₯Ό νμΈνμΈμ.');
	
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
						alert('λ‘κ·ΈμΈ λμμ΅λλ€.');
						return location.reload();
						
					}else{
						$('#loginMessage').html('ν΄λΉ νμ μ λ³΄κ° μμ΅λλ€.');
					}
				},
				error:function(){
					alert('μλ²μ€λ₯μλλ€. κ΄λ¦¬μμκ² λ¬Έμν΄μ£ΌμΈμ.');
				}
				
				
			});

		}
}//login


function idCheckLogin(){
	var id=$('#id').val();
	
//μμ΄λ μ‘°κ±΄: 5~10κΈμ, μλ¬Έ μ«μ


		if(id==null){
			$('#loginMessage').html('μμ΄λλ₯Ό μλ ₯ν΄μ£ΌμΈμ.');
		}else if (id.length<5||id.length>10) {
			$('#loginMessage').html('μμ΄λλ 5~10μ μ΄λ΄ μλλ€.');
			return false;
		}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
			$('#loginMessage').html('μμ΄λλ μλ¬Έ, μ«μλ‘ μλ ₯ν΄μ£ΌμΈμ.');
			return false;
		}else {
			$('#loginMessage').html('');
			return true;
		}
}



function passwordCheckLogin(){
	var password=$('#password').val();
			
//ν¨μ€μλ μ‘°κ±΄: 8~20μ, μλ¬Έ μ«μ νΉμλ¬Έμ μ‘°ν© 
			if (password.length<8||password.length>20) {
				$('#loginMessage').html('λΉλ°λ²νΈλ 8~20μ μ΄λ΄ μλλ€. ');
				return false;
			}else if (password.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi,'').length == password.length
			||password.replace(/[a-z]/gi,'').length == password.length
			||password.replace(/[0-9]/gi,'').length == password.length) {
				$('#loginMessage').html('λΉλ°λ²νΈλ λ°λμ μλ¬Έ, μ«μ, νΉμλ¬Έμλ₯Ό μ‘°ν©ν΄μ£ΌμΈμ.');
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

<!-- footerλ©λ΄λ° κ³ μ  -->
<style type="text/css">

.wrap {
position: relative;
min-height: 100vh;
}

.general {
padding-bottom: 2.5rem; /* νΈν° λμ΄ */
}

.footer {
position: absolute;
bottom: 0;
width: 100%;
height: 2.5rem; /* νΈν° λμ΄ */
}


</style>

</head>
	
<body>

<div class="wrap">
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="home"><h1>κ·Έλ¦°<span>μνλ¦¬λ·°</span></h1></a>
			</div>
			
			<!-- μμΉλ²νΌ -->
			<div class="w3_search">
				<form action="search" method="post">
					<input type="text" name="keyword" placeholder="μν/κ°λ">
					<input type="text" name="searchType" value="all" hidden="">
					<input type="submit" value="κ²μ">
				</form>
			</div>
			
			<!-- λ‘κ·ΈμΈ/λνλ²νΈ -->
			<div class="w3l_sign_in_register">
				<ul>
					<c:if test="${loginID!=null}">
						<li>${loginNickName}λ μλνμΈμ.</li><br>
						<li><a href="myinfo">λ΄ μ λ³΄</a></li>
						<li><a href="logout">λ‘κ·Έμμ</a></li>
					</c:if>
					<c:if test="${loginID==null}">
						<li><a href="#" data-toggle="modal" data-target="#myModal">λ‘κ·ΈμΈ</a></li>
					</c:if>

				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->


<!-- λ‘κ·ΈμΈ -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					λ‘κ·ΈμΈ
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">

								<h3>λ‘κ·ΈμΈ μ λ³΄ μλ ₯</h3>
								<form>
								  <input type="text" id="id" name="id" placeholder="μμ΄λ" required="">
								  <input type="password" id="password" name="password" placeholder="λΉλ°λ²νΈ" required="">
									<span id="loginMessage" class="message"></span>
								  <input type="button" value="Login" onclick="login()">
								</form>
							  </div>
							  
							  
							  <span class="cta"><a href="joinA">νμκ°μ</a></span>/
							  <span class="cta"><a href="findPassF">λΉλ°λ²νΈ μ°ΎκΈ°</a></span>
							  
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
							<li><a href="home">Home</a></li>
							<li><a href="qalist">κ³ κ°μΌν°</a></li>
							
							<c:if test="${loginID=='admin'}">
								<li class="active"><a href="addMovieMenu">μν μΆκ°</a>
								<li><a href="memberUpdateMenu">νμ κ΄λ¦¬</a>
								<li><a href="qaAnswerMenu">κ³ κ°λ¬Έμ λ΅λ³</a>
							</c:if>
							
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>

<!-- general -->
	<div class="general">
		<h4 class="latest-text w3_latest_text">μνμΆκ°</h4>
		<div class="container">
	
							<!-- μνμ μ₯ -->
							<div role="tabpanel" id="insertMovie" >
						
							</div>
							<!-- //μνμ μ₯ -->					
					
				</div>
				<!-- // div(myTabContent) -->
				

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