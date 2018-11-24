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
            ResultSet sonuc=sorgulama.executeQuery("select * from teklif where durum=0 order by tarih");
        %>
        <h2>Cevap Bekleyen Isler</h2>
        <table border="1">
            <tr>
                <td><strong>Firma Adi</strong></td>
                <td><strong>Konu</strong></td>
                <td><strong>Teklifi Veren</strong></td>
                <td><strong>Tarih</strong></td>
                <td><strong>Teklif Dosyasi</strong></td>
                <td><strong>Extra</strong></td>
                <td><strong>Potansiyel Musteri</strong></td>
                <td><strong>Cevap Ver</strong></td>
            </tr>
            <% while(sonuc.next()) { %>
            <%
                PreparedStatement sorgulama2=con.prepareStatement("select statu from musteri where firma_adi=?");
                sorgulama2.setString(1,sonuc.getString(2));
                ResultSet sonuc2=sorgulama2.executeQuery();
                String statu="";

                if(sonuc2.next()) {
                    if(Integer.parseInt(sonuc2.getString(1))==1)
                        statu="Evet";
                    else
                        statu="Hayir";
                } else {
                    statu="hayir";
                }
                %>
            <tr>
                <td><%=sonuc.getString(2)%></td>
                <td><%=sonuc.getString(3)%></td>
                <td><%=sonuc.getString(5)%></td>
                <td><%=sonuc.getDate(6)%></td>
                <td><a href="uploads/<%=sonuc.getString(4)%>">Bak</a></td>
                <td><%=sonuc.getString(8)%></td>
                <td><%=statu%></td>
                <td><a href="cevapver.jsp?tid=<%=sonuc.getInt(1)%>&&statu=<%=statu%>&&firma=<%=sonuc.getString(2)%>">Cevap Ver</a></td>
            </tr>
            <% } %>
        </table>
        <p><a href="teklif1.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>