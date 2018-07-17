<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세보기</title>
<script>
	
	function buying() {
		var orderNum= document.getElementById("orderNum").value;
	//	var quantity = document.getElementById("quantity").value;
	
		if(orderNum>${book.quantity}||orderNum<1){
			alert("재고수량보다 많거나 음수로는 구매할 수 없습니다.");
		return;
		}
		
		books.submit();
	}
	
	function saving() {
		
		document.form1.action= "addWishList";
		books.submit();
	}

</script>
</head>
<style>
th {
	width: 100px;
}

table {
	width: 30%;
}
</style>
<body>
	<div>
		<h1>[상품 상세 정보]</h1>
	</div>

	<table border="1">
		<form name="form1" id="books" method="post" action="buying">
			<input type="hidden" name="bookcode" value="${book.bookcode}">
			<input type="hidden" name="userid" value="${userInfo.userid}">

			<tr>
				<th>상품코드</th>
				<td>${book.bookcode}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${book.title}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${book.price}</td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td>${book.quantity}</td>
			</tr>
			<tr>
				<td style="text-align: center; height: 60px;" colspan="2">구매수량
					<input style="width: 30px;" type="number" name="orderNum"
					id="orderNum" value="1"> <input type="button" value="구입하기"
					onclick="buying()"> <input type="button" value="관심상품저장"
					onclick="saving()">
				</td>
			</tr>
		</form>
	</table>

</body>
</html>