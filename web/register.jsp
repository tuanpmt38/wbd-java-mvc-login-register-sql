<%--
  Created by IntelliJ IDEA.
  User: minhtuan
  Date: 5/15/18
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<% if (session.getAttribute("login") != null) {
    response.sendRedirect("index.jsp");
}
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>register</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/styles.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/login.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
    //validate form register
    function validate() {
        var first_name = /^[a-z A-Z]+$/;
        var last_name = /^[a-z A-Z]+$/;
        var user_name = /^[a-z A-Z]+$/;
        var password_valid = /^[A-Z a-z 0-9]{6,12}$/;

        var fname = document.getElementById("fname");
        var lname = document.getElementById("lname");
        var uname = document.getElementById("uname");
        var password = document.getElementById("password");

        if (!first_name.test(fname.value) || fname.value == '')  {
            alert("Enter Firstname Alphabet Only....!");
            fname.focus();
            fname.style.background = '#f08080';
            return false;
        }
        if (!last_name.test(lname.value) || lname.value == '') {
            alert("Enter Lastname Alphabet Only....!");
            lname.focus();
            lname.style.background = '#f08080';
            return false;
        }
        if (!user_name.test(uname.value) || uname.value == '') {
            alert("Enter Username Alphabet Only....!");
            uname.focus();
            uname.style.background = '#f08080';
            return false;
        }
        if (!password_valid.test(password.value) || password.value == '') {
            alert("Password Must Be 6 to 12 character");
            password.focus();
            password.style.background = '#f08080';
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
                            <a href="#" class ="text-center" id="register-form-link">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">

                            <form id="register-form" action="/register" method="post" onsubmit="return validate();" role="form" style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="fist_name" id="fname" tabindex="1" class="form-control" placeholder="fist name" value="">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="last_name" id="lname" tabindex="1" class="form-control" placeholder="last name" value="">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="txt_username" id="uname" tabindex="2" class="form-control" placeholder="user name">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="txt_password" id="password" tabindex="2" class="form-control" placeholder="password">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" value="Register" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <h3 style="color:red">
                                <%
                                    if (request.getAttribute("RegisterErrorMsg") != null) {
                                        out.println(request.getAttribute("RegisterErrorMsg"));
                                    }
                                %>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>