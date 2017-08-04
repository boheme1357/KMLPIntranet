<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/list.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
a:link {
   text-decoration: none;
}

a:visited {
   text-decoration: none;
}

a:hover {
   text-decoration: none;
}

a:active {
   text-decoration: none;
}
</style>


<script>
     // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/notice/nList.do?curPage="+page;
    }
</script>




</head>

<body>
   <div id="wapper">
      <h3>공지사항&nbsp;리스트</h3>
      <hr>
      <sf:form action="register">

         <table border="1" width="100%">
            <tr>
             <th width="5%">일련번호</th>
               <th width="10%">사&emsp;번</th>
               <th width="50%">제&emsp;목</th>
               <th width="10%">첨부파일</th>
               <th width="10%">작 성 일 자</th>
               <th width="6%">조회횟수</th>
            </tr>

            <c:forEach var="row" items="${map.list}">
               <tr>
                  <!--공지사항 상세조회를 위해 a태그 추가  -->
                  <td>${row.n_num}</td>
                  <td>${row.n_id}</td>
                  <td><a href="${path}/notice/nContent.do?n_num=${row.n_num}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.n_title}</a></td>
                  <td>${row.n_file}</td>
                  <td>${row.n_wdate}</td>
                  <td>${row.n_viewcnt}</td>
               </tr>
            </c:forEach>
         </table>
         
         
         
<div align="center">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
           

</div>
         
         
         <br>
         <br>
         
         <div class="w3-center">
            <input type="button" id="button" class="btn btn-primary" value="공지사항 등록" onclick="location.href='${path}/notice/nRegist.do'">
         </div>
      </sf:form>
   </div>
</body>
</html>