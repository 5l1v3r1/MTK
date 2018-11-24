<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
    
    HttpSession onemli=request.getSession(true);
            onemli.removeValue("upload");
%>
        <%@include file="header.html"%>
<%

 
    int id=Integer.parseInt(request.getParameter("id"));
    String sonuc=request.getParameter("sor");
    
try{
    
    
}
        catch(Exception e)
        {
            
        }
  
    
   String kaynak=request.getParameter("kaynak");
   if(kaynak==null)
       kaynak="";
   
   
   int onay=3;

   
   out.print(request.getParameter("ext"));
   
    Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
    String sorgu="update kayit set onay_tarihi=?,sonuc=?,harcanan_sure=?,giden_eleman=?,ucret=?,fatura_kesim=?,onay_saati=?,extra=?,kaynak=?,onay=? where mid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setDate(1,new java.sql.Date(System.currentTimeMillis())); 
    sorgulama.setString(2,sonuc);
    sorgulama.setDouble(3,0);
    sorgulama.setString(4,"");
    sorgulama.setDouble(5,0);
    sorgulama.setInt(6,0);
    sorgulama.setTime(7,new java.sql.Time(System.currentTimeMillis())); 
    sorgulama.setString(8,request.getParameter("ext"));
    sorgulama.setString(9,kaynak);
    sorgulama.setInt(10,onay);
    sorgulama.setInt(11,id);
    sorgulama.executeUpdate();
             

   // con.close();
    %>
     <p><a href="acikariza.jsp">Onaylanmistir</a></p>
  
 
    </body>
</html>
