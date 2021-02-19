<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<h2>디테일 페이지</h2>
<div id="t_wrap">
	<div id="t_content">
		<table border="1" width="800px">
			<tr>
				<td>제목</td><td>${vo.title }<input type="hidden" value="${vo.num }" id="num"></td>
			</tr>
			<tr>
				<td>작성자</td><td>${vo.id }</td>

			</tr>
			<tr>
				<td>카테고리</td><td>${vo.cname }</td>
			</tr>
			<tr>
				<td>본문</td><td>${vo.content }</td>
			</tr>
		</table>

		<div id="t_recommend">
		</div>
		
		<div id="t_scrap">
		</div>
		
	<c:if test="${id != null }">
		<input type="button" id="btn_recomm" value="추천" name="btn_recomm">
	</c:if>
	<c:if test="${vo.id==id }">
		<input type="button" id="btn_mod" value="수정" name="btn_mod" onclick="location.href='${cp}/feedboard_goupdate?num=${vo.num }&recentpage=feed'">
	</c:if>
	<c:if test="${feedRole == 'ROLE_AUTHOR' && vo.ispost=='-1' }">
		<input type="button" id="btn_post" value="발행" name="btn_mod" onclick="location.href='${cp}/feedboard_changeStatus?num=${vo.num }'">
	</c:if>
	</div>
	
	<div id="t_comments">
	</div>
	
	<c:if test="${id != null }">
		<label for="comm">아이디: </label>${id }<input type="hidden" id="cid" value="${id }"><br>
		<label for="comm">댓글: </label><input type="text" id="comm"><input type="button" value="등록" id="btn_ins"><br>
	</c:if>
</div>
<script type="text/javascript">
	
	var num=$("#num").val();
	var cid=$("#cid").val();
	
	$.ajax({
		url:'/bonfire/feedboard_showComm?num='+num,
		dataType: 'xml',
		success: function(data){
			$("#t_comments").empty();
			$(data).find('item').each(function(){
				var idx=$(this).find('idx').text();
				var id=$(this).find('id').text();
				var content=$(this).find('content').text();
				var str="<div style='border: 1px solid black; height: auto;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"<br>";
				str+="<input type='hidden' value='"+idx+"' id='idx'>"
				str+="<input type='hidden' value='"+id+"' id='ccid'>"
				str+="<input type='hidden' value='"+content+"' id='ccontent'>"
				if(cid=='admin' || id == cid){	//세션 아이디가 어드민이거나, 댓글 작성자 본인일 경우
					str+="<input type=\"button\" value=\"삭제\" name=\"del\" id=\"btn_del\" onclick=\"delCom()\"></div>";
				}
				str+="</div>";
				$("#t_comments").append(str)
			});
		}
	});
	
	$("#btn_ins").click(function(){
		var cid=$("#cid").val();
		var num=$("#num").val();
		var content=$("#comm").val();
		$.ajax({
			url:'/bonfire/feedboard_insertComm?num='+num+'&id='+cid+'&content='+content,
			dataType: 'xml',
			success:function(data){
				$("#t_comments").empty();
				$(data).find('item').each(function(){
					var idx=$(this).find('idx').text();
					var id=$(this).find('id').text();
					var content=$(this).find('content').text();
					var str="<div style='border: 1px solid black; height: auto;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"<br>";
					str+="<input type='hidden' value='"+idx+"' id='idx'>"
					str+="<input type='hidden' value='"+id+"' id='ccid'>"
					str+="<input type='hidden' value='"+content+"' id='ccontent'>"
					if(cid=='admin' || id == cid){
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" id=\"btn_del\" onclick=\"delCom()\"></div>";
					}
					str+="</div>";
					$("#t_comments").append(str);
					$("#comm").val('');
				});
			}
		});
	});
	
	function delCom(){
		var idx=$("#idx").val();
		var num=$("#num").val();
		$.ajax({
			url:'/bonfire/feedboard_deleteComm?num='+num+'&idx='+idx,
			dataType: 'xml',
			success:function(data){
				$("#t_comments").empty();
				$(data).find('item').each(function(){
					var idx=$(this).find('idx').text();
					var id=$(this).find('id').text();
					var content=$(this).find('content').text();
					var str="<div style='border: 1px solid black; height: auto;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"<br>";
					str+="<input type='hidden' value='"+idx+"' id='idx'>"
					str+="<input type='hidden' value='"+id+"' id='ccid'>"
					str+="<input type='hidden' value='"+content+"' id='ccontent'>"
					if(cid=='admin' || id == cid){
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" id=\"btn_del\" onclick=\"delCom()\"></div>";
					}
					str+="</div>";
					$("#t_comments").append(str);
				});
			}
		});
	}
	
	var id="<%=(String)session.getAttribute("id")%>";
	var num=$("#num").val();
	$.ajax({
			url:'/bonfire/feedboard_showRecommTot?num='+num,
			dataType : 'xml',
			success:function(data){
				$("#t_recommend").empty();
				console.log($(data).find('r').text());
				var r=$(data).find('r').text();
				var str="추천수:  " + r;
				$("#t_recommend").append(str);
			}
		});
	
	
	$("#btn_recomm").click(function(){
		console.log("클릭클릭");
		var num=$("#num").val();
		var id="<%=(String)session.getAttribute("id")%>";
		$.ajax({
			url:'/bonfire/feedboard_insertRecomm?num='+num+'&id='+id,
			dataType : 'xml',
			success:function(data){
				console.log("석세스펑션!!!!!")
				$("#t_recommend").empty();
				var r=$(data).find('r').text();
				var str="추천수:  " + r;
				$("#t_recommend").append(str);
			}
			});
		});
	
</script>