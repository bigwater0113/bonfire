<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여행자게시판</h2>
	<table border="1" width="500">
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.cname }</td>
			<td>${vo.id }</td>
			<td>${vo.title }</td>
			<td>${vo.postdate }</td>
			<td>${vo.postdate }</td>
			<td>${vo.hits}</td>
			<td>${vo.recommend}</td>
			<td>${vo.scrap}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>