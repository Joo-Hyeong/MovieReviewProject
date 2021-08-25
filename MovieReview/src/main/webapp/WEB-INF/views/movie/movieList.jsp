<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring Mybatis MemberList **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2>** 영화 목록 **</h2>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>

<c:forEach var="list" items="${Banana}">
<div style="display: inline-block">
	<a href="mvdetail?movie_num=${list.movie_num}"><img src="${list.posterfile}" width=200 height=320></a><br>
	${list.movie_title}
</div>
</c:forEach>

<hr>
<a href="home">HOME</a> 
</body>
</html>