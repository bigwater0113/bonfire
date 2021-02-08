<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>문의게시판</h1>
<div>
	<table border="1" width="500">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.id }</td>
			<td><a href="${cp }/qna/detail?num=${vo.num}&id=${id}">${vo.title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
			<td>${vo.hits }</td>
		</tr>	
	</c:forEach>
	</table>
<div>
<c:if test="${pu.startPageNum > 10}">
         <a href="${cp }/qna/main?pageNum=${pu.startPageNum - 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>◁</span> </a>
      </c:if>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="${cp }/qna/main?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color: blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/qna/main?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color: gray'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPageNum < pu.totalPageCount}">
            <a href="${cp }/qna/main?pageNum=${pu.endPageNum + 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>▷</span> </a>
      </c:if>
</div>	
	<a href="${cp }/qna/insert">글쓰기</a>
<div>
	<form:form method="post" action="${cp }/qna/main">
		<select name="field">
			<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
  			<option value="content" <c:if test="${field=='content' }">selected</c:if>>내용</option>
      		<option value="cc" <c:if test="${field=='cc' }">selected</c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form:form>
</div>	
</div>
</body>
</html>