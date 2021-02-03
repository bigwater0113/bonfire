<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h2>${id } 님의 여행게시판</h2>
	<table border="1" width="500">
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.cname }</td>
			<td>${vo.id }</td>
			<td><a href="${cp }/feedboard_detail?num="+${vo.num }>${vo.title }</a></td>
			<td>${vo.postdate }</td>
			<td>${vo.postdate }</td>
			<td>${vo.hits}</td>
			<td>${vo.recommend}</td>
			<td>${vo.scrap}</td>
		</tr>
	</c:forEach>
</table>
<input type="button" value="글쓰기">
<a>글삭제</a>
