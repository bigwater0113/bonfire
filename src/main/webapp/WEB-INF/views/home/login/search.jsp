<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- search.jsp -->
<style>
	label{width:100px;display:inline-block;}
	#search_left{width:600px;float:left;}
	#search_right{width:600px;float:right;}
</style>
<div>
	<div id="search_left">
		<form method="post" action="searchId">
			<label for="name">이름</label><input type="text" name="name" id="name"><br>
			<label for="email">이메일</label><input type="email" name="email" id="email"><br>
			<input type="submit" value="찾기">
		</form>
	</div>
	<div id="search_right">
		<form method="post" action="searchPwd">
			<label for="id">아이디</label><input type="text" name="id" id="id"><br>
			<label for="name">이름</label><input type="text" name="name" id="name"><br>
			<label for="email">이메일</label><input type="email" name="email" id="email"><br>
			<input type="submit" value="찾기">
		</form>
	</div>
</div>