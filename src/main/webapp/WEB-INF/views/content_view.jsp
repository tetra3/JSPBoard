<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String sID = null;
				if((String)session.getAttribute("id") != null) {
					sID = (String)session.getAttribute("id");
				}
%>
<c:set var="uID" value="${content_view[0].bName}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="pages/css/bootstrap.css">

<meta name="viewport" content="width=device-width", initial-scale="1">
<style>
#content {min-height:200px; text-align:left;}
</style>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main">Spring 게시판 연습용 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main">메인</a></li>
				<li class="active"><a href="bbs">게시판</a></li>
			</ul>
		<% if(sID == null) { %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="loginView">로그인</a></li>
						<li><a href="signupView">회원가입</a></li>
					</ul>
				</li>
			</ul>
		<%}else{ %>
		<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false">접속관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
		<%} %>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;"> 번호 </td>
						<td colspan="2">${content_view[0].bId}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2">${content_view[0].bHit}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td colspan="2">${content_view[0].bName}</td>
					</tr>
					<tr>
						<td>제목</td>
						<c:set var="uTitle" value="${content_view[0].bTitle}"/>
						<%
							String uTitle = (String)pageContext.getAttribute("uTitle");
						%>
						<td colspan="2"><%=uTitle.replace(" ","&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>내용 </td>
						<c:set var="uContent" value="${content_view[0].bContent}"/>
						<%
							String uContent = (String)pageContext.getAttribute("uContent");
							
						%>
						<td colspan="2" id="content">
						<%=uContent.replace(" ","&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a class="btn btn-primary pull-right" href="bbs">목록보기</a>
			<%
				
				String uID = (String)pageContext.getAttribute("uID");
				
				if(sID != null && sID.equals(uID)) {
			%>
				<a href="delete?bId=${content_view[0].bId}" class="btn btn-primary pull-right">삭제</a>
				<a href="revise?bId=${content_view[0].bId}" class="btn btn-primary pull-right">수정</a>
				<a href="reply_view?bId=${content_view[0].bId}" class="btn btn-primary pull-right">답변</a>
			<%}else if(sID == null){ %>
				
			<%}else{%>
				<a href="reply_view?bId=${content_view[0].bId}" class="btn btn-primary pull-right">답변</a>
			<%} %>   
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="pages/js/bootstrap.js"></script>
</body>
</html>