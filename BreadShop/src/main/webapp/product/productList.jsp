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

<!-- 로그인 로그아웃 기능 일단 적어만 둠 -->
<%-- <div style=“text-align: right”>
<a href=member_info.jsp><%=id%></a>님 안녕하세요!&nbsp;
 <%if(job.equals("admin")) {%>
 <a href=manager.jsp>관리자</a>&nbsp;
 <% } else if(job.equals("member")){%>
 <a href=seller.jsp>판매자</a>&nbsp;
 <%}%>
 <a href=login.jsp>로그아웃</a>
 </div> --%>


<body>
	<!-- 전체 컨테이너 -->
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
				<!--  jsp말고 do로 가야함!!!!!!!!!!!!! 이거만 수정하면 될거같음...  -->
				<img src="images/<%=vo.getProductImage()%>" width="200" border="0" />
				</a><br>
			</div>
			<div class="container-body">
				<h1><%=vo.getProductName()%></h1>
				<%=vo.getProductPrice()%>
			</div>
			<div class="container-footer">
				<div class="add-cart">장바구니 추가</div>
			</div>
		</div>


		<%
		}
		%>

	</section>
	<!---------------------------일단은 이것저것 넣어본건데 필요 없을거 같음.... ㅠ
	1<form action="productList.jsp" method="post">
		<section>
			<hr width='600' size='2' noshade>
			<h2>물품 목록</h2>
			<hr width='600' size='2' noshade>
			</br> </br>
			<script type="text/javascript">
				
			</script>
			<!-- 상품 목록 출력 
			<div class="container">
				<div class="container-head"></div>
				<div class="container-center"></div>
				<div class="container-footer"></div>
			</div>


		</section>

	</form>-->


</body>
</html>