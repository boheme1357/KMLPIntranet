<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div#wapper body {
    background: #fafafa url(https://jackrugile.com/images/misc/noise-diagonal.png);
    color: #444;
    font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
    text-shadow: 0 1px 0 #fff;
}

div#wapper strong {
    font-weight: bold; 
}

div#wapper em {
    font-style: italic; 
}

div#wapper table {
    background: #f5f5f5;
    border-collapse: separate;
    box-shadow: inset 0 1px 0 #fff;
    font-size: 14px;
    line-height: 24px;
    margin: 30px auto;
    text-align: center;
    width: 800px;
}   

div#wapper th {
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
    border-left: 1px solid #555;
    border-right: 1px solid #777;
    border-top: 1px solid #555;
    border-bottom: 1px solid #333;
    box-shadow: inset 0 1px 0 #999;
    color: #fff;
  	font-weight: bold;
    padding: 10px 15px;
    position: relative;
    text-shadow: 0 1px 0 #000; 
    text-align: center; 
}

div#wapper th:after {
    background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
    content: '';
    display: block;
    height: 25%;
    left: 0;
    margin: 1px 0 0 0;
    position: absolute;
    top: 25%;
    width: 100%;
}

div#wapper th:first-child {
    border-left: 1px solid #777;    
    box-shadow: inset 1px 1px 0 #999;
}

div#wapper th:last-child {
    box-shadow: inset -1px 1px 0 #999;
}

div#wapper td {
    border-right: 1px solid #fff;
    border-left: 1px solid #e8e8e8;
    border-top: 1px solid #fff;
    border-bottom: 1px solid #e8e8e8;
    padding: 10px 15px;
    position: relative;
    transition: all 300ms;
}

div#wapper td:first-child {
    box-shadow: inset 1px 0 0 #fff;
}   

div#wapper td:last-child {
    border-right: 1px solid #e8e8e8;
    box-shadow: inset -1px 0 0 #fff;
}   

div#wapper tr {
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png); 
}

div#wapper tr:nth-child(odd) td {
    background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png); 
}

div#wapper tr:last-of-type td {
    box-shadow: inset 0 -1px 0 #fff; 
}

div#wapper tr:last-of-type td:first-child {
    box-shadow: inset 1px -1px 0 #fff;
}   

div#wapper tr:last-of-type td:last-child {
    box-shadow: inset -1px -1px 0 #fff;
}   

div#wapper tbody:hover td {
    color: transparent;
    text-shadow: 0 0 3px #aaa;
}

div#wapper tbody:hover tr:hover td{
    color: #444;
    text-shadow: 0 1px 0 #fff;
}

#button{

}


</style>
</head>
<div id="wapper" class="w3-center">
<body>

<h2>공&nbsp;지&nbsp;사&nbsp;항</h2>

<form action="register">
<table border="1" width="100%">
   <tr>
      <th width="15%">일련번호</th>
      <th width="15%">사&emsp;번</th>
      <th width="30%">제&emsp;목</th>
      <th width="15%">첨부파일</th> 
      <th width="25%">작 성 일 자</th>        
   </tr>
   
   <c:forEach var="row" items="${list}">
   <tr>
      <!--공지사항 상세조회를 위해 a태그 추가  -->
      <td><a href="${path}/notice/nContent.do?n_num=${row.n_num}">${row.n_num}</a></td>
      <td>${row.n_id}</td>
      <td>${row.n_title}</td>
      <td>${row.n_file}</td> 
      <td>${row.n_wdate}</td>           
   </tr>
   </c:forEach>
</table>
<input type="button" id="button" value="공지사항등록" onclick="location.href='${path}/notice/nRegist.do'">
</form>
</body>
</div>
</html>