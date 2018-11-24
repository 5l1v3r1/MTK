<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            HttpSession onemli=request.getSession(true);
            onemli.removeValue("user");
            onemli.removeValue("pas");
            onemli.removeValue("ekleme");
            onemli.removeValue("bilgiler");
            onemli.removeValue("degistirme");
            onemli.removeValue("raporlama");
            onemli.removeValue("projeekle");
            onemli.removeValue("projeduzelt");
            onemli.removeValue("projesil");
            onemli.removeValue("faturakes");
            onemli.removeValue("teklif");
        %>
        <table align=center border="1" cellspacing="0" id="AutoNumber1" cellpadding="3" style="border-collapse: collapse" bordercolor="#808080" bgcolor="#E8E8E8">
            <form action="login2.jsp" method=post>
            <tr>
                <td><%=resources.getString("Username")%>&nbsp;</td>
                <td><input type=text name="user"></td>
            </tr>
            <tr> 
                <td><%=resources.getString("Password")%>&nbsp;</td>
                <td><input type=password name="pas"></td>
            </tr>
        
            <tr>
                <td align=center colspan="2"><input type=submit value="login"></td>
            </tr>
        </table>
    </body>
</html>
<%@ include file="ResourceEnd.jsp" %>