function idCheck(){
	var id=$('#joinId').val();
	
//아이디 조건: 5~10글자, 영문 숫자


		if(id==null){
			$('#iMessage').html('아이디를 입력해주세요.');
			$('#iMessage').css("color", "red");
		}else if (id.length<5||id.length>10) {
			$('#iMessage').html('아이디는 5~10자 이내 입니다.');
			$('#iMessage').css("color", "red");
			return false;
		}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
			$('#iMessage').html('아이디는 영문, 숫자로 입력해주세요.');
			$('#iMessage').css("color", "red");
			return false;
		}else {
			$('#iMessage').html('');
			return true;
		}
}// idCheck


function findIdCheck(){
	var id=$('#findId').val();
	
//아이디 조건: 5~10글자, 영문 숫자


		if(id==null){
			$('#iMessage').html('아이디를 입력해주세요.');
		}else if (id.length<5||id.length>10) {
			$('#iMessage').html('아이디는 5~10자 이내 입니다.');
			return false;
		}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
			$('#iMessage').html('아이디는 영문, 숫자로 입력해주세요.');
			return false;
		}else {
			$('#iMessage').html('');
			return true;
		}
}// idCheck







function passwordCheck(){
	var password=$('#joinPassword').val();
			
//패스워드 조건: 8~20자, 영문 숫자 특수문자 조합 
			if (password.length<8||password.length>20) {
				$('#pMessage').html('비밀번호는 8~20자 이내 입니다. ');
				return false;
			}else if (password.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi,'').length == password.length
			||password.replace(/[a-z]/gi,'').length == password.length
			||password.replace(/[0-9]/gi,'').length == password.length) {
				$('#pMessage').html('비밀번호는 반드시 영문, 숫자, 특수문자를 조합해주세요.');
				return false;
			}else {
				$('#pMessage').html('');
				return true;
			}
}//passCheck


function password2Check(){
	var password=$('#password').val();
	var password2=$('#password2').val();
	if (password != password2) {
		$('#p2Message').html('~~ password 가  다릅니다. 확인하세요  ~~');
		//$('#password').focus();
		$('#p2OK').html('');
		return false;
	}else {
		
		$('#p2Message').html('');
		$('#p2OK').html('OK').css({fontWeight:"bold",color:"green"});
		return true;
	}
}

function emailCheck(){
	var email=$('#email').val() ;
			
//이메일 조건: 

		if (email.length==0) {
			$('#eMessage').html('이메일을 입력해주세요.');
			return false;
		}else {
			$('#eMessage').html('');
			return true;
		}	
}//emailCheck

function nickNameCheck(){
	var	nickName=$('#nickName').val();
//닉네임 조건: 2~10글자
	
		if(nickName.length<2||nickName.length>10){
			$('#nMessage').html('닉네임은 2~10자 이내 입니다.');
			$('#iMessage').css("color", "red");
			return false;
		}else{
			$('#nMessage').html('');
			return true;
		}
}//nickNameCheck
