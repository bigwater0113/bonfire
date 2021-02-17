<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout2.jsp</title>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${cp }/resources/feed.css">
<style>
	*{margin:0px;padding:0px;}
	#banner img{width:100%;height:100%}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="banner">
		<c:choose>
			<c:when test="${proVo.bfilename!=null }">
				<img src="${cp }/resources/upload/banner/${proVo.bfilename}">
			</c:when>
			<c:otherwise>
				<img src="${cp }/resources/images/banner_basic.jfif">
			</c:otherwise>			
		</c:choose>
		
	</div>
	<div id="side">
		<tiles:insertAttribute name="side"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>