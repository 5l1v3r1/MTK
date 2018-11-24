<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>

<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <script>

            function check()
            {

            
            if(document.a.durum.value==0)
            {
                alert("Durum Seçiniz");
            return false;
                }
                
                 if(document.a.onem.value==0)
            {
                alert("Onem Durumu Seçiniz");
            return false;
                }
                }

</script>
         <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>	
        <link rel="stylesheet" href="mtk.css" type="text/css">
    </head>
    <body>
 <%@include file="topborder.jsp"%>
     <%

//dasda
                  java.util.Date d=new java.util.Date();

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}

  
%>
  
    

<table border="1" align="center">
            
            <form action="rapordetay.jsp" method=post name="a" onsubmit="return check()">
            
   
      <tr>
      <th>Sistem ismi </th>
      <td><select style="width: 360px" name="sistem">
            <option value="0">Hepsi</option>
            <option value="kamera">Kamera</option>
            <option value="kgs">Kgs</option>
    </select>
    </td>
      </tr>
      
       <tr>
      <th>Önem Düzeyi </th>
      <td><select style="width: 360px" name="onem">
            <option value="0">Hepsi</option>
            <option value="acil">TT Arıza</option>
            <option value="normal">Normal</option>
    </select>
    </td>
      </tr>
      
      <tr><th>Lokasyon </th>
          <td>   <select style="width: 360px" id="country"  name="country" onchange="showState(this.value)">  
       <option value="none">Hepsi</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
  Statement stmt2 = con.createStatement();  

  ResultSet rs2 = stmt2.executeQuery("Select *  from lokasyon");

 while(rs2.next()){
     %>
      <option value="<%=rs2.getString(2)%>"><%=rs2.getString(2).toUpperCase()%></option>  
      <%
 }
     %>
              </select>  </td>
      </tr>
     
      
       <tr>
      <th>Hata Kaynağı </th>
      <td><select  style="width: 360px" name="kaynak">
            <option value="0">Hepsi</option>
            <option value="tt">TT KAYNAKLI</option>
     <option value="firma">FIRMA KAYNAKLI</option>
     <option value="uretici">URETICI KAYNAKLI</option>
     <option value="dogal">DOGAL KAYNAKLI</option>
     <option value="personel">PERSONEL KAYNAKLI</option>
    </select>
    </td>
      </tr>     
      
      <tr><th>Baslangic Tarihi</th>
	  	<td>
	  		<input style="width: 345px" name="tarih" type="Text" id="demo1" maxlength="25" size="25" readonly><a href="javascript:NewCal('demo1','ddmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Tarih"></a>

	  	</td>
	  </tr>
          <tr><th>Bitis Tarihi</th>
	  	<td>
	  		<input style="width: 345px" name="tarih2" type="Text" id="demo2" maxlength="25" size="25" readonly><a href="javascript:NewCal('demo2','ddmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Tarih"></a>

	  	</td>
	  </tr>
 
        
      
          <tr>
          <td colspan="2" align=center><input name="btn_submit" type=submit value="Sorgula"></td>
          </tr>
            </form>
           </table>
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
   
   
     <%   
     con.close();
     %>
   
   
     <p align="center"><a href="ArizaBildirim.jsp" >Geri</a></p>
    </body>
</html>
