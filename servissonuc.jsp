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
            Statement sorgulama=con.createStatement();
            ResultSet sonuc=sorgulama.executeQuery("select * from arizasonucu");
        %>
        <table border="1">
            <tr>
                <th><strong>Ariza Metinleri</strong></td>
                <th><strong>Sil</strong></td>
                <th><strong>Duzenle</strong></td>
            </tr>
            <% while(sonuc.next()){ %>    
            <tr>
                <td><%=sonuc.getString(1)%></td>
                <td><a href="sonucsil.jsp?name=<%=sonuc.getString(1)%>"><%=resources.getString("Delete")%></a></td>
                <td><a href="duzenlesonuc.jsp?name=<%=sonuc.getString(1)%>"><%=resources.getString("Modify")%></a></td>
            </tr>
            <% }%>
        </table>
        <p>Yeni Servis Mesaji Ekle</p>
        <form action="ekleservis.jsp" method=post>
            <input type=text name="mesaj">
            <input type=submit value="ekle">
        </form>
    
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>