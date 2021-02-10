<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<!-- home.jsp -->
<div>
    <h1>main test 하이하이</h1>
    <a href="${cp }/board/all/list/">구독자게시판</a>
    <a href="${cp }/board/all/article/1">글보기</a>
</div>
<script>
	$(function(){
		
		var errorMsg="${errorMsg}";
		if(errorMsg!=''){
			alert(errorMsg);
		}
	})
</script>