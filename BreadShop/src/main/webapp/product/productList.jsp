<%@page import="com.bread.vo.BreadProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>productList.jsp</title>
</head>
<%-- <%
String productId = (String) session.getAttribute("productId");
String productJob = (String) session.getAttribute("productJob");
%> --%>

<!-- �α��� �α׾ƿ� ��� �ϴ� ��� �� -->
<%-- <div style=��text-align: right��>
<a href=member_info.jsp><%=id%></a>�� �ȳ��ϼ���!&nbsp;
 <%if(job.equals("admin")) {%>
 <a href=manager.jsp>������</a>&nbsp;
 <% } else if(job.equals("member")){%>
 <a href=seller.jsp>�Ǹ���</a>&nbsp;
 <%}%>
 <a href=login.jsp>�α׾ƿ�</a>
 </div> --%>


<body>
	<!-- ��ü �����̳� -->
	<section>
		<%
		List<BreadProductVO> list = (List<BreadProductVO>) request.getAttribute("productList");

		for (BreadProductVO vo : list) {
		%>


		<%-- <img alt="productOutput.jsp?productImage=<%=vo.getProductImage()%>"
			src=""> --%>
		

		<div class="container">
			<div class="container-head">
				<a href='productSearchOutput.jsp?productName=<%=vo.getProductName()%>'>
				<!--  jsp���� do�� ������!!!!!!!!!!!!! �̰Ÿ� �����ϸ� �ɰŰ���...  -->
				<img src="images/<%=vo.getProductImage()%>" width="200" border="0" />
				</a><br>
			</div>
			<div class="container-body">
				<h1><%=vo.getProductName()%></h1>
				<%=vo.getProductPrice()%>
			</div>
			<div class="container-footer">
				<div class="add-cart">��ٱ��� �߰�</div>
			</div>
		</div>


		<%
		}
		%>

	</section>
	<!---------------------------�ϴ��� �̰����� �־�ǵ� �ʿ� ������ ����.... ��
	1<form action="productList.jsp" method="post">
		<section>
			<hr width='600' size='2' noshade>
			<h2>��ǰ ���</h2>
			<hr width='600' size='2' noshade>
			</br> </br>
			<script type="text/javascript">
				
			</script>
			<!-- ��ǰ ��� ��� 
			<div class="container">
				<div class="container-head"></div>
				<div class="container-center"></div>
				<div class="container-footer"></div>
			</div>


		</section>

	</form>-->


</body>
</html>