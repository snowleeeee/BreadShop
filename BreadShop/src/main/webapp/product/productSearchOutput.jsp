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
			<!-- count�� ������ ���� �޾Ƶ� �ɰŰ��� �ϴ� �־�� ����... ���߿� �����ϵ簡 ���� -->
		</div>
	</div>

</body>
</html>