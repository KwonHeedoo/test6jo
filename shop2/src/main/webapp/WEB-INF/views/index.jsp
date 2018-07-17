<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>

</head>
<body>

	<h1>[온라인 서점]</h1>
	<ul>
		<c:if test="${joinResult==true}">
			<p>회원 가입에 성공하였습니다. 로그인해주세요!</p>
		</c:if>

		<c:choose>
			<c:when test="${sessionScope.userInfo==null}">
				<li><a href="gotoJoin">회원가입</a></li>
				<li><a href="gotologin">로그인</a></li>
			</c:when>
			<c:when test="${sessionScope.userInfo!=null}">
		${sessionScope.userInfo.username}님의 로그인을 환영합니다. 
		<li><a href="logout">로그아웃</a></li>
				<li><a href="orderList">주문정보</a></li>
				<li><a href="wishList">관심상품</a></li>
			</c:when>
		</c:choose>
		<li><a href="booklist">상품목록</a></li>
		<li><a href="bestseller">베스트셀러</a></li>
	</ul>
	<div>
		<button onclick="click()">버튼이야</button>
	</div>
</body>
</html>