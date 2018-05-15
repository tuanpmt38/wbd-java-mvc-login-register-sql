<%--
  Created by IntelliJ IDEA.
  User: minhtuan
  Date: 5/15/18
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("login")!=null) {
        response.sendRedirect("welcome.jsp");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>index</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/styles.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/login.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script language="javascript">
    function validatelg() {
        var username = document.LoginForm.txt_username;
        var password = document.LoginForm.txt_password;

        if (username.value == null || username.value == "") {
            window.alert("please enter username ?");
            username.style.background = '#f08080';
            username.focus();
            return false;
        }
        if (password.value == null || password.value == "") {
            window.alert("please enter password ?");
            password.style.background = '#f08080';
            password.focus();
            return false;
        }
    }
</script>

<body>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-login">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-12">
              <a href="#" class="active text-center" id="login-form-link">Login</a>
            </div>

          </div>
          <hr>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-lg-12">
              <form id="login-form" action="/login" method="post" name="LoginForm" onsubmit="return validatelg();" role="form" style="display: block;">
                <div class="form-group">
                  <input type="text" name="txt_username"  tabindex="1" class="form-control" placeholder="Username" value="">
                </div>
                <div class="form-group">
                  <input type="password" name="txt_password"  tabindex="2" class="form-control" placeholder="Password">
                </div>
                <div class="form-group text-center">
                  <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                  <label for="remember"> Remember Me</label>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                      <input type="submit" name="login-submit" value="Login" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                        <h3>Your don't have a account? <a href="register.jsp">Register</a></h3>
                    </div>
                  </div>
                </div>
                  <h3 style="color:green">
                      <%
                          if(request.getAttribute("RegiseterSuccessMsg")!=null)
                          {
                              out.println(request.getAttribute("RegiseterSuccessMsg"));
                          }
                      %>
                  </h3>

                  <h3 style="color:red">
                      <%
                          if(request.getAttribute("WrongLoginMsg")!=null)
                          {
                              out.println(request.getAttribute("WrongLoginMsg"));
                          }
                      %>
                  </h3>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>