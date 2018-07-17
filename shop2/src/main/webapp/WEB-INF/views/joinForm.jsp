<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규회원가입</title>
<style>
.longinput{
width: 99%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	function validation() {
		var name= document.getElementById("name").value;
		var id =document.getElementById("userid").value;
		var pswd= document.getElementById("password").value;
		
		if(name==""||id==""||pswd==""){
			alert("입력되지 않은 값이 있습니다 . 확인해주세요.");
			return;
		}
		
		if(id.length<3||id.length>10){
			alert("ID는 3자 이상 10자 이내로 작성해주세요");
			document.getElementById("userid").focus();
			document.getElementById("userid").select();
			return;
		}
		
		if(pswd.length<3||pswd.length>10){
			alert("password는 3자 이상 10자 이내로 작성해주세요");
			document.getElementById("password").focus();
			document.getElementById("password").select();
			return;
		}
		
		form.submit();
		
	}
	
	$(function(){
		$("#idcheck").on("click",function(){
	 		var id= document.getElementById("userid").value;			
			console.log(id);
			if(id==""){
				alert("id가 입력되지 않았습니다.");
			return;
			}
			
			$.ajax({
				url: "idCheck",
				type: "get",
				data: {"userid":document.getElementById("userid").value},
				success: function(data){
					var userid =document.getElementById("userid");
						if(data==true){
							alert("이미 사용되고 있는 id라 사용이 불가능합니다.");
							
							userid.focus();
							userid.select();
							
						}else{
							alert("해당 id는 사용 가능합니다.");
							userid.readOnly = true;
						}
					},
				error:function(data){
					alert("통신에러");
				}
			});
		});
	});
	
</script>

</head>
<body>
	<div>
		<h2>[회원가입]</h2>
	</div>
	<div>
		<c:if test="${joinResult==false}">
			<p style="color: red;">회원 가입이 제대로 되지 않았습니다. 다시 가입해 주십시오.</p>
		</c:if>
	</div>

	<table border="1">
		<form id="form" action="join" method="post">
		<input type="hidden" name="action" value="join">
		<tr>
			<th>ID</th>
			<td><input id="userid" type="text" name="userid">
			<input type="button" id="idcheck" value="ID중복확인">
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input class="longinput" type="password" id="password" name="password"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input class="longinput" type="text" id="name" name="username"></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input class="longinput" type="text" id="phone" name="phone" placeholder="-포함하여 입력  예) 02-123-4567"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input class="longinput" type="text" name="address" placeholder="서울시 강남구 ..."></td>
		</tr>
		
		<tr>
			<td colspan="2" style="text-align: center;">
			<input type="button" value="가입완료" onclick="validation()"> 
			<input type="reset" value="지우기">
		</tr>
		
		</form>
	</table>

</form>
</body>
</html>