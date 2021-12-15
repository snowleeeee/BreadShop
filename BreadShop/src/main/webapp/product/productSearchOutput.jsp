<%@page import="com.bread.vo.BreadProductVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	BreadProductVO vo = (BreadProductVO) request.getAttribute("product");
	%>
	<h3><%=vo.getProductName() %></h3>
	<div>
		<div><%=vo.getProductImage() %></div>
		<div>
			<div><%=vo.getProductDesc() %></div>
			<div><%=vo.getProductPrice() %></div>
			<div><%=vo.getProductGrade() %></div>
			<div><%=vo.getProductCount() %></div>
			<div><%=vo.getProductInventory() %></div>
			<!-- count를 구매자 수로 받아도 될거같음 일단 넣어는 본다... 나중에 수정하든가 하자 -->
		</div>
	</div>

</body>
</html>