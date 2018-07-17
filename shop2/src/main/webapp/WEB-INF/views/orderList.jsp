<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, th,td{
border: 1px solid black;

}
</style>

</head>
<body>
	<div>
		<h1>[${sessionScope.userInfo.username}(${sessionScope.userInfo.userid})님의 구매목록]</h1>
	</div>

	<table class="list">
		<tr>
			<th>구입일</th>
			<th>상품코드</th>
			<th>제목</th>
			<th>가격</th>
			<th>수량</th>
			<th>합계금액</th>
		</tr>
		
		<c:if test="${orderlist == null}">
		<tr>
			<td colspan="6">구매 목록이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:forEach var="Sale" items="${orderlist}">
			<tr>		
				<td>${Sale.purchaseDate}</td>
				<td>${Sale.bookcode}</td>
				<td>${Sale.title}</td>
				<td>${Sale.price} 원</td>
				<td>${Sale.purchasecnt}</td>
				<td>${Sale.purchaseSum} 원</td>
		
			</tr>
		</c:forEach>
		<tr>
			<th colspan="5">누적 구매액 </th>
			<td>${sum} 원</td>
		</tr>
	
	
	</table>

</body>
</html>