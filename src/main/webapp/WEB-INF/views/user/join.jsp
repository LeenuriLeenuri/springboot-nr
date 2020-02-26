<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Join</title>
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
          <img src="/img/user-img/join.jpg" alt="" />
        </div>
        <form>
          <h3>Join Form</h3>
          <div class="form-wrapper">
            <input type="text" placeholder="UserName" class="form-control" id="username" maxlength="20"/>
            <i class="zmdi zmdi-account"></i>
          </div>
          <div class="form-wrapper">
            <input
              type="password"
              placeholder="Password"
              class="form-control"
              id="password"
               maxlength="20"
            />
            <i class="zmdi zmdi-lock"></i>
          </div>
          <div class="form-wrapper">
            <input
              type="email"
              placeholder="Email Address"
              class="form-control"
              id="email"
               maxlength="50"
            />
            <i class="zmdi zmdi-email"></i>
          </div>
          <div class="form-wrapper">
            <select name="" id="gender" class="form-control">
              <option value="" disabled selected>Gender</option>
              <option value="male">Male</option>
              <option value="femal">Female</option>
              <option value="other">Other</option>
            </select>
            <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
          </div>
          <button id="join--submit">
            Join
            <i class="zmdi zmdi-arrow-right"></i>
          </button>
        </form>
      </div>
    </div>
    
    <script>
    $('#join--submit').on('click', function() {
		var data = {
			username : $('#username').val(),
			password : $('#password').val(),
			email : $('#email').val(),
			gender : $('#gender').val()
		};

		$.ajax({
			type : 'POST',
			url : '/user/join',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'

		}).done(function(r) {
			if (r.statusCode == 200) {
				alert('회원가입 성공');
				location.href = '/user/login';
			} else {
				if (r.msg == '아이디중복') {
					alert('아이디가 중복 되었습니다.');
				} else {
					alert('회원가입 실패1');
				}

			}
		}).fail(function(r, XMLHttpRequest, textStatus) {
			alert('회원가입 실패2');
			console.log('XMLHttpRequest: ' + XMLHttpRequest);
			console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
			console.log('textStatus: ' + textStatus);
			console.log('textStatus: ' + textStatus.status);
		});
	});
    </script>
    
  </body>
</html>