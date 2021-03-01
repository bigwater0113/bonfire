<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.btn.btn-white.w-100{display:inline-block;font-size:25px;font-weight:bold;}
	.btn.btn-white.w-100.delete{width:7%!important; margin-bottom: 6px;}
	.btn.btn-white.w-100.update{width:7%!important; margin-bottom: 6px;}
	.btn.btn-white.w-100.listAll{width: 10%!important; margin-bottom: 6px;}

</style>
<h1><b>일기 수정</b></h1>

<table border = "1" width = "800" class="table table-vcenter table-mobile-md card-table">
	<tr>
		<th>제목</th>
		<td>${vo.title }</td>
	</tr>
	<tr>
		<th>날짜</th>
		<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${vo.adddate }"/></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td>${vo.content }</td>
	</tr>
</table>
<button style = "position:relative; left:74.5%" onclick="location.href='${cp}/daily/delete?num=${vo.num}'" class="btn btn-white w-100 delete" id = "update" type="button">삭제</button>
<button style = "position:relative; left:74.5%" onclick="location.href='${cp}/daily/update?num=${vo.num}'" class="btn btn-white w-100 update" id = "update" type="button">수정</button>
<button style = "position:relative; left:74.5%" onclick="location.href='${cp}/daily_main'" class="btn btn-white w-100 listAll" id = "listAll" type="button">전체목록</button>

