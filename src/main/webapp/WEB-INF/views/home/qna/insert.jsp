<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글등록</h1>
<form action="${cp }/qna/insert" method="post">
	문의유형
	<select name="cname">
		<option value="작가문의">작가문의</option>
		<option value="일반문의">일반문의</option>
	</select><br>
	작성자<br>
	<input type="text" name="id"><br>
	제목<br>
	<input type="text" name="title"><br>
	내용<br>
	<textarea rows="10" cols="50" name="content"></textarea><br>
	비밀번호<br>
	<input type="password" name="pwd"><br>
	첨부파일<br>
	<input type="file"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>