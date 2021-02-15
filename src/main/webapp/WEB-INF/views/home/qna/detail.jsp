<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
<table border="1" width="500">
	<tr>
		<td>글번호</td><td>${vo.num }</td>
	</tr>
	<tr>
		<td>작성자</td><td>${vo.id }</td>
	</tr>
	<tr>
		<td>제목</td><td>${vo.title }</td>
	</tr>
	<tr>
		<td>내용</td><td><div style='width:300px;height: 200px;'>${vo.content }</div></td>
	</tr>
	<tr>
		<td>조회수</td><td>${vo.hits }</td>
	</tr>
	<tr>
		<td>작성일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.adddate }"/></td>
	</tr>
</table>

<c:if test="${sessionScope.id==vo.id || sessionScope.id=='admin'}">

<div>
		<a href="${cp }/qna/delete?num=${vo.num}">삭제</a>
		<a href="${cp }/qna/update?num=${vo.num}">수정</a>
</div>
</c:if>

답글목록
<div id="commList">

</div>


<div id="commAdd">
		<input type="hidden" value="${vo.num }" id="commnum">
		답글 <textarea rows="1" cols="40" id="comments"></textarea>
		<input type="button" value="등록" id="addBtn">
</div>
<script type="text/javascript">
$(function(){
	$("#addBtn").click(function(){
		var commnum=$("#commnum").val();
		var comments=$("#comments").val();
		var test="${cp}/qna/commlist";
		console.log(test);
		$.getJSON('${cp}/qna/commm',{"comments":comments,"commnum":commnum},function(data){//1.주소2.파라미터를보내는 값
			if(data.code=='success'){
                getList();
            }else if(data.code=='fail'){
                alert("ERROR");
            }
		});
	});
});
function getList(){
	var commnum=$("#commnum").val();
	$.getJSON('${cp}/qna/commlist',{"commnum":commnum},function(data){//컨트롤러에서 제공한 내용을 data로받는다.
		//delComm();
		$("#commList").empty();//기존에 있는 div요소를 삭제한다.(초기화)
		console.log(data.comments);		
		var str=data.comments;
		$("#commList").append(str);
				
	});
}
getList();//목록이 바로 실행되어야해서 


</script>
</body>
</html>