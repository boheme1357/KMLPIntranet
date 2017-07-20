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
      <p><a href="#"><button type="button" class="btn btn-primary">공지사항</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">결&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">쪽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">커뮤니티</button></a></p>
       <p><a href="#"> <button type="button" class="btn btn-default">사원관리</button></a></p>
    </div>
    <br>
    <div class="col-sm-8 text-left"> 
     <table class="table table-bordered">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th> 
        
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>호</td>
         <td>1</td>
        <td>2000-00-00</td>
      
      </tr>
      <tr>
       <td>1</td>
        <td>놀러가자</td>
         <td>1</td>
        <td>2017-09-02</td>
     
      </tr>
      <tr>
        <td>1</td>
        <td>세미나</td>
         <td>1</td>
        <td>2017-03-08</td>
      </tr>
      <tr>
        <td>1</td>
        <td>지구일주</td>
         <td>1</td>
        <td>2060-05-20</td>
     
      </tr>
      <tr>
       <td>1</td>
        <td>화성여행</td>
         <td>1</td>
        <td>2100-05-06</td>
     
      </tr>
      <tr>
       <td>1</td>
        <td>남극탐험</td>
         <td>1</td>
        <td>2050-06-23</td>
      </tr>
     
     
      
    </tbody>
  </table>
  <p align="center"><a href="#"> <button type="button" class="btn btn-primary">등록</button></a></p>
</div>

</body>
</html>
