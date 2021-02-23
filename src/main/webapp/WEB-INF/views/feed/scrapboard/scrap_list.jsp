<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<style>
	#feedboard_wrap {font-family: '나눔손글씨 사랑해 아들'; font-size:26px; font-weight: bold;}
	#scarp_detaillink{text-decoration:none;}
	#scrap_paging{text-decoration:none;}
	#goMain{text-decoration:none;}
</style>
<div id="feedboard_wrap">
	<div id="feedboard_main">
		<h2>${feedId }님의 스크랩게시판</h2>
		<form:form method="post" onsubmit="chechDel(event)">
			<div id="scrapboard_table">
				<c:choose>
				<c:when test="${list == null}">
					스크랩한 게시글이 없습니다!
				</c:when>
				<c:otherwise>
					<table border="1" width="800px">
						<tr>
							<th>카테고리</th>
							<th>작성자</th>
							<th>제목</th>
							<th>조회수</th>
							<th>추천</th>
							<th>스크랩 수</th>
							<th>게시 날짜</th>
							<th><input type="checkbox" id="allcheck"></th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
									<td>${vo.cname }</td>
									<td>${vo.writer}</td>
									<td><a href="${cp }/scrapboard_detail?num=${vo.num }&from=scrap" id="scarp_detaillink">${vo.title }</a></td>
									<td>${vo.hits}</td>
									<td>${vo.recommend}</td>
									<td>${vo.scrap}</td>
									<td>${vo.postdate}</td>
									<td><input type="checkbox" name="checkk" value=${vo.num }></td>
						</c:forEach>
					</table>
					</c:otherwise>
				</c:choose>
				<div id="scrap_editlist">
					<c:if test="${id == feedId}">
						<input type="submit" value="삭제" name="scrapboard_delete" formaction="${cp }/scrapboard_delete">
					</c:if>
				</div>
			</div>
		</form:form>
	</div>

	<div>
		<c:if test="${pu.startPage > 10}">
	         <a href="${cp }/scrapboard_feed_scraplist?page=${pu.startPage - 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[이전]</span> </a>
	    </c:if>
		<c:forEach var="i" begin="${pu.startPage }" end="${pu.endPage }">
			<c:choose>
				<c:when test="${i==pu.page }">
					<a href="${cp }/scrapboard_feed_scraplist?page=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'id="scrap_paging">[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/scrapboard_feed_scraplist?page=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPage < pu.pageCount}">
	     	<a href="${cp }/scrapboard_feed_scraplist?page=${pu.endPage + 1}&field=${field}&keyword=${keyword}"><span style='color:blue'>[다음]</span> </a>
	    </c:if>
	</div>
	<a href="${cp }/" id="goMain">메인페이지로</a>
	<div id="scrap_search">
		<form:form method="post" action="${cp }/scrapboard_feed_scraplist">
			<select name="field">
				<option value="cname" <c:if test="${field=='cname'}">selected</c:if>>지역</option>
				<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
				<option value="toc" <c:if test="${field=='toc'}">selected</c:if>>제목+내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form:form>
	</div>
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
		
		function checkDel(e){
			let cnt=0;
	         $("input:checkbox[name='checkk']").each(function(){
	            if($(this).is(":checked")==true){
	            	cnt++;
	               console.log(cnt);
	            }else{
	               console.log(cnt);
	            }
	         });
	         if(cnt==0){
	        	 	alert("삭제할 글을 1개 이상 선택하세요.");
	        	 	e.preventDefault();
 				}else{
	        	 	if(confirm("삭제하시겠습니까?")==true){
 						return true;
	        	 	}else{
	        	 		e.preventDefault();
	        	 	}
 				}
		}
</script>