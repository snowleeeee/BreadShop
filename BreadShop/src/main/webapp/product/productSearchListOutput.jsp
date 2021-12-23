<%@page import="com.bread.vo.BreadProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
section {
	width: 80%;
	margin-top:100px;
	margin-left:19%;
	margin-right: 18%;
}

.container {
	float: left;s
	width: 300px;
	height: 350px;
	text-align: center;
	padding: 10px;
	margin: 10px;
	background-color: cream;
	border: gray 1px solid;
}

.container-head, .container-body, .container-footer {
	justify-content: center;
}

.container-head>a {
	width: 200px;
}

.memberBtn, .adminBtn {
	background-color: #023586;
	text-decoration: none;
	color: white;
	border: none;
	padding: 2px 3px;
	margin: 5px 3px;
	width: 180px;
}
.backBtn{
background-color: #023586;
	text-decoration: none;
	color: white;
	border: none;
	padding: 2px 3px;
	margin-right:400px;
	width: 100px;
	float: right;
	

}
</style>
<body>
	<jsp:include page="../head.jsp"></jsp:include>
	
	
	<section>
	
		<h1>상품 조회</h1>
		
		<input type='button' value='이전' onclick="clickFnc()" class="backBtn">
		<br>
		<br>
		
		<%
		List<BreadProductVO> list = (List<BreadProductVO>) request.getAttribute("productList");
		if (list.size() == 0) {
		%>
		<h3>검색 결과가 없습니다</h3>
		<%
		} else {
		for (BreadProductVO vo : list) {
		%>


		<%-- <img alt="productOutput.jsp?productImage=<%=vo.getProductImage()%>"
			src=""> --%>


		<div class="container">
			<div class="container-head">
				<a href='#' id='<%=vo.getProductId()%>'> 
				<img src="upload/<%=vo.getProductImage()%>" width="250"
					height="200" border="0" />
				</a><br>
			</div>
			<div class="container-body">
				<h1><%=vo.getProductName()%></h1>
				<%=vo.getProductPrice()%>
			</div>
			<div class="container-footer">
				<c:choose>
					<c:when test="${sessionScope.id eq 'admin' }">
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
						<div class="container-footer">
							<form action="cartInsert.do" method="get">
								<!-- 필요한 값 String memberId, String productId, int cartCount -->
								<input type="hidden" name="cartCount" value='1'> <input
									type="hidden" name="memberId" value='${sessionScope.id }'>
								<input type="hidden" name="productId"
									value='<%=vo.getProductId()%>'> <input type="submit"
									value="장바구니 추가" class="memberBtn">
							</form>
						</div>
					</c:otherwise>

				</c:choose>
				<form name='breadshop' action='productOne.do' method='post'>
					<input type='hidden' name='productId'>
				</form>
			</div>


		</div>




		<%
		}
		}
		%>
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
		function clickFnc() {
			
			history.back();
			
		}
	</script>


</body>
</html>