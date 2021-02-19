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
<div >
	<table border="1" width="1000">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="vo" items="${list }">
	<c:choose>
	<c:when test="${vo.pin==1}">
		<tr>
			<td>공지사항</td>
			<td>관리자</td>
			<c:choose>
			<c:when test="${! empty id}">
				<td><a href="${cp }/qna/detail?num=${vo.num}&id=${id}">${vo.title }</a></td>
			</c:when>
			<c:otherwise>
				<td><a href="${cp }/login">${vo.title }</a></td>
			</c:otherwise>
			</c:choose>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
			<td>${vo.hits }</td>
		</tr>	
		</c:when>
		<c:when test="${vo.secret==1}">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.id }</td>
			<c:choose>
				<c:when test="${! empty id}">
			<td><a href="${cp }/qna/secretpwd?num=${vo.num}&id=${id}">비밀글입니다.</a></td>
			</c:when>
			<c:otherwise>
				<td><a href="${cp }/login">비밀글입니다</a></td>
			</c:otherwise>
			
			</c:choose>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
			<td>${vo.hits }</td>
			</tr>
		</c:when>
		<c:when test="${! empty id}">
			<tr>
			<td>${vo.num }</td>
			<td>${vo.id }</td>
			<td><a href="${cp }/qna/detail?num=${vo.num}&id=${id}">${vo.title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
			<td>${vo.hits }</td>
		</tr>	
		</c:when>
			<c:otherwise>
			<tr>
			<td>${vo.num }</td>
			<td>${vo.id }</td>
			<td><a href="${cp }/login">${vo.title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
			<td>${vo.hits }</td>
		</tr>	

	</c:otherwise>
			</c:choose>
	</c:forEach>
	</table>
	</div>
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
<c:if test="${id != null }">
	<a href="${cp }/qna/insert">글쓰기</a>
	</c:if>
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
</body>
</html>