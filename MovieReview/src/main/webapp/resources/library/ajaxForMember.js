$(function(){
	
	$('#idCheck').click(function(){
	
		if(iCheck==false){
			iCheck=idCheck();
			$('#joinId').focus();	
		}else{
		
			$.ajax({
			
			type:'Get',
			url:'idCheck',
			data:{
				id:$('#joinId').val(),
				},
				
			success:function(result){
					
					if(result=='n'){
						$('#iMessage').html("이미 존재하는 아이디입니다.");
						$('#iMessage').css("color", "red");
					}else{
						$('#iMessage').html("사용할 수 있는 아이디입니다.");
						$('#iMessage').css("color", "green");
						$('#idCheck').attr("disabled", true);
					}
				},
			
			error:function(){
					
					alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				} 
			
			}); //ajax
		}//else
	}); // idCheck
	

	$('#nickNameCheck').click(function(){
	
		if(nCheck==false){
			nCheck=nickNameCheck();
			$('#nickName').focus();	
		}else{
		
			$.ajax({
			
			type:'Get',
			url:'nickNameCheck',
			data:{
				nickName:$('#nickName').val(),
				},
				
			success:function(result){
					
					if(result=='n'){
						$('#nMessage').html("이미 존재하는 닉네임입니다.");
						$('#iMessage').css("color", "red");
					}else{
						$('#nMessage').html("사용할 수 있는 닉네임입니다.");
						$('#nMessage').css("color", "green");
						$('#nickNameCheck').attr("disabled", true);
					}
				},
			
			error:function(){
					
					alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				} 
			
			}); //ajax
		}//else
	}); // idCheck
	
	  $('.deleteMember').click(function(){
		var makesure = confirm('정말로 삭제하시겠습니까?');
		if(makesure){
			//확인
			var id = $(this).attr('id');
			$.ajax({
				type: 'Get',
				url: 'mdelete',
				data:{
					id:id
				},
				success:function(resultData){
					if (resultData.success=='T') {
						alert('정상적으로 삭제되었습니다');
						$('#'+id).html('삭제완료');
						$('#'+id).css({
							color:'gray',
							fontWeight:'bold'
						});
						$('#'+id).off(); 
					}else {
						alert('Error: 삭제 실패 ');
					}
				},
				error:function(){
					alert('서버 오류 !!! 잠시후 다시 하세요.');
				}
			}); //ajax
		}else{
			//취소
			return;
		}//if_makesure
	
	  }); //deleteMember_click

	$('.mupdatef').click(function(){
		var id=$(this).attr('id');
		$.ajax({
			type:"Get",
			url:"mdetail",
			data:{ id : id, jcode : 'U' },
			success:function(resultPage){
				$('#resultArea').html(resultPage);
				},
			error:function(){
				$('#resultArea').html('페이지 불러오기 실패');
			}	
		});//ajax
	});//newpassf_click

	$('.newpassf').click(function(){
		var id=$(this).attr('id');
		$.ajax({
			type:"Get",
			url:"newpassf",
			data:{ id : id },
			success:function(resultPage){
				$('#resultArea').html(resultPage);
				},
			error:function(){
				$('#resultArea').html('페이지 불러오기 실패');
			}	
		});//ajax
	});//newpassf_click



	//textLink		
	$('.textLink').css({
		fontWeight:"bold"
	})
    $('.textLink').hover(function(){
	  	$(this).css({
			fontSize:"1.1em",
			fontWeight:"bold",
			color:"red",
			cursor:"pointer" }) //css
	}, function(){
		$(this).css({
			fontSize:"",
			fontWeight:"bold",
			color:"black",
			cursor:"default" }) //css
    }); //hover	
	
		
		
	
});//ready