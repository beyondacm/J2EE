<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import = "com.gzp.shopping.*"%>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.trim().equals("register")) {
	String username = request.getParameter("username");
	//�ڷ������˽��м�� ��ֹ�û��ڿͻ��˰� js ����ɾ��Ȼ���Լ������������������
	//TODO make sure username is valid �ͻ�����ô���������˾���ô���
	
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	//TODO make suer password = passwod2
	
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	User u = new User(username, password, phone, addr);
	u.save();
	out.println("Congratulations!Register OK!");
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
    <form class="form-signin" role="form" name="form" action="register.jsp" method="post"
    onsubmit="return checkdata()">
    	<!-- �����ֶ��ж����ύ�����Ļ���ֱ�ӷ��ʵ� -->
    	<input type="hidden" name="action" value="register">
        <h2 class="form-signin-heading">
            	��������!
        </h2>
        <!-- <input class="form-control" type="email" id="email" autofocus="" required="" placeholder="Email" onblur="checkformname()"> </input> -->
        <input name = "username" class="form-control" type="text" id="userid" autofocus="" required="" placeholder="�û���"> </input>            
        <input name = "password" class="form-control" type="password" id="pwd" required="" placeholder="����"> </input>
        <input name = "password2" class="form-control" type="password" id="confirm_pwd" required="" placeholder="ȷ������"> </input>
        <input name = "phone" class="form-control" type="text" id="phone" required="" placeholder="�绰"> </input>
        <textarea name = "addr" class="form-control" rows="4" placeholder="���������ĵ�ַ"></textarea>
        
        <div class="checkbox">
        <label>
                <input type="checkbox" value="remember-me">
                	�����Ķ���ͬ����صķ�������
                </input>
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">
            		����ע��
        </button>
        <div class="log"> �Ѿ����˻�������<a href="#">��¼</a></div>


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