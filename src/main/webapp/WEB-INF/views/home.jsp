<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<!-- home.jsp -->
<style>
	#home_search{width:700px;margin:50px auto;}
	#home_recommAuthor{width:1000px;margin:50px auto;}
	#home_popularArticle{width:1000px;margin:50px auto;}
	#home_popularPlace{width:1000px;margin:50px auto;}
	li{list-style: none;}
	#home_authorList li{display:inline-block;}
	#home_articleList li{display: inline-block;}
	#home_placeList li{display: inline-block;}
	.authorDiv{width:230px;height:230px; margin-left:10px;margin-right:10px; background-color: lightgreen;}
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
    	<ul>
    		<li>추천작가 <img src="${cp }/resources/images/refreshIcon.png" class="btnIcon" style="width:17px;height:15px;"></li>
    		<li>
    			<ul id="home_authorList">
    				<li>
    					<img src="${cp }/resources/images/leftArrowIcon.png"  class="btnIcon"
    						style="width:110px;height:110px;position:relative;top:-65px;">
    				</li>
    				<li>
    					<div class="authorDiv" id="author1"></div>
    				</li>
    				<li>
    					<div class="authorDiv" id="author2"></div>
    				</li>
    				<li>
    					<div class="authorDiv" id="author3"></div>
    				</li>
    				<li>
    					<img src="${cp }/resources/images/rightArrowIcon.png"  class="btnIcon"
    						style="width:110px;height:110px;position:relative;top:-65px;">
    				</li>
    			</ul>
    		</li>
    	</ul>
    </div>
    <div id="home_popularArticle">
    	<ul>
    		<li>
    			인기글 <a href="#" class="aHover">조회</a><a href="#" class="aHover">추천</a>
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
	})
</script>

