<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mtk.css" type="text/css">
        
         <script>

            function check()
            {
            
           
         if(document.a.sifre1.value!=document.a.sifre2.value)
            {
                alert("Şifreler aynı değil");
            return false;
                }        
                }

</script>
    </head>
    
    <body>
        <%
             if(request.getParameter("btn_submit")==null)
    {
        
    
             %>
      <form  action="istatistik.jsp" method=post name="a" onsubmit="return check()">  
              <table border="1" align="center">
 <tr>
     
     <%
        
       Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 Statement stmt = con.createStatement(); 
        
        
        ResultSet rs2 = stmt.executeQuery("select * from istatistik");
        
        rs2.next();
        
        %>

    <th nowrap > Kamera Sayısı: </th>
 
<td><input size="50" name="kamera" value="<%=rs2.getInt("kamera")%>" ></td>

  

       </tr>
       <tr>

    <th nowrap>Kgs Sayısı:   </th>
 
<td><input size="50" name="kgs" value="<%=rs2.getInt("kgs")%>" ></td>
  
</tr>
                <tr align="center">

      <td  colspan="2"> <button name="btn_submit">Güncelle</button></td>

</tr>  
              </table>
        
      </form>
        <%
    }   
             else{
            
       Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");     
            int kamera=Integer.parseInt(request.getParameter("kamera"));
            int kgs=Integer.parseInt(request.getParameter("kgs"));
   
  PreparedStatement sorgulama=con.prepareStatement("update istatistik set kamera=? , kgs=? where 1=1 ");
            sorgulama.setInt(1,kamera);
            sorgulama.setInt(2,kgs);
             sorgulama.executeUpdate();
            %>

              <script>
                  alert("Güncellenmiştir.");
                  window.location.href="istatistik.jsp"; 
                </script>
      
                                 <%}
             %>
                         <p align="center"><a  href="ArizaBildirim.jsp">Geri</a></p>

    </body>
</html>
