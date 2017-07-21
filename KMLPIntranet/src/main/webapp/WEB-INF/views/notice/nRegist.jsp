<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 등록</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      <p><a href="#"><button type="button" class="btn btn-primary">��������</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</button></a></p>
      <p><a href="#"><button type="button" class="btn btn-default">Ŀ�´�Ƽ</button></a></p>
       <p><a href="#"> <button type="button" class="btn btn-default">�������</button></a></p>
    </div>
    <br>
    <div class="col-sm-8 text-left"> 
     <table class="table table-bordered">
     
      <tr>
       <td>����</td>
        <td colspan="2">��������</td>
         </tr>
         <tr>
       <td>�ۼ���</td>
        <td colspan="2">��ǥ</td>
         </tr>
         <tr>
       <td>�ۼ�����</td>
        <td colspan="2">2017-01-01</td>
         </tr>
         <tr>
       <td>����</td>
        <td colspan="2"><textarea class="form-control" rows="15" cols="65" id="comment" style="width:500px">
</textarea></td>
         </tr>
        
    
      
   
  </table>
  <p align="center"><a href="#"> <button type="button" class="btn btn-primary">���</button></a></p>
</div>

   


</body>
</html>