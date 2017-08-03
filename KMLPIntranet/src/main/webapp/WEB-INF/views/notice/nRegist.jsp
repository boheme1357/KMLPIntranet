<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
//초기화버튼 이벤트
function check_reset(){
	if(confirm("초기화 하시겠습니까?")){
		document.form.reset();
	}
}

//취소버튼 이벤트
function check_cancel(){
	if(confirm("취소 하시겠습니까?")){
		history.back();
	}
}

//등록버튼 이벤트
function check_regist(){
	if(confirm("등록 하시겠습니까?")){
		document.form.submit();
	}
}
</script>
</head>

<body>
<div id="wapper">
<h3>공지사항&nbsp;등록</h3>
<hr>
<sf:form action="${path}/notice/nRegist.do" name="form" method="post">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<!--  일련번호, 작성일자는  default값으로 자동추가
	<tr>
		<td>일련번호</td>
		<td><input name="n_num"></td>
	</tr>
	
	
	<tr>
		<td>작성일자</td>
		<td><input name="n_wdate"></td>
	</tr> 
	
	-->

	<tr>
		<th width="15%">사&emsp;번</th>
		<td><input name="n_id"   value = '${m_id}' readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th>제&emsp;목</th>
		<td><input name="n_title" class="w3-animate-input w3-left" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th height="400px">내&emsp;용</th>
		<td><textarea name="n_content"></textarea></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td><input type="file" name="n_file"></td>
	</tr>

</table>
<div class="w3-center">
	<div class="btn-group">
	    <button type="button" id="button" class="btn btn-primary" onclick="check_regist();">등&nbsp;록</button>
	    <button type="button" id="button" class="btn btn-primary" onclick="check_reset();">초기화</button>
	    <button type="button" id="button" class="btn btn-primary" onclick="check_cancel();">취&nbsp;소</button>
	</div>
	<br><br><div style="color: red;">${message}</div>
</div>

<!-- <div class="w3-center"> -->
<!-- 	<input type="button" id="button" class="w3-btn w3-round-large" value="등&nbsp;록" onclick="check_regist();"> -->
<!-- 	&emsp;&emsp; -->
<!-- 	<input type="button" id="button" class="w3-btn w3-round-large" value="초기화" onclick="check_reset();"> -->
<!-- 	&emsp;&emsp; -->
<!-- 	<input type="button" id="button" class="w3-btn w3-round-large" value="취&nbsp;소" onclick="check_cancel();"> -->
<!-- </div> -->
</sf:form>
</div>
</body>
</html>