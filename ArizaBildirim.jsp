<%@page language="java" contentType="text/html;charset=UTF-8" import="java.util.*,java.io.*,java.net.*,mtk.*" session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>
<%@include file="connect.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
         <link href="dis/css/bootstrap.css" rel="stylesheet">
          <script src="jquery.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dis/js/bootstrap.js"></script>
	<script type="text/javascript"> $(document).ready(function () { $('.dropdown-toggle').dropdown(); }); </script>
   <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>	
   
            <script>

            function check()
            {
            
            if(document.a.sorun.value==0)
            {
                alert("Lütfen bir sorun giriniz !");
            return false;
                }
                
                if(document.a.lokasyon.value==0)
            {
                alert("Lütfen bir lokasyon giriniz !");
            return false;
                }
         if(document.a.sikayetci.value==0)
            {
                alert("Lütfen Ilgili birini giriniz !");
            return false;
                }        
                }

</script>
    </head>
    <body>
        <%@include file="topborder.jsp"%>

<%

    if(request.getParameter("btn_submit")==null)
    {
        
    
    
%>
    <h1 align="center">TÜRK TELEKOM ARIZA KAYDI</h1>

    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello= ue&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    <form class="form-horizontal" action="ArizaBildirim.jsp" method=post name="a" onsubmit="return check()">
        
  <fieldset>      
      <p align="center">  <legend align="center">Kartlı Geçiş & CCTV</legend></p>
      <table width=700 height="500" align="center">
       <tr>
 <div class="form-group">
    <td nowrap > <label class="col-md-2 control-label" for="textinput">Görüşülecek Yetkili Kişi: </label>  </td>
  <div class="col-md-4">
<td>  <input id="textinput" name="sikayetci" type="text" placeholder="Yetkili giriniz.." class="form-control input-md"></td>

  </div>  
</div>
       </tr>
       <tr>
<div class="form-group">
    <td nowrap> <label class="col-md-4 control-label" for="textinput">Lokasyon: </label> </td>
  <div class="col-md-4">
      <td><input id="textinput" name="lokasyon" type="text" placeholder="Lokasyon Giriniz.." class="form-control input-md"></td>
   </div>
  </div> 
</tr>
<!-- Text input-->
<tr>
<div class="form-group">
    <td nowrap> <label class="col-md-4 control-label" for="textinput">Telefon: </label> </td> 
  <div class="col-md-4">
      <td> <input id="textinput" name="tel" type="text" placeholder="Telefon Giriniz.." class="form-control input-md"></td>
   
  </div>
  </div>
</tr>
<tr>
<div class="form-group">
    <td> <label class="col-md-4 control-label" for="textarea">Sorun: </label></td>
  <div class="col-md-4">                     
      <td> <textarea class="form-control"  id="textarea" placeholder="Sorun Giriniz.." name="sorun"></textarea></td>
  </div>
</div>
</tr>
<!-- Button -->
<tr align="center">
<div align=right class="form-group">
  <div align="center" class="span6 pagination-centered">
      <td  colspan="2"> <button id="singlebutton" name="btn_submit" class="btn btn-primary button-md">Kaydet</button></td>
  </div>
</div>
</tr>
   </table>
</fieldset>
</form> 

    </body>
    <%

    }
    
    else
    {
          DateFormat df = new SimpleDateFormat("yyyy/dd/MM hh:mm:ss");
          java.util.Date dd = new java.util.Date();
       String y = String.valueOf(df.format(dd));  
           String sorgu = "insert into kayit (firma_adi,projeno,kayit_tarihi,kayit_saati,sikayetci,tel,sorun,sikayeti_alan,onay,antlasma,garanti,iscinsi,eleman,randevu,bolge,lokasyon) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement sorgulama = con.prepareStatement(sorgu);
            sorgulama.setString(1, "TURK TELEKOM ARIZA");
            sorgulama.setString(2, "ProjesizAriza");
            sorgulama.setDate(3, new java.sql.Date(df.parse(y).getTime()));
            sorgulama.setTime(4, new java.sql.Time(System.currentTimeMillis()));
            sorgulama.setString(5, request.getParameter("sikayetci"));
            sorgulama.setString(6, request.getParameter("tel"));
            sorgulama.setString(7, request.getParameter("sorun"));
            sorgulama.setString(8, "sistem");
            sorgulama.setInt(9, 0);
            sorgulama.setInt(10, 0);
            sorgulama.setInt(11, 0);
            sorgulama.setString(12, "");
            sorgulama.setString(13, "");
            
                sorgulama.setTimestamp(14, null);
            
            sorgulama.setString(15, "TELEKOM");
            sorgulama.setString(16, request.getParameter("lokasyon"));
            sorgulama.executeUpdate();
%>            
<h1 align="center"> ARIZANIZ KAYDEDILMISIR.http://www.fides.com.tr  sayfasına Yonlendiriliyorsunuz.</h1>
  <%
            
   response.setHeader("Refresh", "3; URL=http://www.fides.com.tr ");
    
    }
    %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>