<%@page import="com.bread.vo.BreadProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	
}

.container {
	width: 900px;
	height: 500px;
	text-align: center;
	padding: 10px;
	margin: 100px 18%;
	
	background-color: cream;
	border: gray 1px solid;
}

.container-head {
	margin: 25px 0 0 0;
	padding: 10px;
	float: left;
	width: 500px;
	height: 400px;
}

.container-body {
	float: left;
	width: 350px;
	height: 250px;
	margin: 25px 0 0 0;
	border-bottom: solid 2px #888888;
}

.container-footer {
	float: left;
	width: 350px;
	height: 180px;
	border-bottom: solid 2px #888888;
}

.cartBtn, .adminBtn {
	background-color: #023586;
	text-decoration: none;
	color: white;
	border: none;
	padding: 2px 3px;
	margin: 10px 3px;
	width: 200px;
	font-size: 18px;
	height: 35px;
}

.fa-star, .fa-star-half-empty {
	color: blue;
}

.star-area {
	width: 120px;
	margin: 20px;
	text-align: center;
	margin: 15px 112px;
}

.star {
	padding: 1px;
	display: inline-block;
	width: 17px;
}
</style>
</head>
<body>

	<%
	BreadProductVO vo = (BreadProductVO) request.getAttribute("productOne");
	%>
	<jsp:include page="../head.jsp"></jsp:include>

	<c:set var="id" value="${sessionScope.id }"></c:set>
	<section>
	
	
		<div class="container">
			
			<div class="container-head">
				<img src="upload/<%=vo.getProductImage()%>" width="400" border="0" />
			</div>

			<div class="container-body">
				<h1><%=vo.getProductName()%></h1>
				<h2><%=vo.getProductPrice()%></h2>
				<%=vo.getProductDesc()%>


			</div>


			<div class="container-footer">


				<div class="star-area">
					<%
					for (int i = 0; i < (int) vo.getProductGrade(); i++) {
					%>
					<div class='star'>
						<i class="fa fa-star"></i>
					</div>
					<%
					}

					if (vo.getProductGrade() - (int) vo.getProductGrade() > 0) {
					%>
					<div class='star'>
						<i class="fa fa-star-half-empty"></i>
					</div>
					<%
					}
					%>
				</div>
				<c:choose>
					<c:when test="${id=='admin' }">
						<div class="adminArea">

							<form action="productSearch.do" method="get">
								<input type='hidden' name='name' value='<%=vo.getProductId()%>'>
								<br> <input type='hidden' name='job' value='update'>
								<input type='submit' value='상품 업데이트' class="adminBtn">
							</form>


							<form action="productSearch.do" method="get">
								<input type='hidden' name='name' value='<%=vo.getProductId()%>'>
								<br> <input type='hidden' name='job' value='delete'>
								<input type='submit' value='상품 삭제' class="adminBtn">
							</form>
						</div>
					</c:when>
					<c:otherwise>
						<div class="memberArea">

							수량 : <select id="selectCount" onchange="onchangeFnc(event)">
								<option value='0'>0</option>
								<option value='1'>1</option>
								<option value='2'>2</option>
								<option value='3'>3</option>
								<option value='4'>4</option>
								<option value='5'>5</option>

							</select> <br>
							<form action="cartInsert.do" method="get">
								<!-- 필요한 값 String memberId, String productId, int cartCount -->
								<!-- <input type="hidden" name="cartCount" value='1'> -->
								<input type="hidden" name="memberId" value='${sessionScope.id }'>
								<input type="hidden" name="productId"
									value='<%=vo.getProductId()%>'> <input type="hidden"
									name="cartCount"> <input type="submit" value="장바구니 추가"
									class="cartBtn">
							</form>

						</div>


					</c:otherwise>


				</c:choose>

			</div>
		</div>
	</section>
	<script type="text/javascript">
		function onchangeFnc(e) {
			//console.log(e.target.option.selected.val())
			var count = $("#selectCount option:selected").val();
			$('input[name="cartCount"]').attr('value', count);
			console.log(count);
		}
	</script>
</body>
</html>