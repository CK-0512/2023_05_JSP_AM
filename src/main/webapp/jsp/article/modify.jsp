<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Map<String, Object> articleMap = (Map<String, Object>)request.getAttribute("articleMap"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<h1><%= (int)articleMap.get("id") %>번 게시물</h1>
	<div>작성일 : <%= (LocalDateTime)articleMap.get("regDate") %></div>
	
	<form action="../article/doModify" method="POST">
		<input name="id" type="hidden" value="<%= (int)articleMap.get("id") %>" />
		<div>제목 : <input name="title" type="text" value="<%= (String)articleMap.get("title") %>" placeholder="제목을 입력해주세요"/></div>
		<div>내용 : <textarea name="body" placeholder="내용을 입력해주세요"><%= (String)articleMap.get("body") %></textarea></div>
		<div>
			<input type="button" value="수정" />
			<a href="../article/detail?id=<%= (int)articleMap.get("id") %>">취소</a>
		</div>
	</form>
</body>
</html>