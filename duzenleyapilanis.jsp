<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    <% 
    String namea=request.getParameter("name");
    %>
    
    <table>
            <form action="dy1.jsp" method=post>
                <tr>
                <th width="50">Is:</td>
                    <td><input type=text value="<%=namea%>" name="name"></td>
                </tr>
                <tr>
                    <td colspan=2 align="right"><input type=submit value="degistir">
                    <input type=hidden value="<%=namea%>" name="namea">
                    </td>
                </tr>
            </form>
        </table>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>