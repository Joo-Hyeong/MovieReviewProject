<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>고객센터</title>
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
	}else{

		self.location="qalist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+id;
	}
	
}//checkLogin

function openInsertF(){
	
	if(id.length==0){
			alert('로그인 후 이용해주세요.');
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

.table>thead>tr>th{
	color: white;

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
							<li><a href="home">Home</a></li>
							<li class="active"><a href="qalist">고객센터</a></li>
							
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
		<h4 class="latest-text w3_latest_text">고객센터</h4>
		<div class="container">
			
			
			<!-- 메뉴 탭화면 분류-->
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<!-- 주소에 #을 넣으면 해당 아이디로 찾아간다. 
						class active는 해당 영역 활성화-->
					<li role="presentation" class="active"><a href="#qaL" id="qaL-tab" role="tab" data-toggle="tab" aria-controls="qaL" aria-expanded="true">문의 게시판</a></li>
					<li role="presentation"><a href="#qa" role="tab" id="qa-tab" data-toggle="tab" aria-controls="qa" aria-expanded="false">자주 묻는 질문</a></li>
					
				</ul>
				
			<!-- 탭화면 분류 전체div -->
				<div id="myTabContent" class="tab-content">
					
					<!-- 자주묻는질문 -->
					<div role="tabpanel" class="tab-pane fade" id="qa" aria-labelledby="qa-tab">
						<div class="panel-group w3l_panel_group_faq" id="accordion" role="tablist" aria-multiselectable="true">
				
				<!-- 첫번째 -->
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
					  <h4 class="panel-title asd">
						<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						  <i class="glyphicon glyphicon-minus" aria-hidden="true"></i>평점은 어떻게 등록하나요?
						</a>
					  </h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					  <div class="panel-body panel_text">
						평점 등록은 로그인 후 해당 영화탭 하단에서 등록하시면 됩니다.
					  </div>
					</div>
				  </div>
				  
				  <!-- 두번째 -->
				  <div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
					  <h4 class="panel-title asd">
						<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						  <i class="glyphicon glyphicon-minus" aria-hidden="true"></i>그린 컴퓨터 학원은 어디에 위치하고 있나요?
						</a>
					  </h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					   <div class="panel-body panel_text">
						그린 컴퓨터 학원은 미금역에 위치하고 있습니다. 상세 정보는 하단메뉴에서 확인해주세요.
					  </div>
					</div>
				  </div>
				  
				 
				</div>
			</div> <!-- //자주묻는질문 -->
				
				
			<!-- 게시판 -->
			<div role="tabpanel" class="tab-pane fade  active in" id="qaL" aria-labelledby="qaL-tab" align="center">

<table  class="table">
<thead>
<tr style="background: #FF8D1B;" id="tableTH" >
	<th>번호</th><th>제목</th><th>ID</th><th>등록일</th><th>조회수</th>
</tr>
</thead>

<tbody>
<c:forEach var="list" items="${Banana}"><tr height="40">

	<td>${list.seq}</td>
	<td>
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
	<td>${list.id}</td><td>${list.regdate}</td><td>${list.cnt}</td>
</tr>

</c:forEach>
</tbody>
</table>		

<br>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >- 선택 -</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >Title</option>
		<option value="c" <c:out value="${pageMaker.cri.searchType=='c' ? 'selected':''}"/> >Content</option>
		<option value="w" <c:out value="${pageMaker.cri.searchType=='w' ? 'selected':''}"/> >Writer(ID)</option>
		<option value="tc" <c:out value="${pageMaker.cri.searchType=='tc' ? 'selected':''}"/> >Title or Content</option>
		<option value="cw" <c:out value="${pageMaker.cri.searchType=='cw' ? 'selected':''}"/> >Content or Writer</option>
	</select>
	<input type="text" name="keywordTop" id="keywordTop" value="${pageMaker.cri.keyword}">
	<a class="label label-warning" id="searchBtn">Search</a>
</div>
<br><hr>
<div align="center">

	<nav>			
	<ul class="pagination">	
	
	<c:choose>
		
		<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
			<li><a href="qalist${pageMaker.searchQuery(pageMaker.spageNo-1)}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>				
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		</c:otherwise>
	</c:choose>	
	
	
	<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<li class="active"><a href="#">${i}<span class="sr-only">(current)</span></a></li>
						
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<li><a href="qalist${pageMaker.searchQuery(i)}">${i}</a></li>
		</c:if>
	</c:forEach>
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:choose>
		
		<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
			<li><a href="qalist${pageMaker.searchQuery(pageMaker.epageNo+1)}" aria-label="Next"><span aria-hidden="true">»</span></a></li>	
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>	
		</c:otherwise>
	</c:choose>	
	</ul>

	</nav>
	<br>
	<c:if test="${loginID!='admin'}">
	
	<button onclick="checkLogin()">내 문의</button>
	<button onclick="openInsertF()">문의하기</button><br>
	</c:if>
</div>

<br><hr>
<div id="resultArea"></div>
					
					
			</div><!-- //게시판 -->
			
			</div><!-- //탭화면 분류 전체div -->
		</div><!-- //메뉴+탭화면 분류 -->
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