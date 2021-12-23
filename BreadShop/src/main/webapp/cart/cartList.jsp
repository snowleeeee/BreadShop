<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cartList {
	border: #888888 2px solid;
	border-collapse: collapse;
	padding-left: 18%;
	padding-right: 18%;
}

.delBtn {
	background-color: #023586;
	text-decoration: none;
	color: white;
	border: none;
	padding: 2px 3px;
	margin: 2px 3px;
}

section {
	align: center;
	width:80%;
	padding-left:18%;
}
</style>
</head>
<body>

	<jsp:include page="../head.jsp"></jsp:include>
	<section>
		<%
		int count = 1;
		%>
		<c:choose>
			<c:when test="${sessionScope.id eq null }">
				<script>
					alert('로그인 후 사용해 주세요');
					history.back();
				</script>
			</c:when>

			<c:otherwise>
				<h1>장바구니</h1>
				<table class="cartList" border="">
					<tr>
						<th>번호</th>
						<th>상품번호</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>상품개수</th>
						<th>가격</th>
						<th>삭제</th>
					</tr>

					<c:forEach var="cart" items="${requestScope.cartList }">
						<tr>
							<td><%=count++%></td>
							<td>${cart.productId }</td>
							<td><img src="upload/${cart.productImage }" width="100"
								height="80" border="0" /></td>

							<td>${cart.productName }</td>
							<td>${cart.cartCount }</td>
							<td>${cart.cartPrice }</td>
							<td>
								<form action="cartDelete.do" method="get">
									<input type='hidden' name='memberId'
										value='${sessionScope.id  }'> <input type='hidden'
										name='cartId' value='${cart.cartId }'> <input
										type='submit' value='삭제' class="delBtn">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>

	</section>

</body>
</html>