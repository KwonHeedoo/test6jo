<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록 보기</title>
</head>
<body>
	<div>
		<h1>상품 목록</h1>
	</div>

	<table border="1" class="list">
		<tr>
			<th>상품코드</th>
			<th>제목</th>
		</tr>
		
		<c:if test="${booklist == null}">
			<tr>
			<td colspan="2">상품이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="Book" items="${booklist}">
			<tr>
				<td style="text-align: center;">${Book.bookcode}</td>
				<td><a href="itemView?bookcode=${Book.bookcode}">${Book.title}</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>