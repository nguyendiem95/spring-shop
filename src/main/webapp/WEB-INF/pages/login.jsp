<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <c:if test="${param.error != null}">
              <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="icon fa fa-exclamation-circle"></i> Invalid email or password
              </div>
            </c:if>

            <div class="box">
              <h3>Login to continue</h3>

              <form action="<c:url value="/login" />" method="POST">
                <div class="form-group">
                  <label>Email</label> 
                  <input type="text" class="form-control" name="email" />
                </div>
                <div class="form-group">
                  <label>Password</label> 
                  <input type="password" class="form-control" name="password" />
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">
                    <i class="fa fa-user-md"></i> Login
                  </button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form>
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