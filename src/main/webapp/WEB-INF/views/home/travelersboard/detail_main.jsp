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
		</form:form>

		<div id="t_recommend">
		</div>
		
	<c:if test="${id != null }">
		<input type="button" id="btn_recomm" value="추천" name="btn_recomm">
		<input type="button" id="btn_scrap" value="스크랩" name="btn_scrap">
	</c:if>
	</div>
	
	<div id="t_comments">
	</div>
	
	<c:if test="${id != null }">
		아이디: ${id }<input type="hidden" id="cid" value="${id }"><br>
		댓글:<input type="text" id="comm"><input type="button" value="등록" id="btn_ins"><br>
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
				str+="<input type='hidden' value='"+content+"' content='ccontent'>"
				if(cid=='admin'){
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
					str+="<input type='hidden' value='"+content+"' content='ccontent'>"
					if(cid=='admin'){
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" id=\"btn_del\" onclick=\"delCom()\"></div>";
					}
					str+="</div>";
					$("#t_comments").append(str)
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
					str+="<input type='hidden' value='"+content+"' content='ccontent'>"
					if(cid=='admin'){
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" id=\"btn_del\" onclick=\"delCom()\"></div>";
					}
					str+="</div>";
					$("#t_comments").append(str)
				});
			}
		});
	}
	
////////////////////////////////추천수 에이작스로 숫자올리기 로그인시 안뜸. 로그인 안하면 뜨는 상태 
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
	/////////////////////////////////////////////
	
</script>