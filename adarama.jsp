<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String ad=request.getParameter("ad");
            String sorgu="select * from musteri where firma_adi LIKE ? and statu=1";
            PreparedStatement sorgulama=con.prepareStatement(sorgu);
            sorgulama.setString(1,ad+'%');
            ResultSet sonuc=sorgulama.executeQuery();
        %>
        <table cellpadding="4" border=""1>
            <tr>
                <th nowrap><b>Projeler</b></td>
                <th nowrap><b>Guncelle</b></td>
                <th nowrap><b>Kayit Sil</b></td>
                <th nowrap><b>M.No</b></td>
                <th nowrap><b>Firma Adi</b></td>
                <th nowrap><b>Sokak/No</b></td>
                <th nowrap><b>Cadde</b></td>
                <th nowrap><b>Semt</b></td>
                <th nowrap><b>Ilce</b></td>
                <th nowrap><b>Il</b></td>
                <th nowrap><b>PostaKodu</b></td>
                <th nowrap><b>Yetkili_Kisi</b></td>
                <th nowrap><b>Tel1</b></td>
                <th nowrap><b>Tel2</b></td>
                <th nowrap><b>Dahili_No</b></td>
                <th nowrap><b>Cep_Tel</b></td>
                <th nowrap><b>Faks_No</b></td>
                <th nowrap><b>Email Adresi</b></td>
            </tr>
            <%
                int modul=1;
                String fonrengi;

                while(sonuc.next()) {
                    if(modul%2==1)
                        fonrengi="green";
                    else
                        fonrengi="red";
                %>
            <tr>
                <td nowrap><a href="projeler.jsp?id=<%=sonuc.getString(1)%>&ad=<%=ad%>">Projeler</a></td>
                <td nowrap><a href="cv.jsp?id=<%=sonuc.getString(1)%>&ad=<%=ad%>">Guncelle</a></td>
                <td nowrap><a href="delete1.jsp?id=<%=sonuc.getString(1)%>&ad=<%=ad%>">Kayit Sil</a></td>
                <td nowrap><%=sonuc.getString(1)%></td>
                <td nowrap><%=sonuc.getString(2)%></td>
                <td nowrap><%=sonuc.getString(3)%></td>
                <td nowrap><%=sonuc.getString(4)%></td>
                <td nowrap><%=sonuc.getString(5)%></td>
                <td nowrap><%=sonuc.getString(6)%></td>
                <td nowrap><%=sonuc.getString(7)%></td>
                <td nowrap><%=sonuc.getString(8)%></td>
                <td nowrap><%=sonuc.getString(9)%></td>
                <td nowrap><%=sonuc.getString(10)%></td>
                <td nowrap><%=sonuc.getString(11)%></td>
                <td nowrap><%=sonuc.getString(12)%></td>
                <td nowrap><%=sonuc.getString(13)%></td>
                <td nowrap><%=sonuc.getString(14)%></td>
                <td nowrap><%=sonuc.getString(15)%></td>
            </tr>
            <% modul++;
            }
                    %>
            </table>
        <p><a href="girismusteri.jsp">Geri</a></p> 
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>
