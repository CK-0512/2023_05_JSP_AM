<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<script>
		function joinFormSubmit(form) {
			
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			form.loginPwChk.value = form.loginPwChk.value.trim();
			form.name.value = form.name.value.trim();
			
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
			if (form.loginPwChk.value.length == 0) {
				alert('비밀번호 확인을 입력해주세요');
				form.loginPwChk.focus();
				return;
			}
			if (form.name.value.length == 0) {
				alert('이름을 입력해주세요');
				form.name.focus();
				return;
			}
			
			if (form.loginPwChk.value != form.loginPw.value) {
				alert('비밀번호를 확인해 주세요');
				form.loginPw.value = null;
				form.loginPwChk.value = null;
				form.loginPw.focus();
				return;
			}
			
			form.submit();
		}
	
	</script>
	
	<form action="../member/doJoin" method="POST" onSubmit="joinFormSubmit(); return false;">
		<div>
			아이디 : <input name="loginId" placeholder="아이디를 입력해주세요"/>
		</div>
		<div>
			비밀번호 : <input name="loginPw" placeholder="비밀번호를 입력해주세요"/>
		</div>
		<div>
			비밀번호 : <input name="loginPwChk" placeholder="비밀번호를 다시 입력해주세요"/>
		</div>
		<div>
			이름 : <input name="name" placeholder="이름을 입력해주세요"/>
		</div>
		<div>
			<button>가입</button>
			<a href="../home/main">뒤로가기</a>
		</div>
	</form>
</body>
</html>