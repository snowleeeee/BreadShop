<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href='productList.do'>list...</a>
	<a href='product/productInput.jsp'>input....</a>
	<a href='product/productSearch.jsp'>search...</a>
	<a href='product/productUpdate.jsp'>update...</a>
	<a href='product/productDelete.jsp'>delete...</a>
	<a href='product/productSearchList.jsp'>searchList...</a>
	<a href='borderList.do'>게시판</a>
	<a href='login.do'>로그인</a>
	<a href='logout.do'>로그아웃</a>
	<a href='breadShop/memberInput.jsp'>회원가입</a>
	<form action='memberInfo.do' method='get'>
		<input type='hidden' name='id' value='${sessionScope.id }'>
		<input type='submit' value='내정보보기'>
	</form>
</body>
</html>