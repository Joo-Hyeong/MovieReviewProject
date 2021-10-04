<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 영화 목록 **</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/library/basicStyle.css">

</head>
<body>
<h2>** 영화 목록 **</h2>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>

<c:forEach var="list" items="${Banana}">
<div style="float:left; margin: 40px">
	
	<c:choose>
		<c:when test="${loginID=='admin'}"><a href="movieEditF?movie_num=${list.movie_num}&searchType=n"><img src="${list.posterfile}" width=200 height=320></a><br>
		${list.movie_title}</c:when>

		<c:otherwise><a href="mvdetail?movie_num=${list.movie_num}&searchType=n"><img src="${list.posterfile}" width=200 height=320></a><br>
		${list.movie_title}</c:otherwise>
	</c:choose>
</div>
</c:forEach>

</body>
</html>