<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="board" value="${cp }/board/${cname}" />
<c:forEach items='${fields}' var='field'>
    <c:if test='${field=="id" }'><c:set var="fieldid" value="checked='checked'" /></c:if>
    <c:if test='${field=="title" }'><c:set var="fieldtitle" value="checked='checked'" /></c:if>
    <c:if test='${field=="content" }'><c:set var="fieldcontent" value="checked='checked'" /></c:if>
</c:forEach>
<!-- 테스트용 드랍다운 -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<!--테스트용 부트스트랩 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://unpkg.com/@tabler/core@latest/dist/js/tabler.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/@tabler/core@latest/dist/css/tabler.min.css">
<div>
    <div class="card">
        <div class="card-header">
            TODO:tableintro
        </div>
        <form action="${board}" method="get">
            <div class="card-body">
                <div class="d-flex">
                    <!-- tabledoption & search -->
                    <div class="text-muted">
                        <!-- tableoption -->
                        글
                        <div class="mx-2 d-inline-block">
                            <input type="text" name="listSize" value="${pu.listSize}" size="3">
                            <input type="hidden" name="pageSize" value="${pu.pageSize}">
                        </div>
                        개
                    </div>
                    <div class="ms-auto d-flex">
                        <!-- 검색조건 설정 -->
                        search: 
                        <div class="form-selectgroup">
                            <label class="form-selectgroup-item">
                                <input type="checkbox" name="field" value="id" ${fieldid} class="form-selectgroup-input">
                                <span class="form-selectgroup-label">id</span>
                            </label>
                            <label class="form-selectgroup-item">
                                <input type="checkbox" name="field" value="title" ${fieldtitle} class="form-selectgroup-input">
                                <span class="form-selectgroup-label">title</span>
                            </label>
                            <label class="form-selectgroup-item">
                                <input type="checkbox" name="field" value="content" ${fieldcontent} class="form-selectgroup-input">
                                <span class="form-selectgroup-label">content</span>
                            </label>
                        </div>
                        <div class="row g-2">
                            <div class="col input-group input-group-flat">
                                <input type="text" name="keyword" class="form-control form-control-sm" autocomplete="off" value="${keyword}" placeholder="search">
                                <span class="input-group-text">
                                    <a href="#" class="link-secondary" title="clear search" data-bs-toggle="tooltip" data-bs-original-title="Clear search">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </a>
                                    <!-- <button type="re" class="link-secondary" title="clear search" data-bs-toggle="tooltip" data-bs-original-title="Clear search">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </button> -->
                                </span>
                            </div>
                            <div class="col-auto">
                                <!-- <a href="#" class="btn btn-white btn-icon" aria-label="Button"> -->
                                <button type="submit" class="btn btn-white btn-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
                                </button>
                                <!-- </a> -->
                            </div>
                            <!-- <button type="submit" class="btn ms-auto">search</button> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- <input type="button" name="test" value="test"> -->
            <div class="table-responsive">
                <table class="table card-table table-vcenter text-nowrap datatable">
                    <caption class="hidden">subboard</caption>
                    <colgroup span="1"></colgroup>
                    <colgroup span="3"></colgroup>
                    <colgroup span="2"></colgroup>
                    <colgroup span="1"></colgroup>
                    <thead>
                        <tr>
                            <th>num</th>
                            <th>cname</th>
                            <th>title</th>
                            <th>id</th>
                            <th>hits</th>
                            <th>recommand</th>
                            <th>adddate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="vo">
                            TODO:아이디 눌러서 검색
                            <tr>
                                <td>${vo.num}</td>
                                <td>${vo.cname}</td>
                                <td>${vo.title}</td>
                                <td class="dropdown">
                                    <a href='#' class="btn dropdown-toggle">
                                        ${vo.id}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" style="margin: 0px;">
                                        <a class="dropdown-item" href="#">
                                            Action
                                        </a>
                                        <a class="dropdown-item" href="#">
                                            Another action
                                        </a>
                                    </div>
                                </td>
                                <td>${vo.hits}</td>
                                <td>${vo.recommand}</td>
                                <td>${vo.adddate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card-footer d-plex align-items-center">
                <p>Showing ${pu.startPage} to ${pu.endPage} of ${pu.pageCount} entries </p>
                <ul class="pagination m-0 ms-auto">
                    <c:choose>
                        <c:when test="${pu.startPage==1 }">
                            <li class="page-item disabled">
                                <!-- TODO: disabled 클래스 삽입 -->
                                <a href="#" aria-disabled="true" class="page-link">prev</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a href="${board }/${pu.startPage-1}" class="page-link">prev</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${pu.startPage}" end="${pu.endPage}">
                        <c:choose>
                            <c:when test="${pu.page==p }">
                                <!-- TODO:현재글 강조 -->
                                <li class="page-item active"><a href="${board }/${p }" class="page-link">${p }</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="${board }/${p }" class="page-link">${p }</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pu.endPage eq pu.pageCount }">
                            <li class="page-item disabled">
                                <!-- TODO: disabled 클래스 삽입 -->
                                <a href="#" aria-disabled="true" class="page-link">next</a>
                            </li class="page-item">
                        </c:when>
                        <c:otherwise>
                            <li><a href="${board }/${pu.endPage+1}" class="page-link">next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <button class="btn">
                    <a href=""></a>
                    글쓰기
                </button>
            </div>
        </form>
    </div>
    <!-- <sec:authorize access="isAuthenticated()">
        <sec:authorize access="hasRole('ROLE_MEMBER')" >
        </sec:authorize>
    </sec:authorize> -->
</div>
<!-- listSize=10&pageSize=10&field=content&keyword= -->
<!-- field=content& -->
<script type="text/javascript">
    // let fieldarr = [];

    // let reusedparam='?';
    // <c:forEach items='${fields}' var='field'>
    //     fieldarr.push('${field}');
    //     reusedparam+='field='+'${field}&';
    // </c:forEach>

    //jstl에서 처리
    // $('input[name="field"]').each((i, e)=>{
    //     fieldarr.forEach(elem=> {if ($(e).val()==elem) $(e).attr('checked', true);});
    // });
    
    // let listSize = $('input[name=listSize]').val();
    // let keyword = $('input[name=keyword]').val();
    // reusedparam+='keyword='+keyword+'&listSize=${pu.listSize}&pageSize=${pu.pageSize}';
    // let pageSize = $('input[name=pageSize]').val();
    // let reusedparam = '?'+fi+'keyword='+keyword+'listSize='+listSize+'&pageSize='+pageSize;
    // $('input[value=test]').on('click', function(){
    //     console.log(reusedparam);
    // });
    $('.page-link').each((i, e)=>{$(e).attr('href', $(e).attr('href')+'${beforeparams}');})
    $('a[title="clear search"]').on('click', function(){
        $('input[name="keyword"]').val('');
        $('input[name="field"]').each((i, e)=>{
            $(e).attr('checked', false);
        });
    });
</script>