<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<h2>디테일 페이지</h2>
<div id="t_wrap">
	<div id="t_content">
	<form:form>
		<h3>제목 : ${vo.title }</h3>
		<input type="hidden" value="${vo.num }" id="num">
		아이디 : ${vo.id }<br>
		<input type="hidden" value="${vo.id }" id="writer">
		카테고리 : ${vo.cname }<br>
		<input type="hidden" value="${vo.cname }" id="cname">
		본문 : ${vo.content}<br>
		<input type="hidden" value="${vo.content }" id="content">
	<div id="t_recommendNscrap">
		<input type="button" id="recomm" value="추천" name="btn_recomm">
		<input type="button" id="scrap" value="스크랩" name="btn_scrap">
	</div>
	</form:form>
	</div>
	
	<div id="t_comments">
	</div>

	<br>
	아이디: ${id }<input type="hidden" id="cid" value="${id }"><br>
	댓글:<input type="text" id="comm"><input type="button" value="등록" id="btn1"><br>
</div>

<script type="text/javascript">
	var num=$("#num").val();
	$.ajax({
		url:'/bonfire/feedboard_showComm?num='+num,
		dataType: 'xml',
		success: function(data){
			$("#t_comments").empty();
			var id=$(data).find('item').each(function(){
				var idx=$(this).find('idx').text();
				console.log(idx);
				var id=$(this).find('id').text();
				var content=$(this).find('content').text();
				$("#t_comments").append("<div style='border: 1px solid black; width: 500px; height: 70px;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"</div>")
			});
		}
	});
	
	$("#btn1").click(function(){
		var id=$("#cid").val();
		var num=$("#num").val();
		var content=$("#comm").val();
		$.ajax({
			url:'/bonfire/feedboard_insertComm?num='+num+'&id='+id+'&content='+content,
			dataType: 'xml',
			success:function(data){
				$("#t_comments").empty();
				var id=$(data).find('item').each(function(){
					var idx=$(this).find('idx').text();
					console.log(idx);
					var id=$(this).find('id').text();
					var content=$(this).find('content').text();
					$("#t_comments").append("<div style='border: 1px solid black; width: 500px; height: 70px;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"</div>")
				});
			}
		});
	});
</script>