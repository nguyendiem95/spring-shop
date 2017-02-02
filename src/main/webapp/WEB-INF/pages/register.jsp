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

          <div class="col-md-6 col-md-offset-3">
            <spring:hasBindErrors name="user">
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
              <h3>Create new account</h3>
              
              <c:url value="/register" var="action" />
              <form:form action="${action}" method="POST" modelAttribute="user">
                <form:hidden path="id" />
                <div class="form-group">
                  <label>Name</label> <span class="require">(*)</span> 
                  <form:input cssClass="form-control" path="name" />
                </div>
                <div class="form-group">
                  <label>Email</label> <span class="require">(*)</span>
                  <form:input cssClass="form-control" path="email" />
                </div>
                <div class="form-group">
                  <label>Password</label> <span class="require">(*)</span>
                  <form:password cssClass="form-control" path="password" />
                </div>
                <div class="form-group">
                  <label for="password">Confirm Password</label> <span class="require">(*)</span> 
                  <form:password cssClass="form-control" path="confirmPassword" />
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">
                    <i class="fa fa-user-md"></i> Register
                  </button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form:form>
            </div>
          </div>

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