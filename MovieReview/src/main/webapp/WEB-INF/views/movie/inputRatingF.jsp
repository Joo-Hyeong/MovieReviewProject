<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평 등록 폼</title>

<style>
		
#form1 fieldset{
  	display: inline-block;	/* 하위 별점 이미지들이 있는 영역만 자리를 차지함. direction 테그를 적용해야함으로 중요.*/
    border: 0; /* 필드셋 테두리 제거 */
    direction: rtl; /* 이모지 순서 반전 - 그이유는 선택자'~'가 해당부분부터 맨 끝까지 선택해주는거라 순서를 바꿔줘야함*/
}
.rating{
    display: none; /* 라디오박스 감춤 */
}
.ratingLabel{
    font-size: 2.5em; /* 이모지 크기 */
    color: transparent; /* 이모지의 색을 투명하게*/
    text-shadow: 0 0 0 #f0f0f0;} /* 이모지부분에 색을줌 text-shadow: (x축) (y축) (확산효과) (색) */

.ratingLabel:hover{
    text-shadow: 0 0 0 #FFD700; /* 마우스 호버 */
}
.ratingLabel:hover ~ label{
    text-shadow: 0 0 0 #FFD700; /* 마우스 호버부분부터 맨뒤의 라벨 요소까지 색을 바꿔줌 */
}

#form1 fieldset legend{
    text-align: left; /* 인라인 속성 방향을 반대로 해줘서 기본적으로 오른쪽으로 나옴. 따라서 위치를 따로 지정해줘야함 */
}
.rating:checked ~ label{
    text-shadow: 0 0 0 #FFD700; /* 마우스 클릭 체크 */
}		

</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
$('.rating').click(function(){
	var rating = $('input[name="rate"]:checked').val();
	$('#ratingValue').html(rating+'점');
	
});// rating.click

});//ready

function submitForm1(){
	 
	 var params = $("#form1").serialize();
	 
	 $.ajax({
				type: 'POST',
				url:'addRating',
				data: params,
				success:function(e){
					
					if(e.success=='T'){
						alert('한줄평이 정상적으로 등록되었습니다.');
						window.opener.location.reload();
						window.close();	
					}else{
						alert('오류. 관리자에게 문의해주세요.');
					}
					
				},
				error:function(){
					alert('서버 오류. 관리자에게 문의해주세요.');
				}

	 }); // ajax 
	 
	 
} // submitForm1


</script>

</head>
<body>

<div id="ratingF">
<form method="post" action="addRating" id="form1">    
		<h4>&nbsp;&nbsp;&nbsp;한줄평 등록</h4>
		<input type="text" id="takeaway" name="takeaway" placeholder="리뷰를 남겨주세요." size="30">
	
  
	<hr>
	<fieldset> <!-- 폼 테그내에서 관련된 양식을 묶을수 있음. 사용안하려면 disabled  -->
        <legend><h4>평점</h4></legend> <!-- 해당 필드셋 제목 -->
        <input type="radio" class="rating" name="rate" value="5" id="rate1"><label for="rate1" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="4" id="rate2"><label for="rate2" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="3" id="rate3"><label for="rate3" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="2" id="rate4"><label for="rate4" class="ratingLabel">⭐</label>
        <input type="radio" class="rating" name="rate" value="1" id="rate5" checked="checked"><label for="rate5" class="ratingLabel">⭐</label>
    </fieldset>  
    <span id="ratingValue">1점</span>
	<hr>
    <h4>&nbsp;&nbsp;&nbsp;스포일러 여부</h4>
	<input type="radio" id="spoilerY" name="spoiler" value="Y"><label for="spoilerY">Y</label>
	<input type="radio" id="spoilerN" name="spoiler" value="N" checked="checked"><label for="spoilerN">N</label>
	<hr>
	<input type="hidden" id="movie_num" name="movie_num" value='${Movie.movie_num}'>
	<input type="hidden" id="id" name="id" value="${loginID}">
	<input type="button" onclick="submitForm1()" value="한줄평 등록하기">

</form>
</div> <!-- RatingF -->



</body>
</html>