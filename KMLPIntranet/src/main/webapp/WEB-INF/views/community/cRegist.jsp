<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
 <!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
hr {
	border: solid 0.5px lightgray;
}

button {
	width: 120px;
	height: 40px;
}
</style>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">커뮤니티 등록</h3>
					<hr>
				</div>
				<!-- /.box-header -->

				<form:form role="form" action="cRegist.do" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제&nbsp;목</label> <input type="text"
								name='title' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내&nbsp;용</label>
							<textarea class="form-control" name="content" rows="3"
								placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작 성 자</label> <input type="text"
								name="writer" class="form-control" value="${m_id}" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer w3-center">
						<button type="submit" class="btn btn-primary" style="width: 100px">등&nbsp;록</button>
					</div>
				</form:form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


