<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =(String)session.getAttribute("id");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="pages/css/bootstrap.css">

<meta name="viewport" content="width=device-width", initial-scale="1">
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
		<% if(id == null) { %>
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
		<form method="post" action="reply">
			<input type="hidden" name="bId" value="${reply_view[0].bId}">
			<input type="hidden" name="bName" value="${id}">
			<input type="hidden" name="bGroup" value="${reply_view[0].bGroup}">
			<input type="hidden" name="bStep" value="${reply_view[0].bStep}">
			<input type="hidden" name="bIndent" value="${reply_view[0].bIndent}">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글답변 양식</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 답변 제목" name="bTitle" maxlength="50" 
						value="${reply_view[0].bTitle}">
						</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 답변 내용" name="bContent"
						 maxlength="2048" style="height: 350px;"></textarea>
						
						</td>
					</tr>						
				</tbody>
			</table>
			<a class="btn btn-primary pull-right" href="bbs">목록보기</a><input type=submit class="btn btn-primary pull-right" value="글답변">
		</form>	
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="pages/js/bootstrap.js"></script>
</body>
</html>