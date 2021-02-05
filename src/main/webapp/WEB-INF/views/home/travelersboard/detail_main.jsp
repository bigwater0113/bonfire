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
		<input type="hidden" value="${vo.id }" id="id">
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
	아이디: ${id }<input type="hidden" id="comid" value="${id }"><br>
	댓글:<input type="text" id="comm"><input type="button" value="등록" id="btn1"><br>
</div>

<script type="text/javascript">
	var num=$("#num").val();
	$.ajax({
		url:'/bonfire/feedboad_showComm?num='+num,
		dataType: 'xml',
		success: function(data){
			$("#t_comments").empty();
			var id=$(data).find('')
		}
	});
	
	$("#btn1").click(function(){
		var id=$("#comid").val();
		var comm=$("#comm").val();
		$.ajax({
			url:'댓글테이블에 인서트할 컨트롤러?id='+id+'&comments='+comm+'&mnum='+mnum,
			dataType: 'xml',
			success:function(data){
				$("#comments").empty();
				$("#title").empty();
				$("#content").empty();
				$("#director").empty();
				var title=$(data).find('title').text();
				var content=$(data).find('content').text();
				var director=$(data).find('director').text();
				
				$(data).find('commList').each(function(){
					var num=$(this).find('num').text();
					var id=$(this).find('id').text();
					var comments=$(this).find('comments').text();
					console.log(num+id+comments);
					$("#comments").append("<div style='border: 1px solid black; width: 500px; height: 70px;'> 번호:"+num+"<br>아이디:"+id+"<br>댓글:"+comments+"</div>");
				});
				
				$("#title").append(title);
				$("#content").append(content);
				$("#director").append(director);
			}
		});
	});
</script>