<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
 
<%
String action = request.getParameter("action");
if(action != null && action.equals("login")){
	String username = request.getParameter("uname");
	String password = request.getParameter("pwd");
	if(username == null || !username.equals("admin")) {
		%>
		<font color = "white" size = 5>username not correct</font>
		<% 
	}else if(password == null || !password.equals("admin")) {
		%>
		<font color = "white" size = 5>password not correct</font>
		<% 
	}else {
		//session的典型用法
		session.setAttribute("admin", "true");
		response.sendRedirect("ShowArticleTree.jsp");
	}
}
%>    

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="gbk">
    <title>BBS LOGIN</title>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<style type="text/css">
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin h3{
        font-size: 23px;
        color: teal;
        font-family: fantasy;
        /*padding-right: 340px;*/
        /*margin-right: 350px;*/
        /*padding-left: 90px;*/
    }

    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }


    .forget {
        max-width: 165px;
        padding: 10px;
        margin: 0 auto;
    }

    .reg {
        max-width: 165px;
        /*padding: 10px;*/
        margin: 0 auto;
    }

    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
    .form-signin .checkbox {
        font-weight: normal;
    }
    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

</style>

<body>


<div class="container">

    <form class="form-signin" action="Login.jsp" method="post">
    	<input type="hidden" name="action" value="login">
        <!--<div class="container">-->
        <h3 class="form-signin-heading">
            <!--<div class="container">专家汇</div>-->
            BBS administror
        </h3>
        <!--</div>-->
        <label for="inputEmail" class="sr-only">Email address</label>
        <input id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="" type="text" name = "uname">
        <label for="inputPassword" class="sr-only">Password</label>
        <input id="inputPassword" class="form-control" placeholder="Password" required="" type="password" name = "pwd">
        <div class="checkbox">
            <label>
                <input value="remember-me" type="checkbox"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>



    </form>

</div> <!-- /container -->

</body>
</html>

