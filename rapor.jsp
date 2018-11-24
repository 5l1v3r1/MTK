    <%@include file="header.jsp"%>
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
         <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>	
        <title>JSP Page</title>
    </head>
    <body>

     <%

//dasda
                  java.util.Date d=new java.util.Date();
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("raporlama")=="raporlama")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{
%>

            <table border="1">
            
            <form action="rapor1.jsp" method=post>
            
      <tr>
      <td>Firma Adi </td><td><input type=text name="firmaadi"></td>
      </tr>
       <tr>
      <td>Proje Numarasi </td><td><input type=text name="pno"></td>
      </tr>
      
      <tr><td>Baslangic Tarihi
	  	<td>
	  		<input name="tarih" type="Text" id="demo1" maxlength="25" size="25" readonly><a href="javascript:NewCal('demo1','ddmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Tarih"></a>

	  	</td>
	  </tr>
           <tr><td>Bitis Tarihi
	  	<td>
	  		<input name="tarih2" type="Text" id="demo2" maxlength="25" size="25" readonly><a href="javascript:NewCal('demo2','ddmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Tarih"></a>

	  	</td>
	  </tr>
 
        
        <tr>
        <td>Sikayetci(Ariza Kaydi Alinirken kimle gorusuldugu)</td><td><input type=text name="sikayetci"></td>
        </tr>
            
          <tr>
        <td>Yapilan Is(CCTV,Hirsiz Alarm vs..)</td><td><input type=text name="yapilanis"></td>
        </tr>
          
          <tr>
        <td>Sorun(Hangi sorundan dolayi ariza kaydi alindi)</td><td><input type=text name="sorun"></td>
        </tr>
          
          <tr>
        <td>Sikayeti Alan(Ariza Kaydini Alan kisinin ismi)</td><td><input type=text name="sikayetialan"></td>
        </tr>
          
          <tr>
        <td>Sonuc(Servis Bittikten Sonraki Sonuc)</td><td><input type=text name="sonuc"></td>
        </tr>
          
          
          <tr>
        <td>Giden Elemanlar(Birden Fazla Eleman aratcaksiniz ',' isareti kullanin)</td><td><input type=text name="gideneleman"></td>
        </tr>
        
         
        
          <tr>
          <td>Fatura Kesim(Faturasi Kesilmis arama kriterleri icin seciniz)</td><td><input type=checkbox name="fatura" value="yes"></td>
          </tr>
          
             
         
          
             
          <tr>
          <td>Garanti(Garanti suresi kapsamindaki arizalari aratmak icin seciniz) </td><td><input type=checkbox name="garanti" value="yes"></td>
          </tr>
          <tr>
          <td colspan="2" align=center><input type=submit value="Sorgula"></td>
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
   
   
     
     <% } %> 
    
    </body>
</html>
