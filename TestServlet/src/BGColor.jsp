<html>
    <head>
        <title>Color Testing</title>
    </head>
   
    <!--
    HTMLע��
    �ͻ��˿��Կ���
    -->
   
    <%--
    JSPע��
    �ͻ��˿�����
    --%>
   
   
    <%
    //ע��2
    /*
    ע��3
    */
    // �������в���bgColor��ֵ�ù���������û�д������������ֵΪnull
    String bgColor = request.getParameter("bgColor");
    boolean hasColor;
    if(bgColor != null) {
        hasColor = true;
    } else {
        hasColor = false;
        bgColor = "white";
    }
    %>
       
        <!--��ʾ����ɫ-->
    <body bgcolor="<%= bgColor%>">
    <h2 align="center">Color Testing</h2>
   
    <%
    if(hasColor) {
        out.println("You supplied a backgroud color of " + bgColor + ".");
    } else {
        out.println("Use Default backgroud color of white");
    }
    %>
       
    </body>
</html>