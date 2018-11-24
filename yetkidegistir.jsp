<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
        int id =Integer.parseInt(request.getParameter("user"));
         String sorgu="select * from kullanicilar where kullaniciid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setInt(1,id);
    ResultSet sonuc=sorgulama.executeQuery();

            sonuc.next();
           
        %>
        <form action="yetkidegistir1.jsp" method=post>
            <input type=hidden name="a" value="<%=id%>">
            <table>
            <tr>
                <th><%=resources.getString("Username")%></td>
                <td><input type=text name="user" value="<%=sonuc.getString(1)%>"></td>
            </tr>
            <tr>
                <th><%=resources.getString("Password")%></td>
                <td><input type=text name="sifre" value="<%=sonuc.getString(2)%>"</td>
            </tr>
            <tr>
                <th>Yetkiler</td>
                <td>
                    <table>
                        <% if(sonuc.getInt(4)==1) { %>
                        <tr><td>Musteri Ekle</td><td><input type=checkbox name="gorme" value="yes" checked></td></tr> <% } else {%>
                        <tr><td>Musteri Ekle</td><td><input type=checkbox name="gorme" value="yes"></td></tr> <% } %>
 <% if(sonuc.getInt(3)==1) { %>
 <tr><td>Musteri Silme</td><td><input type=checkbox name="silme" value="yes" checked></td></tr><% } else {%>
 <tr><td>Musteri Silme</td><td><input type=checkbox name="silme" value="yes"></td></tr><% } %>

<% if(sonuc.getInt(5)==1) { %>
   <tr><td>Musteri Degistirme</td><td><input type=checkbox name="update" value="yes" checked></td></tr><% } else {%>
    <tr><td>Musteri Degistirme</td><td><input type=checkbox name="update" value="yes"></td></tr><% } %>

<% if(sonuc.getInt(6)==1) { %>
 <tr><td>Raporlama</td><td><input type=checkbox name="rapor" value="yes" checked></td></tr><% } else {%>
 <tr><td>Raporlama</td><td><input type=checkbox name="rapor" value="yes"></td></tr><% } %>

<% if(sonuc.getInt(7)==1) { %>
  <tr><td>Proje Ekle</td><td><input type=checkbox name="pekle" value="yes" checked></td></tr><% } else {%>
  <tr><td>Proje Ekle</td><td><input type=checkbox name="pekle" value="yes"></td></tr><% } %>

<% if(sonuc.getInt(8)==1) { %>
 <tr><td>Proje Degistirme</td><td><input type=checkbox name="pupdate" value="yes" checked></td></tr><% } else {%>
 <tr><td>Proje Degistirme</td><td><input type=checkbox name="pupdate" value="yes"></td></tr><% } %>
             
<% if(sonuc.getInt(9)==1) { %>
  <tr><td>Proje Silme</td><td><input type=checkbox name="psilme" value="yes" checked></td></tr><% } else {%>
  <tr><td>Proje Silme</td><td><input type=checkbox name="psilme" value="yes"></td></tr><% } %>

<% if(sonuc.getInt(10)==1) { %>
                        <tr><td>Fatura Kesme</td><td><input type=checkbox name="fatura" value="yes" checked></td></tr><% } else {%>
<tr><td>Fatura Kesme</td><td><input type=checkbox name="fatura" value="yes"></td></tr>      <% } %>

<% if(sonuc.getInt(11)==1) { %>
<tr><td>Teklif Verme</td><td><input type=checkbox name="teklif" value="yes" checked></td></tr><% } else {%>
<tr><td>Teklif Verme</td><td><input type=checkbox name="teklif" value="yes"></td></tr><% } %>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align=center><input type=submit value="Degistir"></td>
            </tr>
            </table>
        </form>
        <p><a href="kullanicilar.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>