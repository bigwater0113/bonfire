<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    


<h1>${id }님의 일기장</h1>

<table border = "1" width = "600">
	<tr>
		<th>날짜</th>
		<th>제목</th>
		<th>글내용</th>
	</tr>
	<c:forEach var = "vo" items = "${list }">
		<tr>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/>
			<td>${vo.title }
			<td><a href = "${cp }/daily/detail?num=${vo.num}&id=${id}">${vo.content }</a>
		</tr>
	</c:forEach>
</table>

<div id = "pageNum">
	<c:if test="${pu.startPageNum > 10}">
         <a href="${cp }/daily_main?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>◁</span> </a>
	</c:if>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="${cp }/daily_main?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color: blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/daily_main?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color: gray'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPageNum < pu.totalPageCount}">
            <a href="${cp }/daily_main?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>▷</span> </a>
	</c:if>
</div>	

<div id = "search">
	<a href = "${cp }/daily/insert">글쓰기</a>
	<form:form method= "post" action="${cp }/daily_main">
		<select name = "field">
			<option value = "title" <c:if test = "${field == 'title' }">selected</c:if>>제목</option>
			<option value = "content" <c:if test = "${field == 'content' }">selected</c:if>>내용</option>
		</select>
		<input type = "text" name = "keyword">
		<input type = "submit" value = "검색">
	</form:form>
	
</div>