<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- editPwd -->

<div>
<input type="hidden" id="error" value="${error }">
	<form:form method="post" action="${cp }/editPwd">
		<label for="rawPwd">기존 비밀번호</label>
		<input type="password" name="rawPwd" id="rawPwd"><br>
		<label for="pwd">변경할 비밀번호</label>
		<input type="password" name="pwd" id="pwd" required="required" placeholder="영문/숫자 4~8자리"><span id="pwdMsg"></span><br>
		<label for="check">변경할 비밀번호확인</label>
		<input type="password" id="check" required="required"><span id="checkMsg"></span><br>
		<input type="submit" value="확인">
	</form:form>
</div>
<script>
	$(function(){
		if($("#error").val()=='1'){
			alert("비밀번호를 다시 확인해 주세요");
		} 
		var error1=0;
		var error2=0;
		var error3=0;
		var error4=0;
		
		$("#pwd").on('keyup',function(){
			var pwd=$("#pwd").val();
			for(let i=0;i<pwd.length;i++){
				if(!((pwd.charAt(i)>='a'&&pwd.charAt(i)<='z')||
						(pwd.charAt(i)>='A'&&pwd.charAt(i)<='Z')||
						(pwd.charAt(i)>='0'&&pwd.charAt(i)<='9'))){
					$("#pwdMsg").html("영문/숫자로 입력해주세요.").css("color","red");
					error2++;
					return;
				}else{
					if(!(pwd.length>=4 && pwd.length<=8)){
						$("#pwdMsg").html("영문/숫자 4~8자리입력해주세요.").css("color","red");
						error2++;
					}else{
						$("#pwdMsg").html("사용가능합니다.").css("color","blue");
 						error2=0;
					}
				}
			}
		});
		
		$("#check").on('keyup',function(){
			var pwd=$("#pwd").val();
			if(pwd==$("#check").val()){
				$("#checkMsg").html("일치합니다.").css("color","blue");
				error4=0;
			}else{
				$("#checkMsg").html("다시 확인해주세요.").css("color","red");
				error4++;
			}
		});
		$("#joinForm").submit(function(){
			if($("#birth").val()==""){
				alert("생년월일을 선택해주세요.");
				return false;
			}
			if(error1!=0 ||error2!=0||error3!=0||error4!=0){
				alert("한번더 확인해주세요.");
				return false;
			}
		})
	});
	
</script>