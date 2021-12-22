<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

section {
	width: 80%;
	margin-top: 100px;
	margin-left: 19%;
	margin-right: 18%;
}

</style>
</head>
<body>

<jsp:include page="../head.jsp"></jsp:include>
	
	<section>
		<h3>상품 검색</h3>
		<form action="../productSearch.do" method="get">
			상품명: <input type='text' name='name'><br> <input
				type='hidden' name='job' value='search'> <input
				type='submit' value='검색'>
		</form>
	</section>



</body>
</html>