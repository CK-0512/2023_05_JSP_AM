<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int currentPage = (int) request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
	int from = (int) request.getAttribute("from");
	int end = (int) request.getAttribute("end");
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<h1>게시물 리스트</h1>

	<div><a href="../home/main">메인</a></div>
	<%
		if (loginedMemberId != -1) {
	%>
			<div><a href="write">글쓰기</a></div>
	<%
		}
	%>

	<table border="1">
		<colgroup>
			<col />
			<col width="200" />
			<col />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>작성일</th>
			<th>제목</th>
		</tr>
		<%
			for (Map<String, Object> articleMap : articleListMap) {
		%>
		<tr>
			<td><%=articleMap.get("id")%></td>
			<td><%=articleMap.get("regDate")%></td>
			<td><a href="detail?id=<%=articleMap.get("id")%>"><%=articleMap.get("title")%></a></td>
		</tr>
		<%
			}
		%>
	</table>

	<style type="text/css">
		.paging>a.red {
			color : red;
			font-size: 1.2rem;
		}
	</style>

	<div class="paging">
		<% 
			if (currentPage > 1) {
		%>
			<a href="../article/list?page=1">◀</a>
		<% 
			} 
		%>
		<%
			for (int i = from; i <= end; i++) {
		%>
			<a class="<%=currentPage == i ? "red" : ""%>"href="../article/list?page=<%=i%>"><%=i%></a>
		<%
			}
		%>
		<% if (currentPage < totalPage) {%>
			<a href="../article/list?page=<%= totalPage %>">▶</a>
		<% } %>
	</div>

</body>
</html>