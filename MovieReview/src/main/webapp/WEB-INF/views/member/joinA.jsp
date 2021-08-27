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
}// checkRule

$(function(){
	
	$('#rule4').change(function(){
		
		if($('#rule4').is(":checked")){
			
			$('#rule1').prop('checked',true);
			$('#rule2').prop('checked',true);
			$('#rule3').prop('checked',true);
			
        }else{
        	$('#rule1').prop('checked',false);
			$('#rule2').prop('checked',false);
			$('#rule3').prop('checked',false);
        }
	});// rule4 change
	
	
	$('.rule').change(function(){
		
		if($('#rule1').is(":checked") && $('#rule2').is(":checked") && $('#rule3').is(":checked")){
			
				$('#rule4').prop('checked',true);
				
        }else{
        	
        		$('#rule4').prop('checked',false);
        	}
		
		});// .rule change
		
	
}); //ready

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
	
	<span class="rule_agree">
		<label for="rule1">
			이 약관에 동의하시겠습니까?
		</label>
		<input type="checkbox" id="rule1" class="rule">
	</span><br>
	
	<textarea rows="10" cols="20">하느님이보우하사우리나라만세</textarea><br>
	
	<span class="rule_agree">
		<label for="rule2">
			이 약관에 동의하시겠습니까?
		</label>
		<input type="checkbox" id="rule2" class="rule">
	</span><br>
	
	<textarea rows="10" cols="20">동해물과백두산이마르고닳도록</textarea><br>
	
	<span class="rule_agree">
		<label for="rule3">
			이 약관에 동의하시겠습니까?
		</label>
		<input type="checkbox" id="rule3" class="rule">
	</span><br><br>
	
	<span class="rule_agree">
		<label for="rule4">
			모든 약관에 동의합니다.
		</label>
		<input type="checkbox" id="rule4">
	</span>
	
	<div>
		<span>
			<a href="joinF" onclick="return checkRule();">확인</a>&nbsp;
		</span>
		<span>
			<a href="home">취소</a>
		</span>
	</div>
	</form>
	
	
	</div>
	<!-- //content  -->
</div>
<!-- //container -->
<div id="footer"></div>
</body>
</html>