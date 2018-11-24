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
        <form action="personelguncelle1.jsp" method=post >
            <table align=center border="1">
                <tr>
                    <th>Personel Adi</td>
                    <td><input type=text name="ad" value="<%=request.getParameter("name")%>"></td>
                </tr>
                <tr>
                    <input type=hidden value="<%=request.getParameter("id")%>" name="id">
                    <th>Personel Soyadi</td>
                    <td><input type=text name="soyad" value="<%=request.getParameter("surname")%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit value="gonder"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@include file="ResourceEnd.jsp" %>