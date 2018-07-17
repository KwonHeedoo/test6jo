<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가장 많이 팔린 책</title>
</head>
<style>
th{
width: 100px;
text-align: center;
}

table{
width: 30%;
}
</style>
<body>

 <div>
	 <h1>[가장 많이 팔린 책]</h1>
	 </div>

	<table border="1">
		
		<tr>
			<th>상품코드</th>
			<td>${bestseller.bookcode}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bestseller.title}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${bestseller.price}</td>
		</tr>
		<tr>
			<th>총 판매수량</th>
			<td>${bestseller.saleAll}</td>
		</tr>
	</table>

</body>
</html>