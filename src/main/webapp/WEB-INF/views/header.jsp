<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- header.jsp -->
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	#header_logo{width:300px;height:100px;float:left;background-color: #aaaaaa;}
	#header_menu{width:100px;height:100px;float:right;background-color: #aaaaaa;}
	#header_login{width:100px;height:100px;float:right;background-color: #bbbbbb;}
	#header_slideMenu{width:1200px;height:200px;background-color: lightblue;clear:both;
	position:absolute;z-index:999;top:200px;}
	
</style>
<div>
	<div id="header_logo">모닥불</div>
	<div id="header_menu"><button id="menuBtn">메뉴</button></div>
	<div id="header_login"><a href="#">로그인</a></div>
	<div id="header_slideMenu">ㅎㅇㅎㅇ</div>
</div>
<script>
	$(function(){
		$("#menuBtn").click(function(){
			$("#header_slideMenu").slideToggle(1000);
		});
	});
</script>