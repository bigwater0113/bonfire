<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<div id="feedboard_wrap">
	<div id="feedboard_main">
		<h2>여행자게시판</h2>
	</div>
	<form:form method="post">
		<div id="feedboard_editlist">
			<c:if test="${id == 'admin'}">
				<input type="submit" value="삭제" name="feedboard_delete" formaction="${cp }/feedboard_deleteList">
			</c:if>
<!-- 			<input type="submit" value="추천 ▲" name="feedboard_desc" formaction=""> -->
		</div>
		<div id="feedboard_table">
			<table>
				<tr>
				<c:if test="${id == 'admin'}">
					<th><input type="checkbox" id="allcheck"></th>
				</c:if>
					<th>글번호</th>
					<th>카테고리</th>
					<th>작성자</th>
					<th>제목</th>
					<th>게시날짜</th>
					<th>조회수</th>
					<th>추천</th>
					<th>스크랩</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<c:if test="${id == 'admin'}">
							<td><input type="checkbox" name="checkk" value=${vo.num }></td>
						</c:if>
<%-- 							<c:set var="num" value="${vo.num }"/> --%>
							<td>${vo.num }</td>
							<td>${vo.cname }</td>
							<td>${vo.id }</td>
							<td><a href="${cp }/feedboard_detail?num=${vo.num }">${vo.title }</a></td>
							<td>${vo.postdate }</td>
							<td>${vo.hits}</td>
							<td>${vo.recommend}</td>
							<td>${vo.scrap}</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</form:form>
</div>
	<div>
	<c:if test="${pu.startPage > 10}">
         <a href="${cp }/feedboard_main_selectAll?page=${pu.startPage - 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[이전]</span> </a>
    </c:if>
	<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
		<c:choose>
			<c:when test="${i==pu.page }">
				<a href="${cp }/feedboard_main_selectAll?page=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/feedboard_main_selectAll?page=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPage < pu.pageCount}">
     	<a href="${cp }/feedboard_main_selectAll?page=${pu.endPage + 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[다음]</span> </a>
    </c:if>
</div>
<a href="${cp }/feedboard_main_selectAll">전체글보기</a><br>
<a href="${cp }/">메인페이지로</a>
<div>
	<form:form method="post" action="${cp }/feedboard_main_selectAll">
		<select name="field">
			<option value="id" <c:if test="${field=='id'}">selected</c:if>>작성자</option>
			<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
			<option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
			<option value="toc" <c:if test="${field=='toc'}">selected</c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form:form>
</div>

<script>
		var check=0;
		document.getElementById("allcheck").addEventListener("click", function(e) {
		if(check==0){
			check=1;
		}else{
			check=0;
		}
		var checkk=document.getElementsByName("checkk");
		for(var i=0;i<=checkk.length;i++){
			if(check==1){
				checkk[i].checked=true;
			}else{
				checkk[i].checked=false;
			}
		}
	}, true);
</script>