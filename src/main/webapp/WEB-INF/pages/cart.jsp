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
        <div class="row">

          <div class="col-md-10 col-md-offset-1">
            <ul class="breadcrumb">
              <li><a href="#">Home</a></li>
              <li>Shopping cart</li>
            </ul>
          </div>
          
          <div class="col-md-10 col-md-offset-1" id="basket">

            <div class="box">
              <h3>Shopping cart</h3>
              <p class="text-muted">You currently have ${cart.count} items in your cart.</p>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th colspan="2">Product</th>
                      <th>Quantity</th>
                      <th>Price</th>
                      <th colspan="3">Sub Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="item" items="${cart.items}">
                      <c:url value="/cart/update" var="action" />
                      <form action="${action}" method="GET">
                        <input type="hidden" name="id" value="${item.product.id}" />
                        <tr>
                          <td>
                            <a href="<c:url value="/product/${item.product.id}" />">
                              <img src="upload/${item.product.image}" alt="Product">
                            </a>
                          </td>
                          <td>
                            <a href="<c:url value="/product/${item.product.id}" />">${item.product.name}</a>
                          </td>
                          <td>
                            <input type="number" name="quantity" value="${item.quantity}" 
                              class="form-control" min="0" max="10" />
                          </td>
                          <td><fmt:formatNumber value="${item.product.regular}" type="number" /> đ</td>
                          <td><fmt:formatNumber value="${item.subTotal}" type="number" /> đ</td>
                          <td align="center">
                            <button type="submit" class="btn btn-primary btn-cart">
                              <i class="fa fa-refresh"></i> Update
                            </button>
                          </td>
                          <td align="center">
                            <a href="<c:url value="/cart/remove?id=${item.product.id}" />" class="btn btn-danger btn-cart">
                              <i class="fa fa-trash-o"></i> Remove
                            </a>
                          </td>
                        </tr>
                      </form>
                    </c:forEach>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th colspan="4">Total</th>
                      <th colspan="3"><fmt:formatNumber value="${cart.total}" type="number" /> đ</th>
                    </tr>
                  </tfoot>
                </table>

              </div>
              <!-- /.table-responsive -->

              <div class="box-footer">
                <div class="pull-left">
                  <a href="<c:url value="/" />" class="btn btn-default">
                    <i class="fa fa-chevron-left"></i> Continue shopping
                  </a>
                </div>
                <div class="pull-right">
                  <a href="<c:url value="/checkout" />" class="btn btn-primary">
                    Proceed to checkout <i class="fa fa-chevron-right"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.col-md-9 -->

        </div>
        <!-- /.row -->
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