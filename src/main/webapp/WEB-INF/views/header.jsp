<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <!-- header.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	#header_logo{width:300px;height:100px;float:left;background-color: #aaaaaa;}
	#header_menu{width:100px;height:100px;float:right;background-color: #aaaaaa;}
	#header_login{width:100px;height:100px;float:right;background-color: #bbbbbb;}
	#header_slideMenu{width:1200px;height:100px;background-color: lightblue;clear:both;
	position:absolute;z-index:998;top:100px; display:none;}
	#header_menulist{list-style:none; }
	#header_menulist li{display:inline-block; width:200px; }
	#profile_slide{width:200px;background-color: lightgreen;clear:both;
	position:absolute;z-index:999;top:100px; display:none;}
	
</style>
<div>
	<div id="header_logo" onclick="location.href='${cp}/'">
		<img src="${cp }/resources/images/bonfire_logo.png" style="width:140px;height:100px;">
		<span style="font-size:50px;position:relative;top:-30px;">모닥불</span>
	</div>
	<div id="header_menu"><img src="${cp }/resources/images/menuIcon.png" style="width:100px;height:100px;" id="menuBtn"></div>
	<div id="header_login">
	<sec:authorize access="isAnonymous()">
		<img src="${cp }/resources/images/loginIcon.png" onclick="location.href='${cp }/login'" style="width:100px;height:100px;">
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<img src="${cp }/resources/images/profileIcon.png" id="profileImg" style="width:100px;height:100px;">
		<div id="profile_slide">
			[<sec:authentication property="principal.username"/>]님 <br>
			<a href="${cp }/logout">로그아웃</a><br>
			<a href="${cp }/@${id}">마이페이지</a><br>
			<a href="#">일기장</a><br>
			<a href="#">여행기록</a><br>
			<a href="${cp }/userInfo">회원정보</a><br>
			<a href="${cp }/userModify">정보수정</a><br>
			<a href="${cp }/withdraw">회원탈퇴</a><br>
		</div>
	</sec:authorize>
	</div>
	<div id="header_slideMenu">
		<ul id="header_menulist">
			<li><a href="${cp }/feedboard_main_selectAll">여행게시판</a></li>
			<li><a href="${cp }/board/all/list/">자유게시판</a></li>
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
		$("#profileImg").click(function(){
			$("#profile_slide").slideToggle(500);
		});
	});
</script>