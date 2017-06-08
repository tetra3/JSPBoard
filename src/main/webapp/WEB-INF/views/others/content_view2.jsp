<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="uID" value="${content_view[0].bName}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="pages/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<table class="table table-striped" width="500" cellpadding="0" cellspacing="0">
		<form action="revise" method="post">
			<input type="hidden" name="bId" value="${content_view[0].bId}">
			<tr>
				<td> 번호 </td>
				<td> ${content_view[0].bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view[0].bHit} </td>
			</tr>
			<tr>
				<td> 아이디 </td>
				<td> ${content_view[0].bName}</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> ${content_view[0].bTitle}</td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td>${content_view[0].bContent}</td>
			</tr>
			<%
				String sID = (String)session.getAttribute("id");
				String uID = (String)pageContext.getAttribute("uID");
				
				if(sID == null || !uID.equals(sID)) {
			%>
			<tr >
				<td><a href="bbs">목록보기</a> &nbsp;&nbsp;  &nbsp;&nbsp; <a href="reply_view?bId=${content_view[0].bId}">답변</a></td>
			</tr>
			<%}else{ %>
			
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="list">목록보기</a> &nbsp;&nbsp; <a href="delete?bId=${content_view[0].bId}">삭제</a> &nbsp;&nbsp; <a href="reply_view?bId=${content_view[0].bId}">답변</a></td>
			</tr>
			<%} %>   
		</form>
	</table>
</div>	
</body>
</html>