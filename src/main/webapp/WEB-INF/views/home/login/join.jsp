<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login/join.jsp -->
<style>
	label{width:100px;display:inline-block;}
</style>
<div>
	<form method="post" action="${cp }/join">
		<label for="id">아이디</label><input type="text" name="id" id="id"><br>
		<label for="pwd">비밀번호</label><input type="text" name="pwd" id="pwd"><br>
		<label for="check">비밀번호확인</label><input type="text" id="check"><br>
		<label for="name">이름</label><input type="text" name="name" id="name"><br>
		<label for="email">이메일</label><input type="email" name="email" id="email"><br>
		<label for="birth">생년월일</label><input type="date" name="birth" id="birth"><br>
		
		<label for="gender">성별</label>
		남<input type="radio" name="gender" value="m">
		여<input type="radio" name="gender" value="w"><br>
		<label for="phone">핸드폰번호</label><input type="text" name="phone" id="phone"><br>
		<label for="address">주소</label><input type="text" name="address" id="address"><br>
		<input type="submit" value="회원가입">
	</form>
</div>