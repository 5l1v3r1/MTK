<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String sorgu="select * from yapilanis where musteri_id=?";
            PreparedStatement sorgulama=con.prepareStatement(sorgu);
            sorgulama.setInt(1,Integer.parseInt(request.getParameter("id")));
            ResultSet sonuc=sorgulama.executeQuery();
            int i=0;
            String firmaname=request.getParameter("name");
            java.util.Date d=new java.util.Date();
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        %>
        <table border="1">
            <tr>
                <th><b>Firma Adi</b></td>
                <th><b>Proje No</b></td>
                <th><b>Yapilan Isin Cinsi</b></td>
                <th><b>Teslim Tarihi</b></td>
                <th><b>Tutar</b></td>
                <th><b>Birim</b></td>
                <th><b>Bilgi</b></td>
                <th><b>Garanti Suresi</b></td>
                <td><b>Son Kullanicisi</b></td>
                <th><b>Proje Ekle</b></td>
                <th><b>Proje Duzelt</b></td>
                <th><b>Proje Sil</b></td>
                <th><b>Servis Antlasmasi</b></td>
            </tr>
            <%
                while(sonuc.next()) {
                    String sorgu2="select count(*) from servisantlasmasi where projeno=? ";
                    PreparedStatement sorgulama2=con.prepareStatement(sorgu2);
                    sorgulama2.setString(1,sonuc.getString(3));
                    ResultSet sonuc2=sorgulama2.executeQuery();
                    sonuc2.next();
                    String sorgu3="select * from servisantlasmasi where projeno=?";
                    PreparedStatement sorgulama3=con.prepareStatement(sorgu3);
                    sorgulama3.setString(1,sonuc.getString(3));
                    ResultSet sonuc3=sorgulama3.executeQuery();
                    sonuc3.next();
                %>
            <tr>
            <td><%=sonuc.getString(2)%></td>
            <td><%=sonuc.getString(3)%></td>  
            <td width="120"><%=sonuc.getString(4)%></td>    
            <%
                try{ %>
            <td><%=sonuc.getDate(5)%></td>
            <%}   catch(Exception e){ }%>
            <td><%=sonuc.getFloat(6)%></td>
            <td><%=sonuc.getString(9)%></td>
            <td><%=sonuc.getString(7)%></td>  
            <td><%=sonuc.getInt(8)%></td>
            <td><%=sonuc.getString(10)%></td>
            <td><a href="projeekle2.jsp?id=<%=sonuc.getInt(1)%>&&name=<%=sonuc.getString(2)%>">Proje Ekle</a></td>
            <td><a href="projeduzelt.jsp?id=<%=sonuc.getString(3)%>">Proje Duzelt</a></td>
            <td><a href="silproje.jsp?id=<%=sonuc.getString(3)%>&&nam=<%=sonuc.getInt(1)%>&&isim=<%=firmaname%>">Proje sil</a></td>
            <% if(Integer.parseInt(sonuc2.getString(1))>0){ 
                    try{
                        if(df.format(sonuc3.getDate(3)).compareTo(df.format(d))==0){
                            i=1;%>
            <td><a href="baksaozel.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasinin Son gunu</a></td><% }}catch(Exception e){ out.println(e.getMessage());}  %>
            <%  if(sonuc3.getDate(3).before(d)&&i!=1){ %>
            <td><a href="updateservis.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Bitmis Tekrar Yapmak icin tiklayin</a></td>    <% } else if(i!=1) {%>        
            <td><a href="baksaozel.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Var Bakmak icin tiklayin</a></td><% } } %>
            <% if(Integer.parseInt(sonuc2.getString(1))==0){ %>
            <td><a href="servisantlasmasiyap.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Yok Yapmak icin tiklayin</a></td><% } %>
            <%  
                i=0;
                }
            %>
        </table>
        <p><a href="projeekle.jsp">Ayri Proje Ekle</a></p>
        <p><a href="girismusteri.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>