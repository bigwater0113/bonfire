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
	.placeDiv{width:300px;height:300px; margin-left:10px;margin-right:10px; background-color: lightblue;}
	.btnIcon{opacity:0.5;}
	.btnIcon:hover{opacity:1;}
	.aHover{color:#aaaaaa;text-decoration:none; }
	.aHover:hover{color:black;}
	#home_mask{
		position:absolute;
		z-index:9000;
		left:0px;
		top:0px;
		background-color:black;
		opacity: 0.6;
		display:none;
	}
	#home_searchResult{position:absolute;z-index:9999;left:0px;top:0px; text-align:center;
			width:750px;height:400px;background-color:#cccccc;display:none;}
	.resultDiv{margin-left:10px;margin-right:10px;margin-top:10px;}
	#leftResult{background-color: red;width:180px;height:250px;
		position:absolute;left:20px;top:65px;}
	#leftResultBack{background-color: black;width:180px;height:250px;
		position:absolute;left:20px;top:65px;display:none;}
	#centerResult{background-color: green;width:230px;height:380px;
		position:absolute;left:250px;top:0px;}
	#rightResult{background-color: blue;width:180px;height:250px;
		position:absolute;left:530px;top:65px;}
	#rightResultBack{background-color: black;width:180px;height:250px;
		position:absolute;left:530px;top:65px;display:none;}
</style>
<div id="home_wrap">
	<div id="home_mask">
	</div>
	<div id="home_searchResult">
		<img src="${cp }/resources/images/leftArrowIcon.png"  class="btnIcon" id="resultLeft"
						style="width:50px;height:50px;position:absolute;left:0px;top:170px;;z-index:10000">
		<img src="${cp }/resources/images/rightArrowIcon.png"  class="btnIcon" id="resultRight"
						style="width:50px;height:50px;position:absolute;left:700px;top:170px;z-index:10000">
		<div class="resultDiv" id="leftResultBack">
		</div>
		<div class="resultDiv" id="leftResult">
			<img src="${cp }/resources/images/profileIcon.png" id="leftProfile"
				style="width:150px;height:150px;border-radius: 50%;margin-top:50px;">
		</div>
		<div class="resultDiv" id="centerResult">
			<img src="${cp }/resources/images/profileIcon.png" id="centerProfile"
				style="width:150px;height:150px;border-radius: 50%;margin-top:50px;margin-bottom:10px;">
			<div id="centerDetail" style="text-align: center;width:100%;height:100px;background-color: yellow;">
				<h2></h2><h3></h3>
			</div>
		</div>
		<div class="resultDiv" id="rightResult">
			<img src="${cp }/resources/images/profileIcon.png" id="rightProfile"
				 style="width:150px;height:150px;border-radius: 50%;margin-top:50px;">
		</div>
		<div class="resultDiv" id="rightResultBack">
		</div>
	</div>
    <div id="home_search">
    	<form>
    		<select name="field">
    			<option value="author">작가</option>
    		</select>
	    	<input type="text" name="keyword" style="width:500px;" id="searchKeyword"><a href="javascript:popupDiv()">검색</a>
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
	var slideNum_g;
	var Cnt;
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();
	$(window).resize(function(){
		windowWidth = $(window).width();
		windowHeight = $(window).height();
		$("#home_mask").css('width',windowWidth).css('height',windowHeight);
		$("#home_searchResult").css('left',windowWidth/2-350)
		.css('top',windowHeight/2-250);
	});
	
	$(function(){
		var errorMsg="${errorMsg}";
		if(errorMsg!=''){
			alert(errorMsg);
		}
		var authorPage=1;
		
		// resultDiv Right 버튼
		$("#resultRight").click(function(){
			$("#centerDetail").hide();
			$("#leftResult").fadeOut(1000);
			$("#centerResult").animate({
				width:180,
				height:250,
				left:20,
				top:65
			},1000,function(){
				$.ajax({
					url:"${cp}/searchAuthor.json",
					data:{
						slideNum:slideNum_g+1,
						keyword:$("#searchKeyword").val()
					},
					dataType: 'json',
					success:function(data){
						slideNum_g=$(data)[0].slideNum;
						if(slideNum_g!=Cnt){
							$("#resultLeft").show();
							let pfilenameL=$(data)[0].list[0].pfilename;
							let idL=$(data)[0].list[0].id;
							let nicknameL=$(data)[0].list[0].nickname;
							let pfilenameC=$(data)[0].list[1].pfilename;
							let idC=$(data)[0].list[1].id;
							let nicknameC=$(data)[0].list[1].nickname;
							let pfilenameR=$(data)[0].list[2].pfilename;
							let idR=$(data)[0].list[2].id;
							let nicknameR=$(data)[0].list[2].nickname;
							$("#leftProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameL);
							$("#leftResult h2").html(idL);
							$("#leftResult h3").html(nicknameL);
							$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
							$("#centerResult h2").html(idC);
							$("#centerResult h3").html(nicknameC);
							$("#rightProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameR);
							$("#rightResult h2").html(idR);
							$("#rightResult h3").html(nicknameR);
						}else{
							let pfilenameL=$(data)[0].list[0].pfilename;
							let idL=$(data)[0].list[0].id;
							let nicknameL=$(data)[0].list[0].nickname;
							let pfilenameC=$(data)[0].list[1].pfilename;
							let idC=$(data)[0].list[1].id;
							let nicknameC=$(data)[0].list[1].nickname;
							$("#leftProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameL);
							$("#leftResult h2").html(idL);
							$("#leftResult h3").html(nicknameL);
							$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
							$("#centerResult h2").html(idC);
							$("#centerResult h3").html(nicknameC);
							$("#resultRight").hide();
						}
						$("#centerResult").css({
							width:230,
							height:380,
							left:250,
							top:0
						});
					}
				});
				$("#leftResult").show();
				$("#centerDetail").show();
				
			});
			$("#rightResult").animate({
				width:230,
				height:380,
				left:250,
				top:0
			},1000,function(){
				$("#rightResult").css({
					width:180,
					height:250,
					left:530,
					top:65
				});
				$("#rightResultBack").hide();
				
			});
			$("#rightResultBack").fadeIn(1000);
			console.log(slideNum_g);
			console.log(slideNum_g+1);
			
		});
		// resultDiv Left 버튼
		$("#resultLeft").click(function(){
			$("#centerDetail").hide();
			$("#rightResult").fadeOut(1000);
			$("#centerResult").animate({
				width:180,
				height:250,
				left:530,
				top:65
			},1000,function(){
				$.ajax({
					url:"${cp}/searchAuthor.json",
					data:{
						slideNum:slideNum_g-1,
						keyword:$("#searchKeyword").val()
					},
					dataType: 'json',
					success:function(data){
						slideNum_g=$(data)[0].slideNum;
						if(slideNum_g!=1){
							$("#resultRight").show();
							let pfilenameL=$(data)[0].list[0].pfilename;
							let idL=$(data)[0].list[0].id;
							let nicknameL=$(data)[0].list[0].nickname;
							let pfilenameC=$(data)[0].list[1].pfilename;
							let idC=$(data)[0].list[1].id;
							let nicknameC=$(data)[0].list[1].nickname;
							let pfilenameR=$(data)[0].list[2].pfilename;
							let idR=$(data)[0].list[2].id;
							let nicknameR=$(data)[0].list[2].nickname;
							$("#leftProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameL);
							$("#leftResult h2").html(idL);
							$("#leftResult h3").html(nicknameL);
							$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
							$("#centerResult h2").html(idC);
							$("#centerResult h3").html(nicknameC);
							$("#rightProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameR);
							$("#rightResult h2").html(idR);
							$("#rightResult h3").html(nicknameR);
						}else{
							let pfilenameC=$(data)[0].list[0].pfilename;
							let idC=$(data)[0].list[0].id;
							let nicknameC=$(data)[0].list[0].nickname;
							let pfilenameR=$(data)[0].list[1].pfilename;
							let idR=$(data)[0].list[1].id;
							let nicknameR=$(data)[0].list[1].nickname;
							$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
							$("#centerResult h2").html(idC);
							$("#centerResult h3").html(nicknameC);
							$("#rightProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameR);
							$("#rightResult h2").html(idR);
							$("#rightResult h3").html(nicknameR);
							$("#leftResult").hide();
							$("#resultLeft").hide();
						}
					}
				});
				$("#centerDetail").show();
				$("#rightResult").show();
				$("#centerResult").css({
					width:230,
					height:380,
					left:250,
					top:0
				});
			});
			$("#leftResult").animate({
				width:230,
				height:380,
				left:250,
				top:0
			},1000,function(){
				$("#leftResult").css({
					width:180,
					height:250,
					left:20,
					top:65
				});
				$("#leftResultBack").hide();
				
			});
			$("#leftResultBack").fadeIn(1000);
			
		});
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
	
	//search버튼 누를시 function
	function popupDiv(){
		$("#home_mask").css('width',windowWidth).css('height',windowHeight)
		.css('display','block')
		.click(function(){
			$(this).css('display','none');
			$("#home_searchResult").css('display','none');
// 			$("#home_searchResult").empty().css('display','none');
		});
		$("#home_searchResult").css('left',windowWidth/2-350)
		.css('top',windowHeight/2-250).css('display','block');
		$.ajax({
			url:"${cp}/searchAuthor.json",
			data:{
				slidesNum:1,
				keyword:$("#searchKeyword").val()
			},
			dataType: 'json',
			success:function(data){
				$("#resultLeft").show();
				$("#resultRight").show();
				slideNum_g=$(data)[0].slideNum;
				Cnt=$(data)[0].Cnt;
				if(Cnt==0){
					$("#home_searchResult").hide();
					alert("해당회원이 존재하지않습니다.");
				}else if(Cnt!=1){
					$("#resultLeft").hide();
					$("#leftResult").hide();
					let pfilenameC=$(data)[0].list[0].pfilename;
					let idC=$(data)[0].list[0].id;
					let nicknameC=$(data)[0].list[0].nickname;
					let pfilenameR=$(data)[0].list[1].pfilename;
					let idR=$(data)[0].list[1].id;
					let nicknameR=$(data)[0].list[1].nickname;
					$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
					$("#centerResult h2").html(idC);
					$("#centerResult h3").html(nicknameC);
					$("#rightProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameR);
					$("#rightResult h2").html(idR);
					$("#rightResult h3").html(nicknameR);
				}else{
					$("#resultLeft").hide();
					$("#resultRight").hide();
					$("#leftResult").hide();
					$("#rightResult").hide();
					let pfilenameC=$(data)[0].vo.pfilename;
					let idC=$(data)[0].vo.id;
					let nicknameC=$(data)[0].vo.nickname;
					$("#centerProfile").prop("src","${cp}/resources/upload/profile/"+pfilenameC);
					$("#centerResult h2").html(idC);
					$("#centerResult h3").html(nicknameC);
				}
			}
		});
	}
	
	
	//인기글 조회수별 새로고침
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
	//인기글 추천수 별 새로고침
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
	
	//인기여행지 (해당카테고리 글 갯수 기준)
	$.ajax({
		url:"${cp}/popularPlace",
		dataType: 'xml',
		success:function(data){
			var i=1;
			$(data).find("item").each(function(){
				$("#place"+(i)).css('backgroundImage', 'url(${cp}/resources/images/bonfire_logo.png)');
				$("#place"+(i)).css('backgroundSize', '100% 100%');
				var cname=$(this).find('cname').text();
				var cnamecnt=$(this).find('cnamecnt').text();
				$("#place"+(i)).click(function(){
					location.href="#";
				});
				$("#place"+(i++)).append(`
						<p>cname:`+cname+`</p><p>cnamecnt:`+cnamecnt+`</p>
						`);
			});
		}
	});
</script>

