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

    <th nowrap > Kamera Sayısı (Fides): </th>
 
<td><input size="50" name="kamera" value="<%=rs2.getInt("kamera")%>" ></td>

  

       </tr>
        <tr>

    <th nowrap>Kamera Sayısı (Kent):   </th>
 
<td><input size="50" name="kenthybrid" value="<%=rs2.getInt("kenthybrid")%>" ></td>
  
</tr>
       <tr>

    <th nowrap>Kgs Sayısı:   </th>
 
<td><input size="50" name="kgs" value="<%=rs2.getInt("kgs")%>" ></td>
  
</tr>
 <th nowrap>Otomatik Gazlı Sistem (Palmet):   </th>
 
<td><input size="50" name="otomatikgazlipalmet" value="<%=rs2.getInt("otomatikgazlipalmet")%>" ></td>
  
</tr>

 <tr>

    <th nowrap>Otomatik Gazlı Sistem (Nitel):   </th>
 
<td><input size="50" name="otomatikgazlinitel" value="<%=rs2.getInt("otomatikgazlinitel")%>" ></td>
  
</tr>

 
 <tr>

    <th nowrap>Yangın Algılama (Mavi):   </th>
 
<td><input size="50" name="yanginalgilamamavi" value="<%=rs2.getInt("yanginalgilamamavi")%>" ></td>
  
</tr>

 <tr>

    <th nowrap>Yangın Algılama (EEC):   </th>
 
<td><input size="50" name="yanginalgilamaeec" value="<%=rs2.getInt("yanginalgilamaeec")%>" ></td>
  
</tr>

 <tr>

    <th nowrap>Hırsız Alarm (Kent):   </th>
 
<td><input size="50" name="hirsizalarmkent" value="<%=rs2.getInt("hirsizalarmkent")%>" ></td>
  
</tr>
 <tr>

    <th nowrap>Sabit Tip (Drager):   </th>
 
<td><input size="50" name="sabittipdrager" value="<%=rs2.getInt("sabittipdrager")%>" ></td>
  
</tr>
 <tr>

    <th nowrap>Sabit Tip (Mavili):   </th>
 
<td><input size="50" name="sabittipmavili" value="<%=rs2.getInt("sabittipmavili")%>" ></td>
  
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
            int otomatikgazlipalmet=Integer.parseInt(request.getParameter("otomatikgazlipalmet"));
            int otomatikgazlinitel=Integer.parseInt(request.getParameter("otomatikgazlinitel"));
            int yanginalgilamamavi=Integer.parseInt(request.getParameter("yanginalgilamamavi"));
            int kenthybrid=Integer.parseInt(request.getParameter("kenthybrid"));
            int yanginalgilamaeec=Integer.parseInt(request.getParameter("yanginalgilamaeec"));
            int hirsizalarmkent=Integer.parseInt(request.getParameter("hirsizalarmkent"));
            int sabittipdrager=Integer.parseInt(request.getParameter("sabittipdrager"));
            int sabittipmavili=Integer.parseInt(request.getParameter("sabittipmavili"));

  PreparedStatement sorgulama=con.prepareStatement("update istatistik set kamera=? , kgs=? ,otomatikgazlipalmet=? ,otomatikgazlinitel=?"
          + ",yanginalgilamamavi=?,kenthybrid=?,yanginalgilamaeec=?,hirsizalarmkent=?,sabittipdrager=?,sabittipmavili=? where 1=1 ");
            sorgulama.setInt(1,kamera);
            sorgulama.setInt(2,kgs);
            sorgulama.setInt(3,otomatikgazlipalmet);
            sorgulama.setInt(4,otomatikgazlinitel);
            sorgulama.setInt(5,yanginalgilamamavi);
            sorgulama.setInt(6,kenthybrid);
            sorgulama.setInt(7,yanginalgilamaeec);
            sorgulama.setInt(8,hirsizalarmkent);
            sorgulama.setInt(9,sabittipdrager);
            sorgulama.setInt(10,sabittipmavili);

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
