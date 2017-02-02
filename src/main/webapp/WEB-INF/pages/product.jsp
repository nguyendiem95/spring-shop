<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<c:import url="fragments/head.jsp" />

<body>

  <c:import url="fragments/header.jsp" />

  <div id="all">

    <div id="content">
      <div class="container">

        <div class="col-md-3">
          <!-- *** MENUS *** -->
          <div class="panel panel-default sidebar-menu">

            <div class="panel-heading">
              <h3 class="panel-title">Categories</h3>
            </div>

            <div class="panel-body">
              <ul class="nav nav-pills nav-stacked category-menu">
                <c:forEach var="category" items="${categories}">
                  <li>
                    <a href="<c:url value="category/${category.id}" />">${category.name}</a>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <!-- *** MENUS END *** -->
        </div>

        <div class="col-md-9">
          <div class="row box" id="productMain">
            <div class="col-sm-3">
              <div id="mainImage">
                <img src="<c:url value="/upload/${product.image}" />" alt="Product" class="img-responsive" />
              </div>
            </div>
            <div class="col-sm-9">
              <h4 class="text-center">${product.name}</h4>
              <p class="price">
                <c:choose>
                  <c:when test="${product.discount eq 0}">
                    <fmt:formatNumber value="${product.price}" type="number" /> đ
           		  </c:when>
                  <c:otherwise>
                    <del>
                      <fmt:formatNumber value="${product.price}" type="number" /> đ
                    </del>
                    <fmt:formatNumber value="${product.regular}" type="number" /> đ
           		 </c:otherwise>
                </c:choose>
              </p>
              <p class="text-center buttons">
                <a href="<c:url value="/cart/add?id=${product.id}" />" class="btn btn-primary">
                  <i class="fa fa-shopping-cart"></i> Add to cart
                </a>
              </p>
            </div>
          </div>


          <div class="box" id="details">
            <p>
            <h4>Category</h4>
            <a href="<c:url value="/category/${product.category.id}" />">${product.category.name}</a>
            <h4>Product details</h4>
            <p>${product.description}</p>
            <hr>
            <div class="social">
              <h4>Show it to your friends</h4>
              <p>
                <a href="#" class="external facebook"
                  data-animate-hover="pulse"><i
                  class="fa fa-facebook"></i></a> <a href="#"
                  class="external gplus" data-animate-hover="pulse"><i
                  class="fa fa-google-plus"></i></a> <a href="#"
                  class="external twitter" data-animate-hover="pulse"><i
                  class="fa fa-twitter"></i></a> <a href="#" class="email"
                  data-animate-hover="pulse"><i
                  class="fa fa-envelope"></i></a>
              </p>
            </div>
          </div>
          <!-- /product -->

        </div>
        <!-- /.col-md-9 -->
      </div>
      <!-- /.container -->
    </div>
    <!-- /#content -->

    <c:import url="fragments/footer.jsp" />

  </div>
  <!-- /#all -->

  <c:import url="fragments/scripts.jsp" />

</body>

</html>