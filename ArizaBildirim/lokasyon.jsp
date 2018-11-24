<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>
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
    
    PreparedStatement sorgulama=con.prepareStatement("select name from lokasyon where id=?");
            sorgulama.setInt(1,Integer.parseInt(request.getParameter( "id")));
                ResultSet sonuc=sorgulama.executeQuery();

                sonuc.next();
                String name=sonuc.getString(1);
    %>
    
    
     <form action="lokasyon.jsp" method=post >
            <table align=center border="1">
                <tr>
                    <th>Lokasyon adı</td>
                    <td><input type=text name="ad" value="<%=name%>"></td>
                    <input type=hidden value="<%=request.getParameter("id")%>" name="id">

                </tr>
                
                <tr>
                    <td colspan="2" align=center><input name="guncelleSubmit" type=submit value="gonder"></td>
                </tr>
            </table>
                <p align="center"><a href="lokasyon.jsp">Geri</a></p>
        </form>
    
    <%
}

else if (request.getParameter("guncelleSubmit")!=null)
{
    
   // out.print(request.getParameter("sifre"));
            PreparedStatement sorgulama=con.prepareStatement("update lokasyon set name=? where id=?");
            sorgulama.setString(1,request.getParameter("ad"));
            sorgulama.setInt(2,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("lokasyon.jsp");
        %>
        <p><a href="lokasyon.jsp">Geri</a></p><%
}

else if(request.getParameter("delete")!=null)
{
     PreparedStatement ps=con.prepareStatement("delete from lokasyon where id=?");
            ps.setInt(1,Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("lokasyon.jsp");
    
}

else if(request.getParameter("ekleme")!=null)
{
    %>
    <p align="center">  <b align="center"> Lokasyon Ekleme</b></p>
    <hr>
      <table align=center>   
            <form action="lokasyon.jsp" method=post>
                <tr>
                    <th>Lokasyon Adi</td>
                    <td><input type=text name="ad"></td>
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
    PreparedStatement sorgulama=con.prepareStatement("insert into lokasyon (name) values(?)");
            sorgulama.setString(1,request.getParameter( "ad"));
            sorgulama.executeUpdate();
            response.sendRedirect("lokasyon.jsp");
    
}
else{
    
            Statement st=con.createStatement();
            ResultSet sonuc=st.executeQuery("select * from lokasyon");
            
            %>
        <table align="center">    
            <tr>
                <th>Lokasyon Adı</td>
                 <th>Bilgileri Degistir</td>
                <th>Kullanıcıyı Sil</td>
            </tr>
           <% while(sonuc.next()){ 
            %>     
            <tr>
                
                <td><%=sonuc.getString(2)%></td>
                <td><a href="lokasyon.jsp?guncelle=guncelle&&name=<%=sonuc.getString(2)%>&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Modify")%></a></td>
                <td><a href="lokasyon.jsp?delete=delete&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Delete")%></a></td>
            </tr>
            <% }  %>
        </table>
        <p align="center"><a  href="lokasyon.jsp?ekleme=ekleme">Lokasyon Ekle</a></p>
        <p align="center"><a  href="ArizaBildirim.jsp">Geri</a></p>

        <%@include file="disconnect.jsp"%>
         <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

