<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<!-- home.jsp -->
<style>
	#home_search{width:700px;margin:50px auto;}
	#home_recommAuthor{width:1000px;margin:50px auto;}
	#home_popularArticle{width:1000px;margin:50px auto;}
	#home_popularPlace{width:1000px;margin:50px auto;}
	li{list-style: none;}
	#home_articleList li{display: inline-block;}
	#home_placeList li{display: inline-block;}
	.authorDiv{width:230px;height:230px; margin-left:10px;margin-right:10px;background-color: lightgreen; float:left}
	.articleDiv{width:180px;height:180px; margin-left:5px;margin-right:5px; background-color: lightblue;}
	.placeDiv{width:230px;height:230px; margin-left:10px;margin-right:10px; background-color: lightblue;}
	.btnIcon{opacity:0.5;}
	.btnIcon:hover{opacity:1;}
	.aHover{color:#aaaaaa;text-decoration:none; }
	.aHover:hover{color:black;}
</style>
<div id="home_wrap">
    <div id="home_search">
    	<form>
    		<select name="field">
    			<option value="author">작가</option>
    			<option value="place">여행지</option>
    		</select>
	    	<input type="text" name="keyword" style="width:500px;"><input type="submit" value="검색">
    	</form>
    </div>
    <div id="home_recommAuthor">
   		<span>추천작가 <img src="${cp }/resources/images/refreshIcon.png" class="btnIcon" id="refreshAuthor" style="width:17px;height:15px;"></span>
		<div >
			<img src="${cp }/resources/images/leftArrowIcon.png"  class="btnIcon" id="authorLeft"
						style="width:110px;height:110px;position:relative;top:-65px;">
			<div  id="home_authors" style="width:750px;display:inline-block;overflow:hidden;">
				<div id="home_authorList" style="width:5000px;float:left;position:relative;">
					<c:forEach var="i" begin="1" end="12">
						<div class="authorDiv" id="author${i}"></div>
					</c:forEach>
				</div>
			</div>
			<img src="${cp }/resources/images/rightArrowIcon.png"  class="btnIcon" id="authorRight"
						style="width:110px;height:110px;position:relative;top:-65px;">
		</div>
    </div>
    <div id="home_popularArticle">
    	<ul>
    		<li>
    			인기글 <a href="javascript:popularHits()" class="aHover">조회</a>
    			<a href="javascript:popularRecomm()" class="aHover">추천</a>
    		</li>
    		<li>
    			<ul id="home_articleList">
    				<li><div class="articleDiv" id="article1"></div></li>
    				<li><div class="articleDiv" id="article2"></div></li>
    				<li><div class="articleDiv" id="article3"></div></li>
    				<li><div class="articleDiv" id="article4"></div></li>
    				<li><div class="articleDiv" id="article5"></div></li>
    			</ul>
    		</li>
    	</ul>
    </div>
    <div id="home_popularPlace">
    	<ul>
    		<li>인기여행지</li>
    		<li>
	    		<ul id="home_placeList">
	   				<li>
	   					<div class="placeDiv" id="place1"></div>
	   				</li>
	   				<li>
	   					<div class="placeDiv" id="place2"></div>
	   				</li>
	   				<li>
	   					<div class="placeDiv" id="place3"></div>
	   				</li>
	   			</ul>
   			</li>
    	</ul>
    </div>
</div>
<script>
	$(function(){
		var errorMsg="${errorMsg}";
		if(errorMsg!=''){
			alert(errorMsg);
		}
		var authorPage=1;
		
		
		
		//home 화면 오면 추천작가 새로고침
		$.ajax({
			url:"${cp}/recommAuthor",
			dataType: 'xml',
			success:function(data){
				var i=1;
				$(data).find("item").each(function(){
					$("#author"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
					$("#author"+(i)).css('backgroundSize', '100% 100%');
					var id=$(this).find('id').text();
					var nickname=$(this).find('nickname').text();
					var intro=$(this).find('intro').text();
					$("#author"+(i)).click(function(){
						location.href="${cp}/@"+id;
					});
					$("#author"+(i++)).append(`
							<p>id:`+id+`</p><p>닉네임:`+nickname+`</p><p>소개:`+intro+`</p>
							`);
				});
			}
		});
		//추천작가 새로고침 버튼
		$("#refreshAuthor").click(function(){
			$.ajax({
				url:"${cp}/recommAuthor",
				dataType: 'xml',
				success:function(data){
					var i=1;
					$(data).find("item").each(function(){
						$("#author"+(i)).empty();
						$("#author"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
						$("#author"+(i)).css('backgroundSize', '100% 100%');
						var id=$(this).find('id').text();
						var nickname=$(this).find('nickname').text();
						var intro=$(this).find('intro').text();
						$("#author"+(i)).click(function(){
							location.href="${cp}/@"+id;
						});
						$("#author"+(i++)).append(`
								<p>id:`+id+`</p><p>닉네임:`+nickname+`</p><p>소개:`+intro+`</p>
								`);
					});
				}
			});
		});
		//추천작가 왼쪽 오른쪽 버튼
		$("#authorLeft").click(function(){
			if(authorPage!=1){
				console.log(parseInt($("#home_authorList").css('left')));
				var move=parseInt($("#home_authorList").css('left'))+750;
				console.log("left2");
				$("#home_authorList").animate({
					left:move
				},500);
				console.log("left3");
				authorPage--;
			}
		});
		$("#authorRight").click(function(){
			if(authorPage!=4){
				var move=parseInt($("#home_authorList").css('left'))-750;
				$("#home_authorList").animate({
					left:move
				},500);
				authorPage++;
			}
		});
		
		
		//인기글
		$.ajax({
			url:"${cp}/popularArticle_hits",
			dataType: 'xml',
			success:function(data){
				var i=1;
				$(data).find("item").each(function(){
					$("#article"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
					$("#article"+(i)).css('backgroundSize', '100% 100%');
					var num=$(this).find('num').text();
					var id=$(this).find('id').text();
					var nickname=$(this).find('nickname').text();
					var title=$(this).find('title').text();
					$("#article"+(i)).click(function(){
						location.href="${cp}/feedboard_detail?num="+num;
					});
					$("#article"+(i++)).append(`
							<p>id:`+id+`</p><p>닉네임:`+nickname+`</p><p>제목:`+title+`</p>
							`);
				});
			}
		});
		
	})
	function popularHits(){
		$.ajax({
			url:"${cp}/popularArticle_hits",
			dataType: 'xml',
			success:function(data){
				var i=1;
				$(data).find("item").each(function(){
					$("#article"+(i)).empty();
					$("#article"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
					$("#article"+(i)).css('backgroundSize', '100% 100%');
					var num=$(this).find('num').text();
					var id=$(this).find('id').text();
					var nickname=$(this).find('nickname').text();
					var title=$(this).find('title').text();
					$("#article"+(i)).click(function(){
						location.href="${cp}/feedboard_detail?num="+num;
					});
					$("#article"+(i++)).append(`
							<p>id:`+id+`</p><p>닉네임:`+nickname+`</p><p>제목:`+title+`</p>
							`);
				});
			}
		});
	}
	function popularRecomm(){
		$.ajax({
			url:"${cp}/popularArticle_recomm",
			dataType: 'xml',
			success:function(data){
				var i=1;
				$(data).find("item").each(function(){
					$("#article"+(i)).empty();
					$("#article"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
					$("#article"+(i)).css('backgroundSize', '100% 100%');
					var num=$(this).find('num').text();
					var id=$(this).find('id').text();
					var nickname=$(this).find('nickname').text();
					var title=$(this).find('title').text();
					$("#article"+(i)).click(function(){
						location.href="${cp}/feedboard_detail?num="+num;
					});
					$("#article"+(i++)).append(`
							<p>id:`+id+`</p><p>닉네임:`+nickname+`</p><p>제목:`+title+`</p>
							`);
				});
			}
		});
	}
</script>

