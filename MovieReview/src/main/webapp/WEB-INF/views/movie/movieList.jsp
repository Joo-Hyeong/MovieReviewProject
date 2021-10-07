<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>

<html>
<html lang="en">
<head>
<title>영화목록 분류</title>
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
	
	
function pre_new(){
		$.ajax({
		type:"Get",
		url:"mvlist"+"${pageMaker.searchQuery(pageMaker.spageNo-1)}",
		data:{orderID:'new'},
		success:function(resultPage) {
			
			$('#new').html(resultPage);
			},
		error:function() {
			alert("최신 이전 영화처리 에러.");
		}
	}); //ajax */
	
}


function cur_new(i){

	$.ajax({
	type:"Get",
	url:"mvlist",
	data:{orderID:'new',
		currPage:i,
		rowsPerPage:6
	},
	success:function(resultPage) {
		
		$('#new').html(resultPage);
		},
	error:function() {
		alert("최신 현재 영화처리 에러.");
	}
}); //ajax */

}


function next_new(){
	$.ajax({
	type:"Get",
	url:"mvlist"+"${pageMaker.searchQuery(pageMaker.epageNo+1)}",
	data:{orderID:'new'},
	success:function(resultPage) {		
		$('#new').html(resultPage);
		},
	error:function() {
		alert("최신 다음 영화처리 에러.");
	}
}); //ajax */

}


function cur_random(){

	$.ajax({
	type:"Get",
	url:"mvlist",
	data:{orderID:'random',
		currPage:1,
		rowsPerPage:6
	},
	success:function(resultPage) {
		
		$('#random').html(resultPage);
		alert('랜덤영화를 다시 가져왔습니다.');
		
		},
	error:function() {
		alert("랜덤 영화 다시가져오기 처리 에러.");
	}
}); //ajax */

}


function pre_rating(){
	$.ajax({
	type:"Get",
	url:"mvlist"+"${pageMaker.searchQuery(pageMaker.spageNo-1)}",
	data:{orderID:'rating'},
	success:function(resultPage) {
		
		$('#rating').html(resultPage);
		},
	error:function() {
		alert("평점 이전 영화처리 에러.");
	}
}); //ajax */

}


function cur_rating(i){

$.ajax({
type:"Get",
url:"mvlist",
data:{orderID:'rating',
	currPage:i,
	rowsPerPage:6
},
success:function(resultPage) {
	
	$('#rating').html(resultPage);
	},
error:function() {
	alert("평점 현재 영화처리 에러.");
}
}); //ajax */

}


function next_rating(){
$.ajax({
type:"Get",
url:"mvlist"+"${pageMaker.searchQuery(pageMaker.epageNo+1)}",
data:{orderID:'rating'},
success:function(resultPage) {		
	$('#rating').html(resultPage);
	},
error:function() {
	alert("평점 다음 영화처리 에러.");
}
}); //ajax */

}


</script>
<!-- start-smoth-scrolling -->
</head>
<body>

<c:if test="${message!=null}">
<h2>${message}</h2>
</c:if>
<c:if test="${messageHome!=null}">
<h2>${messageHome}</h2>
</c:if>




<div>
<c:forEach var="list" begin="0" end="5" items="${Banana}">
<!-- 영화정보카드 div -->

			<c:choose>
				<c:when test="${loginID!='admin'}">
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="mvdetail?movie_num=${list.movie_num}&searchType=n" class="hvr-shutter-out-horizontal"><img src="${list.posterfile}" title="album-name" class="img-responsive"/>
									<!-- 포스터 가져다올리면 플레이서클 나오는거 -->
									<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
								</a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6><a href="mvdetail?movie_num=${list.movie_num}&searchType=n">${list.movie_title}</a></h6>							
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>${list.release}</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<!-- movieVO에 rating 변수 추가. 매퍼 컨트롤러 수정해서 rating 받아옴 -->
												<c:forEach var="i" begin="1" end="${list.rate_avg}">
    												<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
												</c:forEach>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								
								<!-- 컨트롤러에서 new인 영화가 맞는지 확인후 값이 트루면 new마크를 달아줌 -->
								<c:if test="${newMovie=='T'}">
									<div class="ribben">
										<p>NEW</p>
									</div>
								</c:if>
								
							</div> <!-- // 영화정보카드 div -->
					</c:when>	
					
					<c:when test="${loginID=='admin'}">
					
					<div class="col-md-2 w3l-movie-gride-agile">
								<a href="movieEditF?movie_num=${list.movie_num}&searchType=n" class="hvr-shutter-out-horizontal"><img src="${list.posterfile}" title="album-name" class="img-responsive"/>
									<!-- 포스터 가져다올리면 플레이서클 나오는거 -->
									<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
								</a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6><a href="movieEditF?movie_num=${list.movie_num}&searchType=n">${list.movie_title}</a></h6>							
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>${list.release}</p>
										<div class="block-stars">
											<ul class="w3l-ratings">
												<!-- movieVO에 rating 변수 추가. 매퍼 컨트롤러 수정해서 rating 받아옴 -->
												<c:forEach var="i" begin="1" end="${list.rate_avg}">
    												<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
												</c:forEach>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								
								<!-- 컨트롤러에서 new인 영화가 맞는지 확인후 값이 트루면 new마크를 달아줌 -->
								<c:if test="${newMovie=='T'}">
									<div class="ribben">
										<p>NEW</p>
									</div>
								</c:if>
								
							</div> <!-- // 영화정보카드 div -->

					</c:when>

	</c:choose>
</c:forEach>
</div>

<c:if test="${messageHome==null}">
<div class="col-md-12">

<div align="center">
<nav>			
	<ul class="pagination">	

	<c:if test="${orderID!='random'}">
	
	<c:choose>
		
		<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
			<li><a onclick="pre_${orderID}()" aria-label="Previous"><span aria-hidden="true">«</span></a></li>				
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
			<li><a onclick="cur_${orderID}(${i})" style="cursor:pointer">${i}</a></li>
		</c:if>
	</c:forEach>
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:choose>
		
		<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
			<li><a onclick="next_${orderID}()" aria-label="Next"><span aria-hidden="true">»</span></a></li>	
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>	
		</c:otherwise>
	</c:choose>	
	
	</c:if>

	</ul>
		<c:if test="${orderID=='random'}">

			<h3><a onclick="cur_${orderID}(${i})"><span class="label label-warning" style="cursor:pointer">새로고침</span></a></h3>
			<br>
		</c:if>

	</nav>
</div>
</div>
</c:if>

</body>
</html>