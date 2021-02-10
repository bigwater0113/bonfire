<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- side.jsp -->
<style>
	li{list-style:none;}
</style>
<div>
	<h3>메뉴</h3>
	<ul>
		<c:if test="${feedId==id }">
			<li><a href="#">일기장</a></li>
		</c:if>
		<li><a href="#">여행글</a></li>
		<li><a href="#">스크랩</a></li>
		<li><a href="#">경로게시판</a></li>
		<c:if test="${feedId==id }">
			<li><a href="${cp }/userInfo">내정보</a></li>
		</c:if>
	</ul>
</div>