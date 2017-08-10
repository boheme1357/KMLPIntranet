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

<style>
.modal-backdrop  {
    display: none;
    /* position: fixed; */
     top: 50; left: 50; 
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}

hr {
	border: solid 0.5px lightgray;
}

#mid_hr {
	border: solid 0.5px dimgrey;
}
button {
	width: 120px;
	height: 40px;
}

ul, li {
	list-style-type: none;
    margin: 0;
    padding: 0;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">커뮤니티 내용</h3>
					<hr>
				</div>
				<!-- /.box-header -->

				<sf:form role="form" action="modifyPage.do" method="post">

					<input type='hidden' name='bno' value="${boardVO.bno}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</sf:form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">제&nbsp;목</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내&nbsp;용</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작 성 자</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer}"
							readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer w3-center">
					<button type="submit" class="btn btn-warning" id="modifyBtn">수&nbsp;정</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">삭&nbsp;제</button>
					<button type="submit" class="btn btn-primary" id="goListBtn">리 스 트</button>
				</div>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
<br>
<hr id="mid_hr">

	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> <input
						lass="form-control" type="hidden" 
						id="newReplyWriter" value="${m_id}"> <label for="exampleInputEmail1">댓글</label>
						 <input class="form-control" type="text"
						placeholder="댓글 작성" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">댓글 추가</button>
				</div>
			</div>


			<!-- The time line -->
			
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">
					<button type="button" class="btn btn-warning timeline" id="repliesDiv">댓글 리스트</button>
<!-- 					<small id='replycntSmall'> [댓글 리스트 보기] </small> -->
				</span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->



	<!-- Modal -->
	
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog" style="margin-top: 4%">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="replyModBtn">수&nbsp;정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭&nbsp;제</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫&nbsp;기</button>
				</div>
			</div>
		</div>
	</div>


</section>
<!-- /.content -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}} style="margin-left: 20px;">
<div class="timeline-item" >
    <b><h5 class="timeline-header" style="color: #0066FF">{{replyer}}</b>&emsp;<i class="fa fa-clock-o"></i>&nbsp;{{prettifyDate regdate}}</h5>
</div>
  <div class="timeline-body" style="margin-left: 30px;">{{replytext}} </div><br>
    <div class="timeline-footer">
     <a class="btn btn-danger btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">수정</a>
    </div>
  </div>
<hr>		
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		return year + "/" + month + "/" + date + " " + hour + ":" + minute + ":" + second;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var bno = ${boardVO.bno};
	
	var replyPage = 1;

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
	}



	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").length < 1) {
			return;
		}
		//getPage("/replies/" + bno + "/1");
		getPage("${path}/community/cContent/"+bno+"/1/replies.do" );

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("${path}/community/cContent/"+bno+"/"+replyPage+"/replies.do" );
		
	});
	

 	$("#replyAddBtn").on("click",function(){
		 if(confirm("댓글을 등록하시겠습니까?")){
			 var replyerObj = $("#newReplyWriter");
			 var replytextObj = $("#newReplyText");
			 var replyer = replyerObj.val();
			 var replytext = replytextObj.val();
		 } else{
			 return false;
		 }
		 
		 
		
		  
	 	  $.ajax({
				type:"POST",
				url:"${path}/community/replies.do?${_csrf.parameterName}=${_csrf.token}",
				contentType: "application/json; charset=UTF-8" ,
				dataType:"text",
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				 success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1; 
						getPage("${path}/community/cContent/"+bno+"/"+replyPage+"/replies.do" );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
		  
		   
		  
		  

		  
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'${path}/update/'+rno+'/replies.do?${_csrf.parameterName}=${_csrf.token}',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("${path}/community/cContent/"+bno+"/"+replyPage+"/replies.do" );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'${path}/remove/'+rno+'/replies.do?${_csrf.parameterName}=${_csrf.token}',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("${path}/community/cContent/"+bno+"/"+replyPage+"/replies.do" );
					}
			}});
	});
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "${path}/community/cModify.do");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "${path}/community/cRemove.do?${_csrf.parameterName}=${_csrf.token}");
		formObj.submit();
	});
	
	$("#goListBtn").on("click", function(){
		
		formObj.attr("method", "get");
		formObj.attr("action", "${path}/community/cList.do");
		formObj.submit();
	});
	
/* 	$("#replyAddBtn").on("click", function(){
		
		formObj.attr("method", "post");
		formObj.attr("action", "${path}/community/r");
		formObj.submit();
	}); */
	
});
</script>







