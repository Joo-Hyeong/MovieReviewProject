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
	var f = document.forms[0];

	if (f.chkAll.checked) { // chkAll에 체크가 되면 chk배열의 총길이만큼 모두 체크하여준다.(모두 체크)

		for (var n = 0; n < arr_chk.length; n++)
			arr_chk[n].checked = true;
	} else { // chkAll에 체크가 해제되면 chk배열의 총길이만큼 모두 해제하여준다.(모두 체크 해제)

		for (var n = 0; n < arr_chk.length; n++)
			arr_chk[n].checked = false;
	}
}//check