<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login/join.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	label{width:100px;display:inline-block;}
</style>
<div>
	<form method="post" action="${cp }/join">
		<label for="id">아이디</label><input type="text" name="id" id="id" placeholder="영문/숫자 4~8자리"><span id="idMsg"></span><br>
		<label for="pwd">비밀번호</label><input type="password" name="pwd" id="pwd" placeholder="영문/숫자 4~8자리"><span id="pwdMsg"></span><br>
		<label for="check">비밀번호확인</label><input type="password" id="check"><span id="checkMsg"></span><br>
		<label for="name">이름</label><input type="text" name="name" id="name"><br>
		<label for="email">이메일</label><input type="email" name="email" id="email"><br>
		<label for="birth">생년월일</label><input type="date" name="birth" id="birth"><br>
		<label for="gender">성별</label>
		남<input type="radio" name="gender" value="M" checked>
		여<input type="radio" name="gender" value="W"><br>
		<label for="phone">핸드폰번호</label><input type="text" name="phone" id="phone" placeholder="-없이 숫자만 적어주세요"><br>
		<label for="address">주소</label><input type="text" name="address" id="address"><br>
		<input type="submit" value="회원가입">
	</form>
</div>
<script>
	$(function(){
		
		$("#id").on('keyup',function(){
			var id=$("#id").val();
			for(let i=0;i<id.length;i++){
				if(!((id.charAt(i)>='a'&&id.charAt(i)<='z')||
						(id.charAt(i)>='A'&&id.charAt(i)<='Z')||
						(id.charAt(i)>='0'&&id.charAt(i)<='9'))){
					$("#idMsg").html("영문/숫자로 입력해주세요.").css("color","red");
					return;
				}else{
					if(!(id.length>=4 && id.length<=8)){
						$("#idMsg").html("영문/숫자 4~8자리입력해주세요.").css("color","red");
					}else{
						$("#idMsg").html("사용가능합니다.").css("color","blue");
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
					return;
				}else{
					if(!(pwd.length>=4 && pwd.length<=8)){
						$("#pwdMsg").html("영문/숫자 4~8자리입력해주세요.").css("color","red");
					}else{
						$("#pwdMsg").html("사용가능합니다.").css("color","blue");
					}
				}
			}
		});
		$("#check").on('keyup',function(){
			var pwd=$("#pwd").val();
			if(pwd==$("#check").val()){
				$("#checkMsg").html("일치합니다.").css("color","blue");
			}else{
				$("#checkMsg").html("다시 확인해주세요.").css("color","red");
			}
		});
	});
</script>