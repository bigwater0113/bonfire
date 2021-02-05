<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- modify.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<div>
	<form:form method="post" action="#">
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" value="${id }" readonly><br>
		<label for="pwd">비밀번호</label>
		<input type="button" value="비밀번호 수정" onclick="location.href='${cp}/editPwd'"><br>
		<label for="name">이름</label>
		<input type="text" name="name" id="name" value="${vo.name }" readonly><br>
		<label for="email">이메일</label>
		<input type="email" name="email" id="email" value="${vo.email }" required><br>
		<label for="birth">생년월일</label>
		<input type="date" name="birth" id="birth" value="${vo.birth }" required><br>
		<label for="gender">성별</label>
		<input type="text" name="gender" value="${vo.gender }" readonly><br>
		<label for="phone">핸드폰번호</label>
		<input type="text" name="phone" id="phone" value="${vo.phone }" required="required" placeholder="-없이 숫자만 적어주세요"><br>
		<label for="zipNo">우편번호</label>
		<input type="text" name="zipno" id="zipno" readonly style="width:100px" value="${vo.zipno }" required="required">
		<input type="button" value="주소검색" onclick="goPopup();"><br>
		<label for="roadfulladdr">도로명주소</label>
		<input type="text" name="roadfulladdr" id="roadfulladdr" style="width:500px" value="${vo.roadfulladdr }" required="required"><br>
		<label for="addrdetail">상세주소</label>
		<input type="text" name="addrdetail" id="addrdetail" style="width:500px" value="${vo.addrdetail }"><br>
		<input type="submit" value="정보수정">
	</form:form>
</div>
<script>
	$(function(){
		var error1=0;
		var error2=0;
		var error3=0;
		var error4=0;
		
		
		$("#phone").on('keyup',function(){
			var phone=$("#phone").val();
			for(let i=0;i<phone.length;i++){
				if(!(phone.charAt(i)>='0'&&phone.charAt(i)<='9')){
					$("#phoneMsg").html("숫자만 입력해주세요.").css("color","red");
					error3++;
					return;
				}else{
					$("#phoneMsg").html("");
					error3=0;
				}
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
	
	
	function goPopup(){
	    var pop = window.open("${pageContext.request.contextPath}/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadAddrPart1,roadAddrPart2,zipNo){
		$("#roadfulladdr").val(roadAddrPart1+roadAddrPart2);
		$("#zipno").val(zipNo);
	}
</script>