<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
<c:set var="cp" value="${pageContext.request.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${cp }/resources/main.css">
<style>
	*{margin:0px;padding:0px;}
</style>
</head>
<body>

<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
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