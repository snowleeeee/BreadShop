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

	
	
	<h1>�Է� Ȯ��</h1>
	<h3>��ǰ��ȣ : <%=vo.getProductId() %></h3>
	<h3>��ǰ �� : <%=vo.getProductName() %></h3>
	<h3>��ǰ ���� : <%=vo.getProductDesc() %></h3>
	<h3>��ǰ ���� : <%=vo.getProductPrice() %></h3>
	<h3>��ǰ �̹��� : <%=vo.getProductImage() %></h3>
	<h3>��ǰ ���� : <%=vo.getProductGrade() %></h3>
	<h3>������ ���� ���� �� : <%=vo.getProductCount()%></h3>
	<h3>��ǰ ���� : <%=vo.getProductInventory() %></h3>
	
</body>
</html>