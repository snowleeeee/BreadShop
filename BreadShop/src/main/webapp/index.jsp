<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- product -->
	<a href='productList.do'>list...</a>
	<a href='product/productInput.jsp'>input....</a>
	<a href='product/productSearch.jsp'>search...</a>
	<a href='product/productUpdate.jsp'>update...</a>
	<a href='product/productDelete.jsp'>delete...</a>
	<a href='product/productSearchList.jsp'>searchList...</a>
	
	
	
	
	<a href='borderList.do'>게시판</a>
	<a href='login.do'>로그인</a>
	<a href='breadShop/memberInput.jsp'>회원가입</a>
	
	<form action="cartList.do" method="get">
		memberID : <input type='text' name='memberId' value=${sessionScope.id }> <br>
		<input type='submit' value='장바구니 검색'>
	</form>
	
	
</body>
</html>