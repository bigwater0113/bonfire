<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- editProfile.jsp -->
<div>
	<form:form method="post" action="${cp }/editProfile" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${vo.id }">
		닉네임<input type="text" name="nickname" value="${vo.nickname }"><br>
		소개<input type="text" name="intro" value="${vo.intro }" placeholder="50자 이내"><br>
		배너사진<input type="file" name="bfile"><br>
		프로필사진<input type="file" name="pfile"><br>
		<input type="submit" value="수정">
	</form:form>
</div>