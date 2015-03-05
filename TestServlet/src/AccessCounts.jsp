<html>
    <head>
        <title>JSP Declaration</title>
    </head>
    <body>
        <%!
            // 全局变量
            int accessCount = 0;
        %>
       
        <%
            // 局部变量
            int accessCount2 = 0;
        %>
       
        <h2>AccessCount:
            <br>Overall Variable:<%= ++accessCount %>
            <br>Local Variable:<%= ++accessCount2 %>
        </h2>
       
    </body>
</html>