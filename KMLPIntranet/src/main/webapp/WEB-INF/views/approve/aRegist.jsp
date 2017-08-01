<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재 서류 등록</title>
</head>
<body>



	<h2>일일업무보고</h2>
	<sf:form action="${path}/approve/aRegist.do" name="form" method="post" id='form'>

		<table border="1" width="400px">
			
			<tr>
				<td>작성자(id)</td>
				<td><input name="d_id" value='${m_id}' readonly="readonly"></td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input name="d_title"></td>
			</tr>


			<tr>
				<td>내용</td>
				<td><input name="d_content"></td>
			</tr>

			<tr>
				<td>총결재횟수</td>
				<td><input name="d_final_cnt" id='d_final_cnt'>
					<button id='btn-add-row'>입력</button>
					<button id='btn-delete-row'>초기화</button></td>
			</tr>

			

			<!-- 결재 단계 설정 테이블 -->
			<table border="1" width="400px" id='approve_table'>
				<tbody></tbody>
			</table>


			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="reset" value="취소">
			</tr>


		</table>
		<!-- 결재 단계 테이블 행 추가 스크립트 -->
		<script src="//code.jquery.com/jquery.min.js"></script>
		<script>
			$(document).ready(
					function() {
						
						var d_final_cnt;
						
						// 입력 버튼 클릭
						$('#btn-add-row').click(
								function() {
									var arr = new Array();
									d_final_cnt = $('#d_final_cnt').val();
									var time = new Date().toLocaleTimeString();
										
									for(var i=0 ; i<d_final_cnt ; i++){
										++i;
											$('#approve_table > tbody:last').append(
												'<tr><td><input name="a_cnt+'+i+'" value="'+i+'" readonly="readonly" size="1" style="text-align: center;"></td>'
												+
												'<td><input name="a_id_arr[]"></td></tr>'
											);
											
										event.preventDefault();
										--i;
									}
											
									});
									
						// 초기화 버튼 클릭			
						$('#btn-delete-row').click(
								function() {
									$('#approve_table > tbody:last > tr')
											.remove();
									event.preventDefault();
								});
						
						// 확인 버튼 클릭
						$('#form').submit(function() {
							
							
						});

					});
		</script>

	</sf:form>












</body>
</html>