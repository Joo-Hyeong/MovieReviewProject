<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>영화리뷰 홈</title>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

$(function(){
	stickyFooter();

	$(window).scroll(stickyFooter).resize(stickyFooter);
});


function stickyFooter(){
	document_height = $(document).height(); // 문서 전체 높이
	document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
	window_height = $(window).height(); // 창 높이
	footer_height = $("footer").height();

	gap = document_height - footer_height - window_height; 
	bottom = document_scrollTop - gap ; 

	if(document_scrollTop > gap){
		$("#footer").css("bottom", bottom+"px");
	}else{
		$("#footer").css("bottom","0");
	}
}

</script>
<style>
	* {
 		margin: 0;
		 padding: 0;
	}
	
	#footer{
			position: fixed;
			z-index: 10; 
			background-color: gray;
			height: 50px;
			width: 100%;
		}
		
	#content1 {
		background-color: #00ff00;
		height: 300px;
	}
	
	#content2 {
		background-color: #ffff00;
		height: 300px;
	}
	
	#content3 {
		background-color: #0000ff;
		height: 300px;
	}
	
	.footmenu{
		width: 25%;
		float: left;
		height:50px;
		text-align:center;
		line-height:50px;

	}
	
</style>
</head>
<body>
<div id="header">
<!-- header -->
<h2>영화리뷰 상단</h2>
</div><!-- //header -->

<div id="container">
<!-- container -->




<div id="content1" class="content"><a href="mvlist">영화목록</a></div>
<div id="content2" class="content">content2</div>
<div id="content3" class="content">content3</div>


</div><!-- //container -->

<div id="footer"><!-- footer -->
	<div id="menu1" class="footmenu"><a href="joinA">회원가입</a></div>
	<div id="menu2" class="footmenu"><a href="loginF">로그인</a></div>
	<div id="menu3" class="footmenu"><a href="qalist">고객센터</a></div>
	<div id="menu4" class="footmenu"><a href="#">광고</a></div>
</div><!-- //footer -->

</body>
</html>
