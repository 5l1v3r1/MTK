<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>

<%@ include file="Resource.jsp" %>
<html>
    <head>
              <link rel="stylesheet" href="mtk.css" type="text/css">

        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}

else if(request.getParameter("guncelle")!=null){
    
    %>
    
    
     <form action="personel.jsp" method=post >
            <table align=center border="1">
                <tr>
                    <th>Kullanıcı adı</th>
                  <input type=hidden value="<%=request.getParameter("id")%>" name="id">

                    <td><input type=text name="ad" value="<%=request.getParameter("name")%>"></td>

                </tr>
                <tr>
                <th>Email</th>
                  <td><input type=text name="email" value="<%=request.getParameter("email")%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input name="guncelleSubmit" type=submit value="gonder"></td>
                </tr>
            </table>
                <p align="center"><a href="personel.jsp">Geri</a></p>
        </form>
    
    <%
}

else if (request.getParameter("guncelleSubmit")!=null)
{
    
   // out.print(request.getParameter("sifre"));
            PreparedStatement sorgulama=con.prepareStatement("update external_user set username=?, email=? where id=?");
            sorgulama.setString(1,request.getParameter("ad"));
            sorgulama.setString(2,request.getParameter("email"));
            sorgulama.setInt(3,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("personel.jsp");
        %>
        <p><a href="personel.jsp">Geri</a></p><%
}

else if(request.getParameter("delete")!=null)
{
     PreparedStatement ps=con.prepareStatement("delete from external_user where id=?");
            ps.setInt(1,Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("personel.jsp");
    
}

else if(request.getParameter("ekleme")!=null)
{
    %>
    <p align="center">  <b align="center"> Kullanıcı Ekleme</b></p>
    <hr>
      <table align=center>   
            <form action="personel.jsp" method=post>
                <tr>
                    <th>Kullanıcı Adi</td>
                    <td><input type=text name="ad"></td>
                </tr>
                <tr>
                    <th>Şifre</td>
                    <td><input type=text name="sifre"></td>
                </tr>
                <tr>
                    <th>E-Mail</td>
                    <td><input type=text name="email"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit name="kullaniciekle" value="Ekle"></td>
                </tr>  
            </form>
        </table>
<%    
    
}

else if(request.getParameter("kullaniciekle")!=null)
{
    PreparedStatement sorgulama=con.prepareStatement("insert into external_user (username,password,email) values(?,?,?)");
            sorgulama.setString(1,request.getParameter( "ad"));
            sorgulama.setString(2,request.getParameter( "sifre"));
            sorgulama.setString(3,request.getParameter( "email"));
            sorgulama.executeUpdate();
            response.sendRedirect("personel.jsp");
    
}
else{
    
            Statement st=con.createStatement();
            ResultSet sonuc=st.executeQuery("select * from external_user");
            %>
        <table align="center">    
            <tr>
                <th>Kullanıcı Adı</td>
                <th>Email</td>
                 <th>Bilgileri Degistir</td>
                <th>Kullanıcıyı Sil</td>
            </tr>
            <% while(sonuc.next()){ 
            
            if(sonuc.getString(2).compareTo("admin")==0)
                continue;
            
            %>     
            <tr>
                
                <td><%=sonuc.getString(2)%></td>
                <td><%=sonuc.getString(4)%></td>
                <td><a href="personel.jsp?guncelle=guncelle&&name=<%=sonuc.getString(2)%>&&email=<%=sonuc.getString("email")%>&&surname=<%=sonuc.getString(3)%>&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Modify")%></a></td>
                <td><a href="personel.jsp?delete=delete&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Delete")%></a></td>
            </tr>
            <% }  %>
        </table>
        <p align="center"><a  href="personel.jsp?ekleme=ekleme">Kullanıcı Ekle</a></p>
        <p align="center"><a  href="ArizaBildirim.jsp">Geri</a></p>

        <%@include file="disconnect.jsp"%>
       <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

