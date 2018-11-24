<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            HttpSession onemli=request.getSession();
            if(onemli.getValue("pas")!="gecerli") {
                response.sendRedirect("login.jsp");
            }
            %>
        <form action="adminsifre.jsp" method=post>
            <table>
                <tr>
                    <th align="left"><%=resources.getString("OldPassword")%></td>
                    <td><input type=password name="sifre"></td>
                </tr>
                <tr>
                    <th align="left"><%=resources.getString("NewPassword")%></td>
                    <td><input type=password name="ysifre"> </td>
                </tr>
                <tr>
                    <th align="left"><%=resources.getString("NewPasswordAgain")%></td>
                    <td><input type=password name="tekrarsifre"></td>
                </tr>
                <tr>
                    <td colspan=2 align="right"><input type=submit value="degistir"></td>
                </tr>
            </table>
        </form>
       
    </body>
    <%@include file="disconnect.jsp"%>
</html>
<%@ include file="ResourceEnd.jsp" %>