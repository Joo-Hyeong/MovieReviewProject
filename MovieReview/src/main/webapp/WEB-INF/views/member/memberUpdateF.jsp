<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

 function update(){
	 
	 var params = $("#updateF").serialize();
	 
 	 $.ajax({
				type: 'POST',
				url:'memberUpdate',
				data: params,
				success:function(e){
					
					if(e.success=='T'){
						alert('수정이 정상적으로 처리되었습니다.');
						location.reload();
						
					}else{
						alert('수정이 처리되지 않았습니다. 오류');
					}
					
				},
				error:function(){
					alert('서버 오류. 관리자에게 문의해주세요.');
				}

	 }); // ajax 
 } // update


</script>
</head>
<body>


	<div id="update_content">
	<!-- content -->
	

	<form id="updateF" name="updateF">
	
	<div>
		<label for="id">
		<p>아이디</p> 
		</label>
		<span>
			<input type="text" name="id" id="id" maxlength="10" readonly="readonly" value="${member.id}">&nbsp;
		</span>
		
	</div><br>
	

	<div>
		<label for="email">
		<p>이메일</p> 
		</label>
		<span>
			<input type="text" id="email" name="email" maxlength="15" readonly="readonly" value="${member.email}">
		</span>
	</div><br>
	
	<div>
		<label for="nickName">
		<p>닉네임</p> 
		</label>
		<span>
			<input type="text" id="nickName" name="nickName" maxlength="10" value="${member.nickName}">&nbsp;
		</span>
	</div><br>
	
	<div>
		<label for="grade">
		<p>등급</p> 
		</label>
			<select id="grade" name="grade">
			<c:choose>
				<c:when test="${member.grade=='a'}">		
					<option value="b">회원</option>
					<option value="a" selected="selected">준회원</option>
				</c:when>
			
				<c:when test="${member.grade=='b'}">
					<option value="b" selected="selected">회원</option>
					<option value="a" >준회원</option>
				</c:when>
				
			</c:choose>
			</select>
	</div><br>
	
	<div>
		<label for="rid">
		<p>추천인</p> 
		</label>
		<span>
			<input type="text" id="rid" name="rid" maxlength="10" placeholder="(선택사항)" value="${member.rid}">
		</span>
	</div><br>
	
	<div>
		<span>
			<input type="button" onclick="update()" value="수정">&nbsp;
		</span>
		<span>
			<input type="reset" value="초기화">
		</span>
	</div>
	</form>
	
	
	</div>
	<!-- //content  -->

</body>
</html>