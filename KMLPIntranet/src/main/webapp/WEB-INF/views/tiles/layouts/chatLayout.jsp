<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:getAsString name="title" /></title>
<style>
html, body {
	margin: 0;
	width: 100%;
	height: 100%;
}

#header {
	position: fixed;
	width: 100%;
	height: 50px;
	z-index: 3;
}

#menu {
	display: inline-block;
	width: 12%;
	height: 100%;
	margin-top: 50px;
	z-index: 2;
}

#body {
	margin-left: 2%;
	margin-right: 2%;
	margin-top: 3%;
	display: inline-block;
	position: absolute;
	left: 200px;
	right: 0;
	z-index: 1;
}
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
   <tr>
      <td colspan="2" id="header">
         <tiles:insertAttribute name="header" />
      </td>
   </tr>
   
   <tr>
      <td valign="top" id="menu">
         <tiles:insertAttribute name="menu" />
      </td>
      
      <td valign="top" id="body">
         <tiles:insertAttribute name="body" />
      </td>
   </tr>
</table>
</body>
</html>