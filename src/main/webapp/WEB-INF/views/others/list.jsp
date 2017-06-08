<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="pages/css/bootstrap.css">
	<style type="text/css">
		h1 { text-align: center; margin:100px;}
	</style>
<title>Insert title here</title>
	<%
		String id="";
		id=(String)session.getAttribute("id");
		
	%>
</head>
<body>
<div class="container">
<table class="table table-striped" width="500" cellpadding="0" cellspacing="0">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>제목</td>
		<td>날짜</td>
		<td>히트</td>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.bId}</td>
		<td>${dto.bName}</td>
		<td>
			<c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
			<a href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
		<td>${dto.bDate}</td>
		<td>${dto.bHit}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"> <a href="writeForm">글작성</a> </td>
	</tr>
</table>
</div>
<script src="/pages/js/jquery-3.1.1.js"></script>
<script src="/pages/js/bootstrap.js"></script>
</body>
</html>