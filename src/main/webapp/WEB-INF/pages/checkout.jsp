<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<c:import url="fragments/head.jsp" />

<body>

  <c:import url="fragments/header.jsp" />

  <div id="all">

    <div id="content">
      <div class="container">
        <div class="row">

          <div class="col-md-8 col-md-offset-2">
            <ul class="breadcrumb">
              <li><a href="#">Home</a></li>
              <li>Checkout</li>
            </ul>

            <spring:hasBindErrors name="order">
              <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <c:forEach var="error" items="${errors.allErrors}">
                  <ul>
                    <li><spring:message message="${error}"/></li>
                  </ul>
                </c:forEach>
              </div>
            </spring:hasBindErrors>

            <div class="box">
              <c:url value="/checkout" var="action" />
              <form:form action="${action}" method="POST" modelAttribute="order">
                <form:hidden path="id" />
                <h1>Checkout</h1>

                <div class="content">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>First name</label> <span class="require">(*)</span>
                        <form:input type="text" cssClass="form-control" path="firstname" />
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Last name</label> <span class="require">(*)</span>
                        <form:input type="text" cssClass="form-control" path="lastname" />
                      </div>
                    </div>
                  </div>
                  <!-- /.row -->

                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label>Address</label> <span class="require">(*)</span>
                        <form:textarea cssClass="form-control" path="address" rows="5"></form:textarea>
                      </div>
                    </div>
                  </div>
                  <!-- /.row -->

                  <div class="row">

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Telephone</label> <span class="require">(*)</span>
                        <form:input cssClass="form-control" path="phone" />
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Email</label> <span class="require">(*)</span>
                        <form:input cssClass="form-control" path="email" />
                      </div>
                    </div>

                  </div>
                  <!-- /.row -->
                </div>

                <div class="box-footer">
                  <div class="pull-left">
                    <a href="<c:url value="/cart" />" class="btn btn-default">
                      <i class="fa fa-chevron-left"></i>Back to shopping cart
                    </a>
                  </div>
                  <div class="pull-right">
                    <button type="submit" class="btn btn-primary">
                      Agree to order<i class="fa fa-chevron-right"></i>
                    </button>
                  </div>
                </div>
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form:form>
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