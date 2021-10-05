<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function checkDelete() {
	var answer = confirm('위시리스트에서 삭제됩니다.진행하시겠습니까?');
	if (answer){
		alert('찜목록에서 삭제되었습니다.');
		return true;
	}
	else
		return false;

}//checkDelete

$(function() {

	$('.chkd').change(function() {	
		
	var arr_chk = document.getElementsByName('chk[]');
			
	for(var i=0; i< arr_chk.length; i++){
		if(arr_chk[i].checked!=true){
		/* 배열안에서 하나라도 체크 안된거 만나면 allCheck는 false인 상태로 조건문을 빠져나옴*/

			$('#chkAll').prop("checked",false);
			break;
			
		}else{		
			/* 여기로 오는경우는 배열이 전부 트루면  */
			
			$('#chkAll').prop("checked",true);
			}// else
		}// for
		
		
	for(var i=0; i< arr_chk.length; i++){
		if(arr_chk[i].checked==true){
		/* 배열안에서 하나라도 체크 된거 만나면 서브밋을 활성화후 조건문을 빠져나옴*/
			
			$('#submit').attr("disabled", false);
			break;
			
		}else{
		/* 배열에 있는값이 모두 false면 서므밋을 비활성화 시킴*/
			
			$('#submit').attr("disabled", true);
			}// else
		}// for

	});//.chkd_change

	$('#chkAll').change(function() {
		
		if ($('#chkAll').is(":checked"))
			$('#submit').attr("disabled", false);
		else
			$('#submit').attr("disabled", true);

	});//#chkAll_change
	
});//ready

	
	/* 이부분도 아래처럼 배열처리 하면 되는데 제가 forms로 받는거를 까먹어서 
		똑같이 바꿔놨어요*/
function check() { // 체크박스 한번에 모두 선택가능하게 만드는 소스

	var arr_chk = document.getElementsByName('chk[]');

	if ($('#chkAll').is(':checked')) { // chkAll에 체크가 되면 chk배열의 총길이만큼 모두 체크하여준다.(모두 체크)

		for (var n = 0; n < arr_chk.length; n++)
			arr_chk[n].checked = true;
	} else { // chkAll에 체크가 해제되면 chk배열의 총길이만큼 모두 해제하여준다.(모두 체크 해제)

		for (var n = 0; n < arr_chk.length; n++)
			arr_chk[n].checked = false;
	}
}//check
</script>
</head>
<body>

	<div class="bs-docs-example">
			<form action="wdelete" method="get">
			<table class="table table-striped">
					<thead>
						<tr>
							<th><input type="checkbox" name="chkAll" id="chkAll" onclick="check()"></th>
							<th>영화제목</th>
							<th>영화감독</th>
							<th>개봉일</th>
						</tr>
					</thead>
					
				<tbody>
					<c:forEach var="list" items="${Banana}">
						<tr>
						<td><input type="checkbox" name="chk[]" class="chkd" value="${list.movie_num}">&nbsp;&nbsp;</td>
						<td><a href="mvdetail?movie_num=${list.movie_num}&searchType=n">${list.movie_title}</a></td>
						<td>${list.director}</td>
						<td>${list.release}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<input type="submit" value="삭제하기" onclick="return checkDelete()" disabled id="submit">
			</form>
		</div>
</body>
</html>