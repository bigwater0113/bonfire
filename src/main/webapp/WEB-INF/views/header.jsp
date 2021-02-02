<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- header.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	#header_logo{width:300px;height:100px;float:left;background-color: #aaaaaa;}
	#header_menu{width:100px;height:100px;float:right;background-color: #aaaaaa;}
	#header_login{width:100px;height:100px;float:right;background-color: #bbbbbb;}
	#header_slideMenu{width:1200px;height:200px;background-color: lightblue;clear:both;
	position:absolute;z-index:999;top:200px; display:none;}
	#header_menulist{list-style:none; }
	#header_menulist li{display:inline-block; width:200px; }
	
</style>
<div>
	<div id="header_logo">모닥불</div>
	<div id="header_menu"><button id="menuBtn">메뉴</button></div>
	<div id="header_login">
	<c:choose>
		<c:when test="${empty id }">
			<a href="${cp }/login">로그인</a>
		</c:when>
		<c:otherwise>
			${id }님 환영합니다<br>
			<a href="${cp }/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="header_slideMenu">
		<ul id="header_menulist">
			<li><a href="${cp }/feedboard_main_selectAll">여행게시판</a></li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="${cp }/qna/main">문의게시판</a></li>
			<li><a href="#">경로게시판</a></li>
		</ul>
	</div>
</div>
<script>
	$(function(){
		$("#menuBtn").click(function(){
			$("#header_slideMenu").slideToggle(500);
		});
	});
</script>