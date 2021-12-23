<%@page import="com.bread.vo.BreadProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<%
BreadProductVO vo = (BreadProductVO)request.getAttribute("product");
%>
	<h3>상품 정보 삭제</h3>
	<form action="productDelete.do" method='post'>
	
		<!-- product_name, product_desc, product_price, product_image, product_inventory -->
	
		상품 번호 : <input type='text' name='product_id' value='<%=vo.getProductId()%>' readonly> <br>
		상품명 : <input type='text' name='product_name' value='<%=vo.getProductName()%>'> <br>	
		상품 설명 : <input type='text' name='product_desc' value='<%=vo.getProductDesc() %>'><br>
		상품 가격 : <input type='number' name='product_price' value='<%=vo.getProductPrice() %>'><br>
		상품 이미지 : <input type='text' name='product_image' value='<%=vo.getProductImage() %>'><br>
		상품 개수 : <input type='number' name='product_inventory' value='<%=vo.getProductInventory()%>'><br>
		<input type='submit' value='삭제'>
		
	</form>

</body>
</html>