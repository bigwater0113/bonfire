<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- login.jsp -->
<div>
	<form:form method="post" action="login">
		아이디<input type="text" name="username" value="${id }" required><br>
		비밀번호<input type="password" name="password" required><br>
		<input type="submit" value="로그인"><br>
		<a href="${cp }/join">회원가입</a><br>
		<a href="${cp }/searchId">id/pwd 찾기</a>
	</form:form>
</div>