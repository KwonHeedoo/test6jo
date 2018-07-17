<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관심상품목록</title>

</head>
<body>
	<div>
		<h1>[${sessionScope.userInfo.username}(${sessionScope.userInfo.userid})님의 WishList]</h1>
	</div>

		<table border="1" class="list">		
		<tr>
			<th>상품코드</th>
			<th>제목</th>
			<th>가격</th>
			<th>관심상품 삭제하기</th>
		</tr>
		
		<c:if test="${fn:length(wishlist) == 0}">
		<tr>
			<td colspan="6">관심상품으로 저장한 목록이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:forEach var="wishlist" items="${wishlist}">
			<tr>		
				<td>${wishlist.bookcode}</td>
				<td>${wishlist.title}</td>
				<td>${wishlist.price}</td>
				<td><a href="deleteWishlist?bookcode=${wishlist.bookcode}"><input type="button" value="삭제"></a></td>
		
			</tr>
		</c:forEach>
		</form>
	</table>
	

</body>
</html>