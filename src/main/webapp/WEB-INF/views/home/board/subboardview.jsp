<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<div>
    ${vo.toString()}
    <br>num : ${vo.num}
    <br>id : ${vo.id}
    <br>title : ${vo.title}
    <br>content : ${vo.content}
    <br>adddate : ${vo.adddate}
    <!-- <br>recommend : ${vo.recommend} -->
    <br>hits : ${vo.hits}
    <br>cname : ${vo.cname}
    <div>
        <p>recomm by me?</p>
        <div id="myrecomm">
            추천수: <span id="recommend"></span>
            <button id="tglrecomm" class="btn"></button>
        </div>
    </div>
</div>
<script type="text/javascript">
    let recommend = '${vo.recommend}';
    $('#recommend').text(recommend);
    $.getJSON("${cp }/board/${cname }/article/${vo.num}/recomm",
        function (response) {
            if (response.value=='1') $('#tglrecomm').text('recomm_down');
            else $('#tglrecomm').text('recomm_up');
        }
    );
    $('#tglrecomm').on('click', function(){
        // console.log('tglrecomm='+$('#tglrecomm').text());
        // $.ajax({
        //     url: "${cp }/board/${cname }/article/${vo.num}/recomm",
        //     data: {tglrecomm: $('#tglrecomm').text()},
        //     dataType: "json",
        //     beforeSend: function(jqXHR, settings) {
        //         console.log(settings.url);
        //     },

        //     success: function (response) {
        //         console.log(response);
        //     if (response.value=='1') $('#tglrecomm').text('recomm_down');
        //     else $('#tglrecomm').text('recomm_up');
        //     }
        // });
        
        $.getJSON("${cp }/board/${cname }/article/${vo.num}/recomm", {tglrecomm: $('#tglrecomm').text()}, 
            function (response) {
                console.log(response);
                if (response.value=='1') $('#tglrecomm').text('recomm_down');
                else $('#tglrecomm').text('recomm_up');
                $('#recommend').text(parseInt(recommend)+(response.value));
            }
        );
    })
</script>