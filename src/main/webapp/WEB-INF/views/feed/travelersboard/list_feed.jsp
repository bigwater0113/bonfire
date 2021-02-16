<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<script>
/*
	일반 회원 페이지 >> (본인 + 관리자만 접근 가능) 
		글등록하기
		작성페이지 - 등록버튼
		글목록 - 등록 날짜 표시(adddate)
	
	작가회원 페이지 >> (본인 + 모든 회원 + 관리자 접근 가능)
		글등록하기
		작성페이지 - 등록버튼 / 발행버튼 (등록 - 본인만 보이기 / 발행 - 전체공개)
		글목록 - 
			로그인아이디==작가본인 : 모든 글 노출(등록날짜 발행날짜 표시)
	 		로그인아이디!=작가본인 : 발행 글 노출(발행날짜 표시)
 */
</script>
<div id="feedboard_wrap">
	<div id="feedboard_main">
		<h2>${id }님의 여행게시판</h2>
	</div>
	<form:form method="post">
		<div id="feedboard_table">
			<table>
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>게시날짜</th>
					<th>조회수</th>
					<th>추천</th>
					<th>스크랩</th>
					<th><input type="checkbox" id="allcheck"></th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
							<td>${vo.cname }</td>
							<td><a href="${cp }/feedboard_detail?num=${vo.num }">${vo.title }</a></td>
							<td>${vo.adddate }</td>
							<td>${vo.hits}</td>
							<td>${vo.recommend}</td>
							<td>${vo.scrap}</td>
							<td><input type="checkbox" name="checkk" value=${vo.num }></td>
				</c:forEach>
			</table>
			<div id="feedboard_editlist">
					<input type="submit" value="삭제" name="feedboard_delete" formaction="${cp }/feedboard_deleteList">
					<input type="button" value="글쓰기" name="feedboard_write" formaction="${cp }/member/feedboard_Towrite">
			</div>
		</div>
	</form:form>
</div>
	<div>
	<c:if test="${pu.startPage > 10}">
         <a href="${cp }/feedboard_feed_selectAllbyId?page=${pu.startPage - 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[이전]</span> </a>
    </c:if>
	<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
		<c:choose>
			<c:when test="${i==pu.page }">
				<a href="${cp }/feedboard_feed_selectAllbyId?page=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/feedboard_feed_selectAllbyId?page=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPage < pu.pageCount}">
     	<a href="${cp }/feedboard_feed_selectAllbyId?page=${pu.endPage + 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[다음]</span> </a>
    </c:if>
</div>
<a href="${cp }/feedboard_feed_selectAllbyId">전체글보기</a><br>
<a href="${cp }/">메인페이지로</a>
<div>
	<form method="post" action="${cp }/feedboard_feed_selectAllbyId">
		<select name="field">
			<option value="cname" <c:if test="${field=='cname'}">selected</c:if>>지역</option>
			<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
			<option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
			<option value="toc" <c:if test="${field=='toc'}">selected</c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
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