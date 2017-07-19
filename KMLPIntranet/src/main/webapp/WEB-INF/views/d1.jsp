<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      height: 100%;
    }
    
   
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#"><button type="button" class="btn btn-default">공지사항</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">결&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">쪽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">커뮤니티</button></a></p>
       <p><a href="#"> <button type="button" class="btn btn-primary">사원관리</button></a></p>
    </div>
    <br>
    <div class="col-sm-8 text-left"> 
     <table class="table table-bordered">
    <thead>
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>직위</th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
       <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
        <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
        <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
       <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
       <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
        <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
       <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      <tr>
       <td>1</td>
        <td>Anna</td>
         <td>1</td>
        <td>Anna</td>
         <td>1</td>
      </tr>
      
    </tbody>
  </table>
  <p align="center"><a href="#"> <button type="button" class="btn btn-primary">등록</button></a></p>
</div>

   


</body>
</html>
