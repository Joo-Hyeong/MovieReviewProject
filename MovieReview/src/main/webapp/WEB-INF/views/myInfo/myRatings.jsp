<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 한줄평</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	
	function checkDelete() {
		var answer = confirm('선택한 한줄평이 삭제됩니다.진행하시겠습니까?');
		if (answer){
			alert('한줄평이 삭제되었습니다.');
			return true;
		}else
			return false;

	}//checkDelete
	
	$(function() {
		
		$('.chkd_1').change(function() {	
			
		var arr_chk_1 = document.getElementsByName('chk_1[]');
		
		for(var i=0; i< arr_chk_1.length; i++){
			if(arr_chk_1[i].checked!=true){
			/* 배열안에서 하나라도 체크 안된거 만나면 allCheck는 false인 상태로 조건문을 빠져나옴*/

				$('#chkAll_1').prop("checked",false);
				break;
				
			}else{		
				/* 여기로 오는경우는 배열이 전부 트루면  */

				$('#chkAll_1').prop("checked",true);
				}// else
			}// for
			
			
		for(var i=0; i< arr_chk_1.length; i++){
			if(arr_chk_1[i].checked==true){
			/* 배열안에서 하나라도 체크 된거 만나면 서브밋을 활성화후 조건문을 빠져나옴*/
				

				$('#submit_1').attr("disabled", false);
				break;
				
			}else{
			/* 배열에 있는값이 모두 false면 서므밋을 비활성화 시킴*/

				$('#submit_1').attr("disabled", true);
				}// else
			}// for

		});//.chkd_change

		$('#chkAll_1').change(function() {
			
			if ($('#chkAll_1').is(":checked"))
				$('#submit_1').attr("disabled", false);
			else
				$('#submit_1').attr("disabled", true);

		});//#chkAll_change
		
	});//ready

		
		/* 이부분도 아래처럼 배열처리 하면 되는데 제가 forms로 받는거를 까먹어서 
			똑같이 바꿔놨어요*/
	function check_1() { // 체크박스 한번에 모두 선택가능하게 만드는 소스

		var arr_chk_1 = document.getElementsByName('chk_1[]');

		if ($('#chkAll_1').is(':checked')) { // chkAll에 체크가 되면 chk배열의 총길이만큼 모두 체크하여준다.(모두 체크)

			for (var n = 0; n < arr_chk_1.length; n++)
				arr_chk_1[n].checked = true;
		} else { // chkAll에 체크가 해제되면 chk배열의 총길이만큼 모두 해제하여준다.(모두 체크 해제)

			for (var n = 0; n < arr_chk_1.length; n++)
				arr_chk_1[n].checked = false;
		}
	}//check
</script>

</head>
<body>
		<div class="bs-docs-example">
			<form action="rdelete" method="get">
			<table class="table table-striped">
					<thead>
						<tr>
							<th><input type="checkbox" name="chkAll_1" id="chkAll_1" onclick="check_1()">&nbsp;&nbsp;</th>
							<th>번호</th>
							<th>영화번호</th>
							<th>평점</th>
							<th>한줄평</th>
							<th>스포일러</th>
							<th>등록일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="list" items="${ratingVoList}" varStatus="vs">
							<tr>
								<td><input type="checkbox" name="chk_1[]" class="chkd_1" value="${list.rating_num}">&nbsp;&nbsp;</td>
								<td align="center">${list.rating_num}</td>
								<td align="center">${list.movie_num}</td>
								<td>${list.rate}
						<c:choose>
							<c:when test="${list.rate==1}">⭐</c:when>
							<c:when test="${list.rate==2}">⭐⭐</c:when>
							<c:when test="${list.rate==3}">⭐⭐⭐</c:when>
							<c:when test="${list.rate==4}">⭐⭐⭐⭐</c:when>
							<c:when test="${list.rate==5}">⭐⭐⭐⭐⭐</c:when>
							<c:otherwise></c:otherwise>
						</c:choose></td>

					<td><a href="mvdetail?movie_num=${list.movie_num}&searchType=n">${list.takeaway}</a></td>
					<td align="center">${list.spoiler}</td>
					<td>${list.regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<input type="submit" value="삭제하기" onclick="return checkDelete()" id="submit_1" disabled>
			
			</form>
		</div>

</body>
</html>