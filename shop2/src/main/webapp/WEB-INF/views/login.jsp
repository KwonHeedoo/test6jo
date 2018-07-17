<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
th{
text-align: left
}
td{
text-align: center;
}
</style>
<script>
	function check() {
		var id=document.getElementById("id").value;
		var pw=document.getElementById("pw").value;
		
		if(id==""||pw==""){
			alert("ID나 PW가 입력되지 않았습니다.")
			return;
		}
		
		
		loginForm.submit();
	}
</script>

</head>
<body>

	<h1>[로그인]</h1>

	<div>
		<c:if test="${loginResult==false}">
			<p style="color: red;">ID나 PW가 잘못 입력되었습니다. 다시 로그인해 주세요.</p>
		</c:if>
	</div>
	
<form id="loginForm" action="login" method="post">
	<table border="1">
	<tr>
		<th>ID</th>
		<td><input id="id" type="text" name="userid"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input id="pw" type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="로그인" onclick="check()">
	</tr>	
	</table>
</form>

	<br>
	<a href="home">메인창으로 돌아가기</a>
	
	

</body>
</html>