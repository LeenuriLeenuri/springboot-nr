<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link
      rel="stylesheet"
      href="/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"
    />

    <!-- STYLE CSS -->
    <link rel="stylesheet" href="/css/css/style-join.css" />

    <!-- Favicon -->
    <link rel="icon" href="/img/core-img/favicon.ico" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
  </head>

  <body>
    <div
      class="wrapper"
      style="background-image: url('/img/user-img/join-back.jpg');"
    >
      <div class="inner">
        <div class="image-holder">
          <img src="/media/${sessionScope.principal.profile}" onerror="javascript:this.src = '/img/user-img/join.jpg'" style="width: 405px; height: 530px;" />
        </div>
        <form:form action="/user/profile" method="PUT" enctype="multipart/form-data">
        <input type = "hidden" name="id" value="${sessionScope.principal.id}" />
          <h3>Profile Form</h3>
          <div class="form-wrapper">
            <input
              type="text"
              placeholder="UserName"
              class="form-control"
              readonly="readonly"
              value="${sessionScope.principal.username}"
            />
            <i class="zmdi zmdi-account"></i>
          </div>
          <div class="form-wrapper">
            <input
              type="password"
              placeholder="Password"
              class="form-control"
              name="password"
              required="required"
            />
            <i class="zmdi zmdi-lock"></i>
          </div>
          <div class="form-wrapper">
            <input
              type="email"
              placeholder="Email Address"
              class="form-control"
              readonly="readonly"
              value="${sessionScope.principal.email}"
            />
            <i class="zmdi zmdi-email"></i>
          </div>
          <div class="form-wrapper">
            <select name="gender" id="" class="form-control">
              <option value="" disabled selected>Gender</option>
              <option value="male">Male</option>
              <option value="femal">Female</option>
              <option value="other">Other</option>
            </select>
            <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
          </div>
          <div class="form-wrapper">
            <input
              type="file"
              class="form-control"
              name="profile"
            />
            <i class="zmdi zmdi-file"></i>
          </div>
          <button>
            Profile
            <i class="zmdi zmdi-arrow-right"></i>
          </button>
        </form:form>
      </div>
    </div>
  </body>
</html>