

<html>
    <head>
        <title>JSP Expressions</title>
    </head>
    <!--���ʽ-->
    <body>
        <h2>JSP Expressions</h2>
       
    <UL>
        <!--��ȡ��ǰ����ʱ��-->
        <LI>Current Time:<%= new java.util.Date().toLocaleString() %>
        <LI>Your HostName:<%= request.getRemoteHost() %>
        <!--��ȡ��ǰҳ���SessionID-->
        <LI>Your Session Id:<%= session.getId() %>
        <LI>The <code>testParam</code> from parameter:<%= request.getParameter("testParam") %>
    </UL>
   
    </body>
</html>