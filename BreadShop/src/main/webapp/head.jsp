<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'
   crossorigin='anonymous'></script>
<title>Insert title here</title>
<style>
* {
   font-family: sans-serif;
}

header {
   background-color: #023586;
   height: 170px;
}

.left {
   float: left;
   color: white;
   padding: auto;
   width: 100px;
   height: auto;
}

.fa-bars {
   margin: 60px;
   color: white;
}

.right {
   float: right;
}

.member>a, .menu>a, .member, .menu {
   text-decoration: none;
   color: white;
}

.mainLogo {
   float: left;
   padding: 60px;
}

.member {
   margin: 10px 10px;
   font-size: medium;
}

.menu {
   margin: 10px 10px;
   font-size: x-large;
   font-weight: bold;
}

.button {
   border: 0;
   outline: 0;
   background-color: #023586;
   color: white;
}

form {
   display: inline;
}

.hide {
   background-color: white;
   display: none;
   color: #888888;
   padding: 10px;
   margin: 10px;
}

.slideMenu {
   list-style: none;
   padding-left: 0px;
   height: 300px;
}

.slideMenu:hover .hide {
   list-style: block;
   padding-left: 0px;
   display: block;
   position: absolute;
   font-size: 20px;
}

.hide li {
   padding: 5px;
   list-style: none;
}

.hide li a:link, .hide li a:visited, .hide li a:hover {
   color: #023586;
}

.insertCartBtn {
   border: 0;
   outline: 0;
   background-color: white;
   color: #023586;
   font-size: 20px;
}
</style>


</head>

<body>
   <header>
      <div class="header">
         <div class="left">
            <ul>
               <li class="slideMenu"><a><i class='fas fa-bars'
                     style='font-size: 36px'></i></a> <c:choose>
                     <c:when test="${sessionScope.id eq 'admin' }">
                        <ul class="hide">
                           <li><a
                              href='${pageContext.request.contextPath }/logout.do'>????????????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/productList.do'>??????
                                 ?????? ??????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/product/productInput.jsp'>??????
                                 ??????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/product/productUpdate.jsp'>??????
                                 ????????????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/product/productDelete.jsp'>??????
                                 ??????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/product/productSearchList.jsp'>??????
                                 ??????</a></li>

                        </ul>
                     </c:when>
                     <c:otherwise>
                        <ul class="hide">
                           <li><c:choose>
                                 <c:when test="${sessionScope.id eq null }">
                                    <a href='${pageContext.request.contextPath }/login.do'>?????????</a>
                                 &nbsp; &nbsp;| &nbsp; &nbsp;
                                 <a
                                       href='${pageContext.request.contextPath }/breadShop/memberInput.jsp'>????????????</a>

                                 </c:when>
                                 <c:otherwise>
                                    <a href='${pageContext.request.contextPath }/logout.do'>????????????</a>
                                 &nbsp; &nbsp;| &nbsp; &nbsp;
                                 <form action='memberInfo.do' method='get'>
                                       <input type='hidden' name='id' value='${sessionScope.id }'>
                                       <input type='submit' value='???????????????' class="insertCartBtn">
                                    </form>

                                 </c:otherwise>
                              </c:choose></li>

                           <li><a
                              href='${pageContext.request.contextPath }/productList.do'>??????
                                 ?????? ??????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/product/productSearchList.jsp'>??????
                                 ??????</a></li>
                           <li><a
                              href='${pageContext.request.contextPath }/borderList.do'>?????????</a></li>
                           <li><form action="cartList.do" method="get">
                                 <input type='hidden' name='memberId'
                                    value=${sessionScope.id }> <br> <input
                                    type='submit' value='???????????? ??????' class="insertCartBtn">
                              </form></li>

                        </ul>
                     </c:otherwise>
                  </c:choose></li>
            </ul>
         </div>

      </div>

      <div>
         <a href="${pageContext.request.contextPath }/index.jsp"><img
            alt=""
            src="${pageContext.request.contextPath }/upload/breadMainLogo.jpg"
            width="300" class="mainLogo"></a>
      </div>

      <div class="right">
         <div class="member">
            <c:choose>
               <c:when test="${sessionScope.id eq null }">
                  <a href='login.do'>?????????</a>
                  &nbsp; &nbsp;| &nbsp; &nbsp; <a
                     href='${pageContext.request.contextPath }/breadShop/memberInput.jsp'>????????????</a>
               </c:when>
               <c:otherwise>
                  <a href='logout.do'>????????????</a> &nbsp; &nbsp;| 
                  <form action='memberInfo.do' method='get'>
                     <input type='hidden' name='id' value='${sessionScope.id }'>
                     <input type='submit' value='???????????????' class="button member">
                  </form>
               </c:otherwise>
            </c:choose>


         </div>
         <div class="menu">
            <a href='productList.do'>?????? ?????? ??????</a> &nbsp; |&nbsp; <a
               href='borderList.do'>??????</a> &nbsp; |
            <form action="cartList.do" method="get">
               <input type='hidden' name='memberId' value=${sessionScope.id }>
               <br> <input type='submit' value='???????????? ??????' class="button menu">
            </form>
         </div>
      </div>
   </header>

</body>

</html>