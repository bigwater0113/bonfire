<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.btn.btn-white.w-100{display:inline-block;font-size:25px;font-weight:bold;}
	.btn.btn-white.w-100.approve{width:7%!important; margin-bottom: 6px;}
	.btn.btn-white.w-100.deny{width:7%!important; margin-bottom: 6px;}
	.btn.btn-white.w-100.listAll{width: 10%!important;}
	
</style>
<h1><b>${vo.id }님의 작가 신청</b></h1>
<form:form method = "post" onsubmit = "check(event)">
<table border = "1" width = "800" class="table table-vcenter table-mobile-md card-table">
	<tr>
		<th>신청 날짜</th>
		<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${vo.adddate }"/></td>
	</tr>
	<tr>
		<th>한마디 요약</th>
		<td>${vo.pres }</td>
	</tr>
	<tr>
		<th>테마</th>
		<td>${vo.theme }</td>
	</tr>
	<tr>
		<th>신청 사유</th>
		<td>${vo.intro }</td>
	</tr>
</table>
<input type = "submit" value = "승인" name = "approve" formaction = "${cp }/author/approveOne?num=${vo.num}" class="btn btn-white w-100 btns approve">
<input type = "submit" value = "거부" name = "deny" formaction = "${cp }/author/denyOne?num=${vo.num}" class="btn btn-white w-100 btns deny">
<button style = "position:relative; left:74.5%" onclick="location.href='${cp}/authorRegList'" class="btn btn-white w-100 listAll" id = "listAll" type="button">전체목록</button>
</form:form>

<script>
function check(e){
	if(confirm("이 항목을 승인 혹은 거절 하시겠습니까?")==true) {
		return true;
	} else {
		e.preventDefault();
	}
}
</script>