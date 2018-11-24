<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String potansiyel=request.getParameter("potansiyel");
            String red=request.getParameter("red");

            int p,r;

            if(potansiyel==null)
                p=0;
            else
                p=1;

            if(red==null)
                r=1;
            else
                r=2;

            java.text.DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd");
            String bay=request.getParameter("bay");
            String bgun=request.getParameter("bgun");
            String byil=request.getParameter("byil");
            String tay=request.getParameter("tay");
            String tgun=request.getParameter("tgun");
            String tyil=request.getParameter("tyil");
            String baslangic=byil+"-"+bay+"-"+bgun;
            String bitis=tyil+"-"+tay+"-"+tgun;

            String sorgu="select b.firma_adi,b.konu,b.tarih,b.username,b.durum,a.statu,b.filename,b.extra,b.extra2 from musteri a,teklif b where a.firma_adi=b.firma_adi and b.durum!=0 and b.firma_adi LIKE ? and b.konu LIKE ? and b.tarih>=? and b.tarih<=? and b.username LIKE ? and b.durum=? and a.statu=?";
            PreparedStatement sorgulama=con.prepareStatement(sorgu);
            sorgulama.setString(1,request.getParameter("firmaadi")+'%');
            sorgulama.setString(2,request.getParameter("konu")+'%');
            sorgulama.setDate(3,new java.sql.Date(df.parse(baslangic).getTime()));
            sorgulama.setDate(4,new java.sql.Date(df.parse(bitis).getTime()));
            sorgulama.setString(5,request.getParameter("username")+'%');
            sorgulama.setInt(6,r);
            sorgulama.setInt(7,p);
            ResultSet sonuc=sorgulama.executeQuery();

        %>
   
        <table border="1">
            <tr>
                <th><strong>Firma Adi</strong></td>
                <th><strong>Teklif Goturulen Konu</strong></td>
                <th><strong>Teklif Dosyasina Bak</strong></td>
                <th><strong>Teklifi Goturen Kullanici</strong></td>
                <th><strong>Tarih</strong></td>
                <th><strong>Durum</strong></td>
                <th><strong>Not</strong></td>
                <th><strong>Kabul olma yada olmama Sebebi</strong></td>
            </tr>
            <% while(sonuc.next()) { %>
            <tr>
                <td><%=sonuc.getString(1)%></td>
                <td><%=sonuc.getString(2)%></td>
                <td><a href="uploads/<%=sonuc.getString(7)%>">Bak</a></td>
                <td><%=sonuc.getString(4)%></td>
                <td><%=sonuc.getDate(3)%></td>
                <td><%if(sonuc.getInt(5)==1){ out.println("Kabul Edildi"); } else { out.println("Red Eddildi"); } %></td>
                <td><%=sonuc.getString(8)%></td>
                <td><%=sonuc.getString(9)%></td>
            </tr>
            <% } %>
        </table>
        <p><a href="teklifrapor.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>