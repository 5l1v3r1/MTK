<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            Statement sorgulama=con.createStatement();
            ResultSet sonuc=sorgulama.executeQuery("select * from teklifsonuc");
            int i=1;
            out.println(request.getParameter("firma")+request.getParameter("tid"));
        %>
        <form action="sonuccevapver.jsp" method=post>
            <table border="1">
                <tr>
                    <td>Sonuc</td>
                    <td>
                        <input type=hidden name="tid" value=<%=request.getParameter("tid")%>>
                        <input type=hidden name="firma" value=<%=request.getParameter("firma")%>>
                        <input type=hidden name="statu" value=<%=request.getParameter("statu")%>>
                        <select name="sonuc">
                            <% while(sonuc.next()) { %>
                            <option value=<%=i%>><%=sonuc.getString(1)%></option>
                            <% i++;} %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td>Extra</td>
                <td><input type=text name=extra></td>
                </td>
                <tr>
                    <td colspan="2" align=center><input type=submit value="Cevapla"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>