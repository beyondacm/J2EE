<html>
    <head>
        <title>JSP Declaration</title>
    </head>
    <body>
        <%!
            // ȫ�ֱ���
            int accessCount = 0;
        %>
       
        <%
            // �ֲ�����
            int accessCount2 = 0;
        %>
       
        <h2>AccessCount:
            <br>Overall Variable:<%= ++accessCount %>
            <br>Local Variable:<%= ++accessCount2 %>
        </h2>
       
    </body>
</html>