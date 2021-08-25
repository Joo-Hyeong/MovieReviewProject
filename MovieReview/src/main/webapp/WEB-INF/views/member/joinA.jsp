<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

var rule1 = false;
var rule2 = false;
var rule3 = false;

function checkRule(){
	
	rule1 = document.getElementById('rule1').checked;
	rule2 = document.getElementById('rule2').checked;	
	rule3 = document.getElementById('rule3').checked;	
	

	if(rule1 && rule2 && rule3){
		return true;
	}else{
		alert('약관을 확인해주세요.');
		return false;
	}
}


</script>
</head>
<body>


<div id="header">
<!--header  -->

</div>
<!-- //header -->


<div id="container">
<!-- container  -->	


	<div id="join_content">
	<!-- content -->
	
	
	<form>
	<textarea rows="10" cols="20">동해물과백두산이마르고닳도록</textarea><br>
	<label for="rule1">
		<span class="rule_agree">이 약관에 동의하시겠습니까?
	</label>
	<input type="checkbox" id="rule1" class="rule"></span><br>
		
	<textarea rows="10" cols="20">하느님이보우하사우리나라만세</textarea><br>
	<label for="rule2">
		<span class="rule_agree">이 약관에 동의하시겠습니까?
	</label>
	<input type="checkbox" id="rule2" class="rule"></span><br>
	
	<textarea rows="10" cols="20">동해물과백두산이마르고닳도록</textarea><br>
	
	<label for="rule3">
		<span class="rule_agree">이 약관에 동의하시겠습니까?
	</label>
	<input type="checkbox" id="rule3" class="rule"></span><br>
	
	<span>
		<span>
			<a href="joinF" onclick="return checkRule();">확인</a>&nbsp;
		</span>
		<span>
			<a href="home">취소</a>
		</span>
	</span>
	</form>
	
	
	</div>
	<!-- //content  -->
</div>
<!-- //container -->
<div id="footer"></div>
</body>
</html>