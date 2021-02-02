<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->
<div>
	<form method="post" action="login">
		아이디<input type="text" name="id" required><br>
		비밀번호<input type="password" name="pwd" required><br>
		<input type="submit" value="로그인"><br>
		<a href="${cp }/join">회원가입</a><br>
		<a href="#">id/pwd 찾기</a>
	</form>
</div>