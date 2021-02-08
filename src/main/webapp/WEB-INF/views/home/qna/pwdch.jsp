<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form action="${cp }/qna/delete" method="post">
	글번호 <br>
	<input type="text" name="num" value="${num }"><br>
	비밀번호 <br>
	<input type="password" name="pwd">
	<input type="submit" value="삭제">
</form:form>
</body>
</html>