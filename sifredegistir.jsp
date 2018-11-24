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
      <form  action="sifredegistir.jsp" method=post name="a" onsubmit="return check()">  
              <table border="1" align="center">
 <tr>

    <th nowrap > Yeni Şifre: </th>
 
<td><input size="50" name="sifre1" type="password"  ></td>

  

       </tr>
       <tr>

    <th nowrap>Yeni Şifre Onay:   </th>
 
    <td><input size="50"  name="sifre2"  type="password"  ></td>
  
</tr>
                <tr align="center">

      <td  colspan="2"> <button name="btn_submit">Şifre Değiştir</button></td>

</tr>  
              </table>
        
      </form>
        <%
    }
             else{
            
       Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");     
            String password=request.getParameter("sifre1");
           String user=session.getAttribute("userid").toString();
   
  PreparedStatement sorgulama=con.prepareStatement("update external_user set password=? where username=? ");
            sorgulama.setString(1,password);
            sorgulama.setString(1,user);
             
            %>

               <script>
                  alert("Şifreniz Değiştirilmiştir.");
                  window.location.href="ArizaBildirim.jsp"; 
                </script>
      
                                 <%}
             %>
    </body>
</html>
