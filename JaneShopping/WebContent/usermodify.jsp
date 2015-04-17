<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import = "com.gzp.shopping.*"%>
<%@ page import = "java.sql.*" %>

<%
User u = (User)session.getAttribute("user");
if( u == null ) {
	out.println("You have not login!");
	return ;
}
%>


<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.trim().equals("modify")) {
	String username = request.getParameter("username");
	//在服务器端进行检查 防止用户在客户端把 js 代码删掉然后自己往服务器传错误参数
	//TODO make sure username is valid 客户端怎么检查服务器端就怎么检查
	
	
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);

	u.update();
	out.println("Congratulations!Update OK!");
	return;
}
%>

    
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="GB18030">
    <title>Register</title>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="script/regcheckdata.js"></script>
    <style>
		body {
		    padding-top: 40px;
		    padding-bottom: 40px;
		    background-color: #101010;
		}
		
		h2{
		    color: #f5f5f5;
		    font-family: Arial, Helvetica, sans-serif;
		}
		
		.form-signin {
		    max-width: 330px;
		    padding: 15px;
		    margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox{
		    margin-bottom: 10px;
		}
		
		.form-signin .checkbox
		{
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
		
		.form-control{
		    /*margin: 15px;*/
		}
		
		.log{
		    position: inherit;
		    padding-top: 10px;
		    padding-right: 0px;
		    color: gray;
		}
		
		.checkbox{
		    color: gray;
		}
		
		.form-signin input[type="email"] {
		    /*margin-bottom: -1px;*/
		    /*border-bottom-right-radius: 0;*/
		    /*border-bottom-left-radius: 0;*/
		    /*margin: 15px;*/
		}
		.form-signin input[type="password"] {
		    /*margin-bottom: 10px;*/
		    /*border-top-left-radius: 0;*/
		    /*border-top-right-radius: 0;*/
		    /*margin: 15px;*/
		}
		.form-signin input[ id="email"] {
		    /*margin-bottom: -1px;*/
		    border-bottom-right-radius: 0;
		    border-bottom-left-radius: 0;
		    /*margin: 15px;*/
		}
		.form-signin input[ id="username"] {
		    /*margin-bottom: 10px;*/
		   /*  border-top-left-radius: 0;
		    border-top-right-radius: 0;
		    border-bottom-right-radius: 0;
		    border-bottom-left-radius: 0; */
		    border-bottom-right-radius: 0;
		    border-bottom-left-radius: 0;
		    /*margin: 15px;*/
		}
		
		.form-signin input[  id="pwd"] {
		    /*margin-bottom: 10px;*/
		    border-top-left-radius: 0;
		    border-top-right-radius: 0;
		    border-bottom-right-radius: 0;
		    border-bottom-left-radius: 0;
		    /*margin: 15px;*/
		}
		
		.form-signin input[id="confirm_pwd"] {
		    /*margin-bottom: 10px;*/
		    border-top-left-radius: 0;
		    border-top-right-radius: 0;
		    border-bottom-right-radius: 0;
		    border-bottom-left-radius: 0;
		    /*margin: 15px;*/
		}
		
		.form-signin input[id="vtf"] {
		    /*margin-bottom: 10px;*/
		    border-top-left-radius: 0;
		    border-top-right-radius: 0;
		    /*margin: 15px;*/
		}
    </style>
</head>
<body>
	<div class="container">
	<!-- action= "usermodify.jsp"表示提交到自身  -->
    <form class="form-signin" role="form" name="form" action="usermodify.jsp" method="post">
    
    	<!-- 隐含字段判断是提交过来的还是直接访问的 -->
    	<input type="hidden" name="action" value="modify">
    
        <h2 class="form-signin-heading">
            	用户信息修改
        </h2>
        
        <input name = "username" class="form-control" type="text" id="userid" autofocus="" required="" placeholder="用户名" value= <%= u.getUsername() %> > </input>            
         
        <!--
        <input name = "password" class="form-control" type="password" id="pwd" required="" placeholder="密码" > </input>
        <input name = "password2" class="form-control" type="password" id="confirm_pwd" required="" placeholder="确认密码"> </input>
        -->
        
        <input name = "phone" class="form-control" type="text" id="phone" required="" placeholder="电话" value = <%= u.getPhone()%> > </input>
        <textarea name = "addr" class="form-control" rows="4" placeholder="请输入您的地址" ><%= u.getAddr()%></textarea>
        
      
        <button class="btn btn-lg btn-primary btn-block" type="submit">
            		保存信息
        </button>


    </form>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>