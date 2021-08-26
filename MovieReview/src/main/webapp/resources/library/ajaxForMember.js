$(function(){
	
	$('#idCheck').click(function(){
	
		if(iCheck==false){
			iCheck=idCheck();
			$('#id').focus();	
		}else{
		
			$.ajax({
			
			type:'Get',
			url:'idCheck',
			data:{
				id:$('#id').val(),
				},
				
			success:function(result){
					
					if(result=='n'){
						$('#iMessage').html("이미 존재하는 아이디입니다.");
					}else{
						$('#iMessage').html("사용할 수 있는 아이디입니다.");
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
					}else{
						$('#nMessage').html("사용할 수 있는 닉네임입니다.");
						$('#nickNameCheck').attr("disabled", true);
					}
				},
			
			error:function(){
					
					alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				} 
			
			}); //ajax
		}//else
	}); // idCheck
	
	
});//ready