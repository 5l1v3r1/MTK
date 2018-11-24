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
            Statement st=con.createStatement();
            ResultSet sonuc=st.executeQuery("select * from personel");
            %>
        <table>    
            <tr>
                <th>Personel Id</td>
                <th>Personel Adi</td>
                <th>Personel Soyadi</td>
                <th>Bilgileri Degistir</td>
                <th>Personeli Sil</td>
            </tr>
            <% while(sonuc.next()){ %>     
            <tr>
                <td><%=sonuc.getInt(1)%></td>
                <td><%=sonuc.getString(2)%></td>
                <td><%=sonuc.getString(3)%></td>
                <td><a href="personelguncelle.jsp?name=<%=sonuc.getString(2)%>&&surname=<%=sonuc.getString(3)%>&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Modify")%></a></td>
                <td><a href="personelsil.jsp?id=<%=sonuc.getInt(1)%>"><%=resources.getString("Delete")%></a></td>
            </tr>
            <% } %>
        </table>
        <p><a href="personelekle.jsp">Personel Ekle</a></p>
        <%@include file="disconnect.jsp"%>
       
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>