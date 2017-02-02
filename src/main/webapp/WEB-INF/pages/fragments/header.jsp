<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- *** TOPBAR *** -->
<div id="top">
  <div class="container">
    <div class="col-sm-6 col-sm-offset-6" data-animate="fadeInDown">
      <ul class="menu">
        <sec:authorize access="isAnonymous()">
            <li><a href="<c:url value="/login" />">Login</a></li>
            <li><a href="<c:url value="/register" />">Register</a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li><a href="<c:url value="/" />">Hello, <sec:authentication property="principal.username" /></a></li>
            <li><a href="<c:url value="/logout" />">Logout</a></li>
        </sec:authorize>
      </ul>
    </div>
  </div>
</div>

<!-- *** TOP BAR END *** -->


<!-- *** NAVBAR *** -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
  <div class="container">
    <div class="navbar-header">

      <a class="navbar-brand home" href="<c:url value="/" />" data-animate-hover="bounce"> 
        <img src="<c:url value="/static/images/logo.png" />" alt="Obaju logo" class="hidden-xs" /> 
        <img src="<c:url value="/static/images/logo-small.png" />" alt="Obaju logo" class="visible-xs" />
        <span class="sr-only">Obaju - go to homepage</span>
      </a>

      <div class="navbar-buttons">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
          <span class="sr-only">Toggle navigation</span> 
          <i class="fa fa-align-justify"></i>
        </button>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
          <span class="sr-only">Toggle search</span> 
          <i class="fa fa-search"></i>
        </button>
        <a class="btn btn-default navbar-toggle" href="<c:url value="/cart" />"> 
          <i class="fa fa-shopping-cart"></i> 
          <span class="hidden-xs">
            <c:choose>
              <c:when test="${empty cart}">0 item in cart</c:when>
              <c:otherwise>${cart.count} items in cart</c:otherwise>
            </c:choose>
          </span>
        </a>
      </div>

    </div>
    <!--/.navbar-header -->

    <div class="navbar-collapse collapse" id="navigation">

      <ul class="nav navbar-nav navbar-left">
        <li><a class="active" href="<c:url value="/" />">Home</a></li>
        <li><a href="<c:url value="/" />">About us</a></li>
        <li><a href="<c:url value="/" />">Contact</a></li>
      </ul>

    </div>
    <!--/.nav-collapse -->

    <div class="navbar-buttons">

      <div class="navbar-collapse collapse right" id="basket-overview">
        <a href="<c:url value="/cart" />" class="btn btn-primary navbar-btn"> 
          <i class="fa fa-shopping-cart"></i> 
          <span class="hidden-sm">
            <c:choose>
              <c:when test="${empty cart}">0 item in cart</c:when>
              <c:otherwise>${cart.count} items in cart</c:otherwise>
            </c:choose>
          </span>
        </a>
      </div>
      <!--/.nav-collapse -->

      <div class="navbar-collapse collapse right" id="search-not-mobile">
        <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
          <span class="sr-only">Toggle search</span> 
          <i class="fa fa-search"></i>
        </button>
      </div>

    </div>

    <div class="collapse clearfix" id="search">

      <form class="navbar-form" action="search" method="GET">
        <div class="input-group">
          <input type="text" class="form-control" name="q" placeholder="Search" /> 
          <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">
              <i class="fa fa-search"></i>
            </button>
          </span>
        </div>
      </form>

    </div>
    <!--/.nav-collapse -->

  </div>
  <!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->