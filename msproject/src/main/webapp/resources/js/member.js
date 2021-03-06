$(document).ready(function() {
	var nameReg = RegExp(/^[가-힣]{2,4}$/);
	var phoneReg = RegExp(/^[0-9]{8,11}$/);
	var mailReg = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	var idReg = RegExp(/^[A-Za-z]{1}[A-Za-z0-9]{5,19}$/);
	var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var nameBool = false;
	var phoneBool = false;
	var mailBool = false;
	var idBool = false;
	var pwBool = false;
	var pwreBool = false;
	var pagecount = 1;
	var mailToggle = false;
	$('#dot1').css('opacity', '1');
	$('#nextbtn_01').click(function(event) {
		$('#slide').animate({left: '-=576px'});
		$('#dot1').css('opacity', '0');
		$('#dot2').css('opacity', '1');
		$('#join_page02').css('display', 'block');
		pagecount = 2;
	});
	$('#nextbtn_02').click(function(event) {
		$('#slide').animate({left: '-=576px'});
		$('#dot2').css('opacity', '0');
		$('#dot3').css('opacity', '1');
		$('#join_page03').css('display', 'block');
		pagecount = 3;
		$('#info_modal').css('z-index', '100');
		setTimeout($('#info_modal').css('opacity', '1'), 500);
	});
	$('#prevbtn_01').click(function(event) {
		$('#slide').animate({left: '+=576px'});
		$('#dot1').css('opacity', '1');
		$('#dot2').css('opacity', '0');
		pagecount = 1;
	});
	$('#prevbtn_02').click(function(event) {
		$('#slide').animate({left: '+=576px'});
		$('#dot2').css('opacity', '1');
		$('#dot3').css('opacity', '0');
		pagecount = 2;
	});
	$('#toggleMail').click(function(event) {
		if(!mailToggle){
			$('#toggleText').text('메일주소');
			$('#toggleMail').text('휴대전화로 가입하기');
			phoneBool = false;
			phoneReg = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			$('#uphone').attr('maxlength', '30').val('');
			valReg($('#uphone'), phoneReg);
			mailToggle = true;
			$('#nextbtn_01').css('opacity', '0');
			$('#nextbtn_01').css('display', 'none');
		}else{
			$('#toggleText').text('휴대전화');
			$('#toggleMail').text('이메일로 가입하기');
			phoneBool = false;
			phoneReg = RegExp(/^[0-9]{8,11}$/);
			$('#uphone').attr('maxlength', '11').val('');
			valReg($('#uphone'), phoneReg);
			mailToggle = false;
			$('#nextbtn_01').css('opacity', '0');
			$('#nextbtn_01').css('display', 'none');
		}
	});
	$('#uname').focus(function(event) {
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			valReg($(this),nameReg);
			if(nameReg.test($(this).val())){
				nameBool = true;
			}else{
				nameBool = false;
			}
		});
	});
	$('#uname').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});
	$('#uphone').focus(function(event) {
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			valReg($(this),phoneReg);
		});
	});

	$('#uphone').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});
	
	$('#uemail').focus(function(event){
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			valReg($(this),mailReg);
		});
	});

	$('#uemail').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});
	
/*	$('#join_page01').keyup(function(event) {
		if(nameBool&&phoneBool){
			$('#nextbtn_01').css('display', 'block');
			setTimeout(function(){
				$('#nextbtn_01').css('opacity', '1');
			}, 100);
		}else{
			$('#nextbtn_01').css('opacity', '0');
			$('#nextbtn_01').css('display', 'none');
		}
	});*/


	$('#uid').focus(function(event) {
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			IdReg($(this),idReg);
		});
	});
	$('#uid').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});
	$('#upw').focus(function(event) {
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			valReg($(this),pwReg);
			if(!pwReg.test($(this).val())){
				pwBool = false;
				$('#pwMsg').css('opacity', '1');
			}else if($('#upw').val()!=$('#upwre').val()&&$('#upwre').val()!=''){
				$('#pwreMsg').css('opacity', '1');
				$('#upwre').parent().next().css('background-color', 'tomato');
				pwBool = false;
			}else if($('#upw').val()==$('#upwre').val()&&$('#upwre').val()!=''){
				$('#upwre').parent().next().css('background-color', 'green');
				$('#pwreMsg').css('opacity', '0');
				$('#pwMsg').css('opacity', '0');
				pwBool = true;
			}else{
				$('#pwMsg').css('opacity', '0');
			}
		});
	});
	$('#upw').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});
	$('#upwre').focus(function(event) {
		$(this).parent().next().css('left', '0px');
		$(this).keyup(function(event) {
			if($(this).val()==''){
				$(this).parent().next().css('background-color', '#4374D9');
				pwBool = false;
			}else if(!pwReg.test($(this).val())||$('#upwre').val()!=$('#upw').val()){
				$(this).parent().next().css('background-color', 'tomato');
				$('#pwreMsg').css('opacity', '1');
				pwBool = false;
			}else if(pwReg.test($(this).val())&& $(this).val()==$('#upw').val()){
				$(this).parent().next().css('background-color', 'green');
				$('#pwreMsg').css('opacity', '0');
				pwBool = true;
			}
		});
	});
	$('#upwre').blur(function(event) {
		if($(this).val()==''){
			$(this).parent().next().css('left', '-460px');
		}
	});

/*	$('#join_page02').keyup(function(event) {
		if(idBool&&pwBool){
			$('#nextbtn_02').css('display', 'block');
			setTimeout(function(){
				$('#nextbtn_02').css('opacity', '1');
			}, 100);
		}else{
			$('#nextbtn_02').css('opacity', '0');
			$('#nextbtn_02').css('display', 'none');
		}
	});*/
	
	$('#info_close').click(function(event) {
		$('#info_modal').css({
			'opacity': '0'
		});
		setTimeout(function(){
			$('#info_modal').css('display', 'none');
		}, 500);
	});

	$(".submit_btn").click(function(event){
		console.log(
		nameBool,
		phoneBool,
		mailBool,
		idBool,
		pwBool,
		pwreBool
		);
		//$("#joinform").submit();
	});
	function valReg(typeVal, regVal){
		if(typeVal.val()==''){
			typeVal.parent().next().css('background-color', '#4374D9');
		}else if(!regVal.test(typeVal.val())){
			typeVal.parent().next().css('background-color', 'tomato');
		}else if(regVal.test(typeVal.val())){
			typeVal.parent().next().css('background-color', 'green');
		}
	}
	function IdReg(typeVal, regVal){
		idBool = false;
		$.ajax({
			type: "post",
			url: "idcheck",
			data: "id="+typeVal.val(),
			dataType: "json",
			success: function(data){
				if(data == "1"){
					typeVal.parent().next().css('background-color', 'tomato');
					$('#idMsg').css('opacity', '1');
					$('#idMsg > div').css('width','95px')
					$('#idMsg > div > div').text('중복되는 아이디');
				}else if(typeVal.val()==''){
					typeVal.parent().next().css('background-color', '#4374D9');
					$('#idMsg').css('opacity', '0');
				}else if(!regVal.test(typeVal.val())){
					typeVal.parent().next().css('background-color', 'tomato');
					$('#idMsg').css('opacity', '1');
					$('#idMsg > div').css('width','230px')
					$('#idMsg > div > div').text('20자 미만의 영문과 숫자 조합으로 지어주세요');
				}else if(regVal.test(typeVal.val())){
					typeVal.parent().next().css('background-color', 'green');
					$('#idMsg').css('opacity', '0');
					idBool = true;
				}
			},
			error: function(){
				alert("System error");
			}
		});
	}
});
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);