<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	
	<script>
		function joinFormSubmit(form) {
			
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			form.submit();
		}
	
	</script>
	
	<form action="../member/doLogin" method="POST" onSubmit="joinFormSubmit(); return false;">
		<div>
			아이디 : <input name="loginId" placeholder="아이디를 입력해주세요"/>
		</div>
		<div>
			비밀번호 : <input name="loginPw" placeholder="비밀번호를 입력해주세요"/>
		</div>
		<div>
			<button>로그인</button>
			<a href="../home/main">뒤로가기</a>
		</div>
	</form>
</body>
</html>