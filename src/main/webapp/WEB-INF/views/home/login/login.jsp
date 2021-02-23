<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- login.jsp -->
<style>
	label{display:inline-block;}
</style>
<div style="width:1200px;height:600px;">
	<div style="width:400px;height:400px;margin:auto;">
		<form:form method="post" action="login">
			<label for="id" style="width:70px;">아이디</label><input type="text" name="username" value="${id }" id="id" required><br>
			<label for="pwd" style="width:70px;">비밀번호</label><input type="password" name="password" id="pwd"required><br>
			<input type="submit" value="로그인"><br>
			<a href="${cp }/join">회원가입</a><br>
			<a href="${cp }/searchIdPwd">id/pwd 찾기</a>
		</form:form>
	</div>
</div>