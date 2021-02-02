<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login/join.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	label{width:100px;display:inline-block;}
</style>
<div>
	<form method="post" action="${cp }/join" id="joinForm">
		<label for="id">아이디</label><input type="text" name="id" id="id" required="required" placeholder="영문/숫자 4~8자리"><span id="idMsg"></span><br>
		<label for="pwd">비밀번호</label><input type="password" name="pwd" id="pwd" required="required" placeholder="영문/숫자 4~8자리"><span id="pwdMsg"></span><br>
		<label for="check">비밀번호확인</label><input type="password" id="check" required="required"><span id="checkMsg"></span><br>
		<label for="name">이름</label><input type="text" name="name" id="name" required="required"><br>
		<label for="email">이메일</label><input type="email" name="email" id="email" required="required"><br>
		<label for="birth">생년월일</label><input type="date" name="birth" id="birth" required="required"><br>
		<label for="gender">성별</label>
		남<input type="radio" name="gender" value="M" checked>
		여<input type="radio" name="gender" value="W"><br>
		<label for="phone">핸드폰번호</label><input type="text" name="phone" id="phone" required="required" placeholder="-없이 숫자만 적어주세요"><span id="phoneMsg"></span><br>
		<label for="address">주소</label><input type="text" name="address" id="address" required="required"><br>
		<input type="submit" value="회원가입">
	</form>
</div>
<script>
	$(function(){
		var error=false;
		$("#id").on('keyup',function(){
			var id=$("#id").val();
			for(let i=0;i<id.length;i++){
				if(!((id.charAt(i)>='a'&&id.charAt(i)<='z')||
						(id.charAt(i)>='A'&&id.charAt(i)<='Z')||
						(id.charAt(i)>='0'&&id.charAt(i)<='9'))){
					$("#idMsg").html("영문/숫자로 입력해주세요.").css("color","red");
					error=true;
					return;
				}else{
					if(!(id.length>=4 && id.length<=8)){
						$("#idMsg").html("영문/숫자 4~8자리입력해주세요.").css("color","red");
						error=true;
					}else{
						$("#idMsg").html("사용가능합니다.").css("color","blue");
						error=false;
					}
				}
			}
		});
		$("#pwd").on('keyup',function(){
			var pwd=$("#pwd").val();
			for(let i=0;i<pwd.length;i++){
				if(!((pwd.charAt(i)>='a'&&pwd.charAt(i)<='z')||
						(pwd.charAt(i)>='A'&&pwd.charAt(i)<='Z')||
						(pwd.charAt(i)>='0'&&pwd.charAt(i)<='9'))){
					$("#pwdMsg").html("영문/숫자로 입력해주세요.").css("color","red");
					error=true;
					return;
				}else{
					if(!(pwd.length>=4 && pwd.length<=8)){
						$("#pwdMsg").html("영문/숫자 4~8자리입력해주세요.").css("color","red");
						error=true;
					}else{
						$("#pwdMsg").html("사용가능합니다.").css("color","blue");
						error=false;
					}
				}
			}
		});
		$("#phone").on('keyup',function(){
			var phone=$("#phone").val();
			for(let i=0;i<phone.length;i++){
				if(!(phone.charAt(i)>='0'&&phone.charAt(i)<='9')){
					$("#phoneMsg").html("숫자만 입력해주세요.").css("color","red");
					error=true;
					return;
				}else{
					$("#phoneMsg").html("");
					error=false;
				}
			}
		});
		$("#check").on('keyup',function(){
			var pwd=$("#pwd").val();
			if(pwd==$("#check").val()){
				$("#checkMsg").html("일치합니다.").css("color","blue");
				error=false;
			}else{
				$("#checkMsg").html("다시 확인해주세요.").css("color","red");
				error=true;
			}
		});
		$("#joinForm").submit(function(){
			if($("#birth").val()==""){
				alert("생년월일을 선택해주세요.");
				return false;
			}
			if(error==true){
				alert("한번더 확인해주세요.");
				return false;
			}
		})
	});
</script>