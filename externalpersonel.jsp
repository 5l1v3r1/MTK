<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>

<%@ include file="Resource.jsp" %>
<html>
    <head>
        
    <script>
        
        function confirmDel() {
 var agree=confirm("Kullanıcı şifresi 123456 olarak resetlenecek ?\nBu işlem geri alınamaz!");
 if (agree) {
  return true ; }
 else {
  return false ;}
}
    
</script>  
              <link rel="stylesheet" href="mtk.css" type="text/css">

        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%

 HttpSession onemli=request.getSession();
            if(onemli.getValue("pas")!="gecerli") {
                response.sendRedirect("login.jsp");
            }


 if(request.getParameter("guncelle")!=null){
    
    %>
    
    
     <form action="externalpersonel.jsp" method=post >
            <table align=center border="1">
                
                <tr>
                <th>Email</th>
                                  <input type=hidden value="<%=request.getParameter("id")%>" name="id">

                  <td><input type=text name="email" value="<%=request.getParameter("email")%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input name="guncelleSubmit" type=submit value="gonder"></td>
                </tr>
            </table>
                <p align="center"><a href="externalpersonel.jsp">Geri</a></p>
        </form>
    
    <%
}

else if (request.getParameter("guncelleSubmit")!=null)
{
    
   // out.print(request.getParameter("sifre"));
            PreparedStatement sorgulama=con.prepareStatement("update external_user set email=? where id=?");
            sorgulama.setString(1,request.getParameter("email"));
            sorgulama.setInt(2,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("externalpersonel.jsp");
        %>
        <p><a href="personel.jsp">Geri</a></p><%
}

else if(request.getParameter("delete")!=null)
{
     PreparedStatement ps=con.prepareStatement("delete from external_user where id=?");
            ps.setInt(1,Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("externalpersonel.jsp");
    
}

else if(request.getParameter("reset")!=null)
{
     PreparedStatement sorgulama=con.prepareStatement("update external_user set password=123456 where id=?");
            sorgulama.setInt(1,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("externalpersonel.jsp");
    
}

else if(request.getParameter("ekleme")!=null)
{
    
    Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from musteri where statu=1 order by firma_adi");
    
    
    %>
    <p align="center">  <b align="center"> Harici Firma Kullanıcısı Ekleme</b></p>
    <hr>
      <table align=center>   
            <form action="externalpersonel.jsp" method=post>
                <tr>
                    
                    <tr>
                    <th>Kullanıcı Adi</td>
                    <td><input type=text name="ad"></td>
                </tr>
                
                
                    <th>Referans Musteri</td>
                    <td>
                
               <select name="referans">
                    <% while(sonuc.next()){
                        %>
                    <option value="<%=sonuc.getString(2)%>"><%=sonuc.getString(2)%></option>
                        <% } %>
                
                
                </td>
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
    PreparedStatement sorgulama=con.prepareStatement("insert into external_user (username,password,email,isCompany,referenceCompany) values(?,?,?,?,?)");
            sorgulama.setString(1,request.getParameter( "ad"));
            sorgulama.setString(2,request.getParameter( "sifre"));
            sorgulama.setString(3,request.getParameter( "email"));
            sorgulama.setInt(4, 2);
            sorgulama.setString(5,request.getParameter( "referans"));
            sorgulama.executeUpdate();
            response.sendRedirect("externalpersonel.jsp");
    
}
else{
    
            Statement st=con.createStatement();
            ResultSet sonuc=st.executeQuery("select * from external_user where isCompany=2");
            %>
        <table align="center">    
            <tr>
                <th>Kullanıcı Adı</td>
                <th>Referans Musteri</th>
                <th>Email</td>
                 <th>Bilgileri Degistir</td>
                <th>Kullanıcıyı Sil</td>
                  <th>Kullanıcı Şifresi Sıfırla</td>

            </tr>
            <% while(sonuc.next()){ 
            
            if(sonuc.getString(2).compareTo("admin")==0)
                continue;
            
            %>     
            <tr>
                
                <td><%=sonuc.getString(2)%></td>
                 <td><%=sonuc.getString("referenceCompany")%></td>
                <td><%=sonuc.getString(4)%></td>
                <td><a href="externalpersonel.jsp?guncelle=guncelle&&name=<%=sonuc.getString(2)%>&&email=<%=sonuc.getString("email")%>&&surname=<%=sonuc.getString(3)%>&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Modify")%></a></td>
                <td><a href="externalpersonel.jsp?delete=delete&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Delete")%></a></td>
                <td><a href="externalpersonel.jsp?reset=reset&&id=<%=sonuc.getInt(1)%>" onclick="return confirmDel();">Şifre Resetleme</a></td>

            </tr>
            <% }  %>
        </table>
        <p align="center"><a  href="externalpersonel.jsp?ekleme=ekleme">Kullanıcı Ekle</a></p>

        <%@include file="disconnect.jsp"%>
       <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

