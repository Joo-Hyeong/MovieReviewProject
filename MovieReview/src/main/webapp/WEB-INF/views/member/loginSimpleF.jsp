<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/library/checkJoinFrom.js"></script>

<script>

var iCheck=false;
var pCheck=false;


$(function(){
	
	$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
		}); 
		
	$('#password').focusout(function() {
		pCheck=passwordCheck();
		});

});//ready


function simpleLogin(){
	
	
	if (iCheck==false) {
		$('#iMessage').html(' 아이디를 확인하세요.');
	}
	if (pCheck==false) {
		$('#pMessage').html(' Password 를 확인하세요.');
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
						console.log('로그인성공');
						
						opener.location.reload();
						self.close();
					}else{
						$('#message').html('아이디와 비밀번호를 확인해주세요.');
						console.log(result);
						
					}
				},
				error:function(){
					console.log('서버오류입니다. 관리자에게 문의해주세요.');
				}
			});	//ajax
		}//icheck if문
		
}//Simplelogin

function simpleJoin(){
	
	opener.location.href="joinA";
	self.close();
}


function findPass(){
	   self.close();
	   var url="findPassF";
	   open(url,"_blank","toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
	   
	}
</script>
</head>
<body>
<center>
<div id="header">
<h2> 로그인 </h2>
</div>

<div id="container">
<!-- container -->
<form>
	<div>
		<label for="id">
		<p>아이디</p> 
		</label>
		<span>
			<input type="text" id="id" name="id" maxlength="10">&nbsp;
		</span>

		<br>
		<span id="iMessage" class="message"></span>
	</div>
	
	<div>
		<label for="password">
		<p>비밀번호</p> 
		</label>
		<span>
			<input type="password" id="password" name="password" maxlength="20">
		</span><br>
		<span id="pMessage" class="message"></span>
	</div>

<br>
<a id="message"></a>
<br>
<input type="button" name="SUBMIT" value="로그인" onclick="simpleLogin()">
<input type="button" value="비밀번호 찾기" onclick="findPass()">

</form>

</div>
<!-- //container -->
<div id="footer"><!-- footer -->
<br>
<button onclick="simpleJoin()">회원가입</button>
<button onclick="self.close()">닫기</button>	
</div>
</center>
</body>
</html>