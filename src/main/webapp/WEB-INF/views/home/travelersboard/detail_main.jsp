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
				<td>제목</td><td>${vo.title }<input type="hidden" value="${vo.num }" id="num"><input type="hidden" value="${vo.title }" id="title"></td>
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
		<input type="button" id="btn_scrap" value="스크랩" name="btn_scrap">
	</c:if>
	<c:if test="${vo.id==id }">
		<input type="button" id="btn_mod" value="수정" name="btn_mod" onclick="location.href='${cp}/feedboard_goupdate?num=${vo.num }&recentpage=main'">
	</c:if>
	</div>
	<a href="${cp }/feedboard_main_selectAll">목록으로</a>
	<div>
	<h4>Comments</h4>
		<div id="t_comments">
		</div>
	</div>
	<input type="hidden" id="postingId" value="${vo.id }">
	<c:if test="${id != null }">
		<label for="comm">아이디: </label>${id }<input type="hidden" id="cid" value="${id }"><br>
		<label for="comm">댓글: </label><input type="text" id="comm"><input type="button" value="등록" id="btn_ins">
		<input type="button" value="수정완료" id="btn_edit" style="display: none"><br>
	</c:if>
</div>
<script type="text/javascript">

	var num=$("#num").val();
	var cid=$("#cid").val();
	
	//댓글 불러오기
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
				str+="<input type='hidden' value='"+idx+"'>"
				str+="<input type='hidden' value='"+id+"'>"
				str+="<input type='hidden' value='"+content+"'>"
				if(cid=='admin' || id == cid){	//세션 아이디가 어드민이거나, 댓글 작성자 본인일 경우
					str+="<input type=\"button\" value=\"삭제\" name=\"del\" onclick=\"delCom(event)\">";
				}
				if(id==cid){
					str+="<input type=\"button\" value=\"수정\" name=\"edit\" onclick=\"editCom(event)\">";
				}
				str+="</div>";
				$("#t_comments").append(str)
			});
		}
	});
	
	//댓글 추가
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
					str+="<input type='hidden' value='"+idx+"'>"
					str+="<input type='hidden' value='"+id+"'>"
					str+="<input type='hidden' value='"+content+"'>"
					if(cid=='admin' || id == cid){	//세션 아이디가 어드민이거나, 댓글 작성자 본인일 경우
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" onclick=\"delCom(event)\">";
					}
					if(id==cid){
						str+="<input type=\"button\" value=\"수정\" name=\"edit\" onclick=\"editCom(event)\">";
					}
					str+="</div>";
					$("#t_comments").append(str);
					$("#comm").val('');
				});
			}
		});
	});
	
	//댓글 삭제
	function delCom(e){
		var idx=$(e.target).prev().prev().prev().val();
		console.log(idx);
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
					str+="<input type='hidden' value='"+idx+"'>"
					str+="<input type='hidden' value='"+id+"'>"
					str+="<input type='hidden' value='"+content+"'>"
					if(cid=='admin' || id == cid){	//세션 아이디가 어드민이거나, 댓글 작성자 본인일 경우
						str+="<input type=\"button\" value=\"삭제\" name=\"del\" onclick=\"delCom(event)\">";
					}
					if(id==cid){
						str+="<input type=\"button\" value=\"수정\" name=\"edit\" onclick=\"editCom(event)\">";
					}
					str+="</div>";
					$("#t_comments").append(str);
				});
			}
		});
	}
	
	//댓글 수정하기 버튼
	function editCom(e){
		var content=$(e.target).prev().prev().val();
		$("#comm").val(content);
		$("#btn_ins").css('display','none');
		$("#btn_edit").css('display','');
		//댓글 수정 완료 버튼
		$("#btn_edit").unbind("click").bind("click",function() {
			var content2=$("#comm").val();
			var idx=$(e.target).prev().prev().prev().prev().val();
			var num=$("#num").val();
			console.log(content2);
			console.log(idx);
			console.log(num);
			$.ajax({
	 			url:'/bonfire/feedboard_editComm?num='+num+'&idx='+idx+'&content='+content2,
	 			dataType: 'xml',
	 			success:function(data){
	 				$("#t_comments").empty();
	 				$(data).find('item').each(function(){
	 					var idx=$(this).find('idx').text();
	 					var id=$(this).find('id').text();
	 					var content=$(this).find('content').text();
	 					var str="<div style='border: 1px solid black; height: auto;'> 번호:"+idx+"<br>아이디:"+id+"<br>댓글:"+content+"<br>";
	 					str+="<input type='hidden' value='"+idx+"'>"
	 					str+="<input type='hidden' value='"+id+"'>"
	 					str+="<input type='hidden' value='"+content+"'>"
	 					if(cid=='admin' || id == cid){	//세션 아이디가 어드민이거나, 댓글 작성자 본인일 경우
	 						str+="<input type=\"button\" value=\"삭제\" name=\"del\" onclick=\"delCom(event)\">";
	 					}
	 					if(id==cid){
	 						str+="<input type=\"button\" value=\"수정\" name=\"edit\" onclick=\"editCom(event)\">";
	 					}
	 					str+="</div>";
	 					$("#t_comments").append(str);
	 					var idx='';
	 					var num='';
	 					var content='';
						$("#btn_edit").css('display','none');
						$("#btn_ins").css('display','');
	 				});
	 			}
	 		});
		});
	}
	
	//추천 수 표시
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
	
	//추천 버튼
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
	//스크랩 수 표시
	var id="<%=(String)session.getAttribute("id")%>";
	var num=$("#num").val();
	$.ajax({
			url:'/bonfire/feedboard_selectScrap?num='+num,
			dataType : 'xml',
			success:function(data){
				$("#t_scrap").empty();
				console.log($(data).find('s').text());
				var s=$(data).find('s').text();
				var str="스크랩:  " + s;
				$("#t_scrap").append(str);
			}
		});
	
	//스크랩 버튼
	$("#btn_scrap").click(function(){
		var num=$("#num").val();
		var id="<%=(String)session.getAttribute("id")%>";
		if(confirm("스크랩 하시겠습니까?") == true){
		$.ajax({
			url:'/bonfire/feedboard_insertScrapboard?num='+num+'&id='+id,
			dataType : 'xml',
			success:function(data){
				var msg=$(data).find('msg').text();
				if(msg == 'success'){
					alert("스크랩되었습니다.");
				}else{
					alert("이미 스크랩한 글입니다.");
				}
				$("#t_scrap").empty();
				var s=$(data).find('s').text();
				var str="스크랩:  " + s;
				$("#t_scrap").append(str);
			}
			});
		}else{
			return false;
		}
	});
	
</script>