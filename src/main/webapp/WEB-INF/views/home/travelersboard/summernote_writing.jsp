<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summernote_writing.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">
</head>
<body>
<h1>여행기 작성하기</h1>
<!-- summernote 사용하기위한 form - textarea (bootstrap처럼 name="editordata" 로 설정해준다. -->
<form method="post">
	<textarea id="summernote" name="editordata"></textarea>
</form>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 600,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,				 // 처음 사이트들어왔을때 summernote에 focus를 준다. 커서 깜빡임.
			lang: "ko-KR",				//toolbar 설명을 한글화.
			placeholder: '최대 2048자까지 쓸 수 있습니다',	//summernote에 아무것도 입력안되어있을때 보여지는 설명?
			toolbar: [
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			  ],
			callbacks: {
				onImageUpload: function(files, editor, welEditable) { // files만 파라미터로 넘겨줘도 동작하더라. 나머지는 무엇을 의미하는고..?
		            for (var i = files.length - 1; i >= 0; i--) { //파일을 여러개 등록할때  파일하나하나 서버에 올려주도록하는거같은데.. 흠.
		            	sendFile(files[i], this);	//sendFile 함수를 불러온다.
		            }
		        }
			}
		});
		//summernote 초기화 후에 초기 html값을 set 해준다.
		$('#summernote').summernote('code', '<p><img src="/spring/resources/upload/파이리dd.jpg" style="width: 600px;"><br></p>');
		
	});
	function sendFile(file, el) {	// 첨부파일 data를 ajax로 컨트롤러로 보내주는 function.
		var form_data = new FormData();	//이게 뭘 의미할까..? form으로 캡슐화시키는듯..?
      	form_data.append('file', file);	//form 캡슐 안에 file을 append해주는듯..?
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '${pageContext.request.contextPath}/sendFile',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,	//뭘까.?
        	success: function(img_name) {
          		$(el).summernote('insertImage', "${pageContext.request.contextPath}" + img_name.url); // summernote에 insertimage 해주는데 경로는 ajax로 넘어온 url로 해준다.
        	}
      	});
    }
</script>
</body>
</html>