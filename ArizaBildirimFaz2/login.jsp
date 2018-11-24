<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
 
    </head>
    <body>
        <%
        if(request.getParameter("btn_submit")==null)
    {
            
            %>
        
        <%@include file="topborder.jsp"%>
       
        <table  align=center border="1" cellspacing="0" id="AutoNumber1" cellpadding="3" style="border-collapse: collapse" bordercolor="#808080" bgcolor="#E8E8E8">
            <form action="login.jsp" method=post>
                <th colspan="2" align="center">
                    Türk Telekom Arıza Giriş Formu
                </th>
                <tr>
                <td>Kullanıcı Adı: &nbsp;</td>
                <td><input type=text name="user"></td>
            </tr>
            <tr> 
                <td>Şifre:  &nbsp;</td>
                <td><input type=password name="pas"></td>
            </tr>
        
            <tr>
                <td align=center colspan="2"><input name="btn_submit" type=submit value="Giriş"></td>
            </tr>
        </table>
        <%  
    }
        else {
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
     
                String user=request.getParameter("user");
            String pas=request.getParameter("pas");
        Statement stmt = con.createStatement();
ResultSet sonuc = stmt.executeQuery("SELECT * FROM external_user where isCompany!=2");
 HttpSession onemli=request.getSession(true);
 int a=0;
 while(sonuc.next()) {
                if(sonuc.getString(2).equals(user)) {
                    if(sonuc.getString(3).compareTo(pas)==0) {

                        
session.setAttribute("userid", user);
                        
a=1;
                        String sorgu2="insert into logon (name,tarih,saat) values(?,?,?)";
                        PreparedStatement sorgulama=con.prepareStatement(sorgu2);
                        sorgulama.setString(1,user);
                        sorgulama.setDate(2,new java.sql.Date(System.currentTimeMillis()));
                        sorgulama.setTime(3,new java.sql.Time(System.currentTimeMillis()));
                        sorgulama.executeUpdate();
                        response.sendRedirect("ArizaBildirim.jsp");
                        
                    }
                }
                
                
            }
 con.close();
 if(a==0)
 {
     
     response.sendRedirect("login.jsp");
 }

  //  response.sendRedirect("login.jsp");
        }
        
        %>
    </body>
</html>
