<%@page import="com.bread.vo.BreadProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>

<style>
* {

	
}

section {
	width: 80%;
	margin-top:100px;
	margin-left:18%;
	margin-right: 18%;
}

.container {
	float: left;
	width: 300px;
	height : 350px;
	text-align: center;
	padding: 10px;
	margin:10px;
	background-color: cream;
	border: gray 1px solid;
	
}



.container-head,
.container-body,
.container-footer{ 
justify-content: center;


}


.container-head>a {
	width: 200px;
}

.cartBtn {
	background-color: #023586;
	text-decoration: none;
	color: white;
	border: none;
	padding: 2px 3px;
	margin: 2px 3px;
}
</style>
</head>

<body>
	<jsp:include page="../head.jsp"></jsp:include>
	<!-- 전체 컨테이너 -->
	<section>

		<h1>전체 상품 조회</h1>
		<br>
		<br>
		
		<c:forEach var="prod" items="${requestScope.productList }">

			<div class="container">
				<div class="container-head">
					<a href='#' id='${prod.productId}'> <img
						src="upload/${prod.productImage}" width="250" height="200" border="0" />
					</a>
				</div>
				<div class="container-body" align="center">
					<h1>${prod.productName}</h1>
					${prod.productPrice}
				</div>
				<div class="container-footer">
					<form action="cartInsert.do" method="get" id='cartLink' name='link'>
						<!-- 필요한 값 String memberId, String productId, int cartCount -->
						<input type="hidden" name="cartCount" value='1'> <input
							type="hidden" name="memberId" value='${sessionScope.id }'>
						<input type="hidden" name="productId" value='${prod.productId }'>
						<input type="submit" value="장바구니 추가" class="cartBtn">
					</form>
				</div>
			</div>
		</c:forEach>
		<form name='breadshop' action='productOne.do' method='post'>
			<input type='hidden' name='productId'>
		</form>
	</section>
	<script>
		let btns = document.querySelectorAll('.container-head >a');
		console.log(btns);

		for (let i = 0; i < btns.length; i++) {
			btns[i].addEventListener('click', function(e) {
				e.preventDefault();
				let id = e.target.parentElement.id;
				console.log(id);
				document.forms.breadshop.productId.value = id;
				document.forms.breadshop.submit();
			});
		}
	</script>



</body>
</html>