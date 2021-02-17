<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- side.jsp -->
<style>
	li{list-style:none;}
	#profileImg img{width:100px;height:100px;border-radius: 50%;}
</style>
<div>
	<div id="feed_profile" style="border:1px solid black;text-align:center;">
		<div id="profileImg">
			<c:choose>
				<c:when test="${proVo.pfilename!=null }">
					<img src="${cp }/resources/upload/profile/${proVo.pfilename}">
				</c:when>
				<c:otherwise>
					<img src="${cp }/resources/images/profileIcon.png">
				</c:otherwise>			
			</c:choose>
		</div>
		<span style="font-weight: bold;">${proVo.nickname }</span><br>
		<p>${proVo.intro }</p>
		<span>팔로우 ${proVo.follow }</span><br>
		<span>팔로워 ${proVo.follower }</span><br>
		<c:if test="${feedId==id }">
			<a href="${cp }/editProfile">프로필수정</a>
		</c:if>
	</div>
	<h3>메뉴</h3>
	<ul>
		<c:if test="${feedId==id }">
			<li><a href="#">일기장</a></li>
		</c:if>
		<li><a href="${cp }/feedboard_feed_selectAllbyId?id=${feedId }">여행글</a></li>
		<li><a href="#">스크랩</a></li>
		<li><a href="#">경로게시판</a></li>
		<c:if test="${feedId==id }">
			<li><a href="${cp }/userInfo">내정보</a></li>
		</c:if>
	</ul>
</div>