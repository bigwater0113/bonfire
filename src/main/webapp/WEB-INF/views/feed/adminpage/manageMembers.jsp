<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- manageMember.jsp -->
<div>
	<h1>회원관리</h1>
	<table border="1" width="900">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>등급</th>
			<th>상세보기</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<th>${vo.id }</th>
				<th>${vo.name}</th>
				<th>${vo.email}</th>
				<th>${vo.regdate}</th>
				<th>${vo.authority}</th>
				<th><a href="${cp }/manageMembers_detail?id=${vo.id}">상세보기</a></th>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:choose>
			<c:when test="${pu.startPage>10 }">
					<a href="${cp }/manageMembers_List_All?pageNum=${pu.startPage-1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[이전]</span></a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
			<c:choose>
				<c:when test="${i!=pu.page }">
					<a href="${cp }/manageMembers_List_All?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'>[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/manageMembers_List_All?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPage<pu.pageCount }">
					<a href="${cp }/manageMembers_List_All?pageNum=${pu.endPage+1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[다음]</span></a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<form:form method="post" action="${cp }/manageMembers_List_All">
			<select name="field">
				<option value="id" <c:if test="${field=='id' }">selected</c:if>>아이디</option>
				<option value="name" <c:if test="${field=='name'}">selected</c:if>>이름</option>
				<option value="email" <c:if test="${field=='email' }">selected</c:if>>이메일</option>
				<option value="phone" <c:if test="${field=='phone' }">selected</c:if>>전화번호</option>
				<option value="roadfulladdr" <c:if test="${field=='roadfulladdr' }">selected</c:if>>주소</option>
				<option value="authority" <c:if test="${field=='authority' }">selected</c:if>>등급</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form:form>
	</div>
</div>