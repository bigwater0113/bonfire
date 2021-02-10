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
<h1>글수정</h1>
<form:form action="${cp }/qna/update" method="post">
글번호<br>
<input type="text" name="num" value="${vo.num }" readonly="readonly"><br>
문의유형<br>
	<select name="cname">
		<option value="작가문의">작가문의</option>
		<option value="일반문의">일반문의</option>
	</select><br>
작성자<br>
<input type="text" name="id" value="${vo.id }"><br>
제목<br>
<input type="text" name="title" value="${vo.title }"><br>
내용<br>
<textarea rows="5" cols="50" name="content">${vo.content }</textarea><br>
비밀번호<br>
<input type="password" name="pwd"><br>
<input type="submit" value="등록">

</form:form>
</body>
</html>