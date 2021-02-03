<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>문의게시판</h1>
<div>
	<form action="${cp }/qna" method="post">
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
			<td>${vo.title }</td>
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
	</form>
</div>
</body>
</html>