<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 영화 정보 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2>** 영화 정보 **</h2>
<img src="${Apple.posterfile}"><br>
<table>
	<tr height="40">
		<td bgcolor="Lavender">영화 번호</td><td>${Apple.movie_num}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">제목</td><td>${Apple.movie_title}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">감독</td><td>${Apple.director}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">출연배우</td>
		<td>
		<c:forEach var="list" items="${Banana}">${list.actor},</c:forEach>
		</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">예고편</td><td><a href="${Apple.trailer}">${Apple.trailer}</a></td>
	</tr>
</table>
<hr>
<a href="home">HOME</a>&nbsp;&nbsp;<a href="mvlist">목록으로</a>
</body>
</html>