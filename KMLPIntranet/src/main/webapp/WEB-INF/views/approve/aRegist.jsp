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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/docRegit.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var d_final_cnt;

						// 입력 버튼 클릭
						$('#btn-add-row')
								.click(
										function() {
											var arr = new Array();
											d_final_cnt = $('#d_final_cnt')
													.val();
											

											for (var i = 0; i < d_final_cnt; i++) {
												++i;
												$('#approve_table > tbody:last')
														.append(
																'<tr><th style="height: 40px; background-color:beige;">'
																		+ i
																		+ '</th>'
																		+ '<td colspan="2"><input name="a_id_arr[]" id="add"></td></tr>');

												event.preventDefault();
												--i;
											}

										});

						// 초기화 버튼 클릭			
						$('#btn-delete-row').click(function() {
							$('#approve_table > tbody:last > tr').remove();
							event.preventDefault();
						});
					});
	
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
		if(!document.form.d_title.value || !document.form.d_content.value){	 
			alert("공란을 입력하시오.")
		} else {
			if(confirm("등록 하시겠습니까?")){
				document.form.submit();
			}
		}
	};
	
	//현재날짜 가져오기
    function autoDate () {
        var tDay = new Date();
        var tMonth = tDay.getMonth()+1;
        var tDate = tDay.getDate();
        if ( tMonth < 10) tMonth = "0"+tMonth;
        if ( tDate < 10) tDate = "0"+tDate;
        document.getElementById("d_date").value = tDay.getFullYear()+"년 "+tMonth+"월 "+tDate+"일";
    }

    function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func;
    } else {
        window.onload = function() {
        if (oldonload) {
            oldonload();
        }
        func();
        }
    }
    }

    addLoadEvent(function() {
    autoDate();
    });
</script>
</head>

<body>
	<div id="regit">
		<h3 style="margin-top: 20px;">일일업무보고</h3>
		<hr>
		<sf:form action="${path}/approve/aRegist.do" name="form" id="form" method="post">
			<table align="center" id="approve_table">
				<!-- 결재란 start -->
				<tr>
					<th style="width: 100px; height: 34px; background-color: beige;"></th>
				</tr>
				<tr>
					<td style="height: 90px"></td>
				</tr>
				<!-- 결재란 end -->

				<!-- 문서내용 start -->
				<tr colsapn="4" style="height: 20px;">
				</tr>
				<tr>
					<th colspan="4" style="font-size: 2em; height: 100px;">일일 업무 일지</th>
				</tr>

				<tr>
					<th style="width: 110px; height: 40px; background-color: beige;">문서번호</th>
					<td style="width: 180px"><input type="text" name="d_num" id="d_num"></td>
					<th style="width: 110px; background-color: beige;">작성일자</th>
					<td style="width: 180px"><input type="text" name="d_date" id="d_date"></td>
				</tr>
				<tr>
					<th style="height: 40px; background-color: beige;">부 서 명</th>
					<td style="width: 180px"><input type="text" name="d_dept" id="d_dept"></td>
					<th style="background-color: beige;">작성자(사번)</th>
					<td style="width: 180px"><input type="text" name="d_id" id="d_id" value="${m_id}" readonly="readonly"></td>
				</tr>
				<tr>
					<th style="height: 40px; background-color: beige;">제&emsp;목</th>
					<td colspan="3"><input type="text" name="d_title" id="d_title"></td>
				</tr>
				<tr>
					<th style="height: 250px; background-color: beige;">금 일<br><br>업무내용
					</th>
					<td colspan="3"><textarea name="d_content" id="d_content" style="resize: none;"></textarea></td>
				</tr>
				<tr colsapn="4" style="height: 20px;">
				</tr>
				<!-- 문서내용 start -->

				<!-- 결재단계 설정 및 추가 start -->
				<tr>
					<th style="height: 40px; background-color: beige;">총결재횟수</th>
					<td colspan="2"><input name="d_final_cnt" id="d_final_cnt"></td>
					<td><button id='btn-add-row'>입 력</button>&emsp;
						<button id='btn-delete-row'>초기화</button></td>
				</tr>
				<tbody></tbody>
				<!-- 결재단계 설정 및 추가 end -->
			</table>
			<br>
			
			<div class="w3-center">
				<div class="btn-group">
				    <button type="button" id="button_doc" class="btn btn-primary" onclick="check_regist();">등&nbsp;록</button>
				    <button type="button" id="button_doc" class="btn btn-primary" onclick="check_reset();">초기화</button>
				    <button type="button" id="button_doc" class="btn btn-primary" onclick="check_cancel();">취&nbsp;소</button>
				</div>
				<br><br><div style="color: red;">${message}</div>
			</div>
			
<!-- 			<div class="w3-center"> -->
<!-- 				<input type="button" value="등&nbsp;록" onclick="check_regist();"> -->
<!-- 				&emsp;&emsp; -->
<!-- 				<input type="button" value="초기화" onclick="check_reset();"> -->
<!-- 				&emsp;&emsp; -->
<!-- 				<input type="button" value="취&nbsp;소" onclick="check_cancel();"> -->
<!-- 			</div> -->
		</sf:form>
	</div><br>
</body>
</html>