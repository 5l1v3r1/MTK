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
          <%@include file="header.html"%>
     
    </head>
    
    <script>
    
    function check()
        {
        
        if(document.add.fad.value.length==0)
        {
        
        window.alert("Firma adi girmen lazim");
        return false;
        }
       
        }
    
    
    
    </script>
    <body>
 <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("ekleme")=="ekleme")
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
    <h1>Musteri Ekleme</h1>
    
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
   
    <table border="1" align=center>
    <form action="islemadd.jsp" method=post onsubmit="return check()" name="add">
  <tr>
  <th>Firma Adi</th>
  <td><input type=text size="60" name="fad"></td>
  </tr>  
    
    <tr>
  <th>Sokak/No</th>
  <td><input type=text size="60"  name="sokak"></td>
  </tr>  
    
    <tr>
  <th>Cadde</th>
  <td><input type=text size="60" name="cadde"></td>
  </tr>  
  
  <tr>
  <th>Semt</th>
  <td><input type=text size="60" name="semt"></td>
  </tr>  
  
  <tr>
  <th>Ilce</th>
  <td><input type=text size="60" name="ilce"></td>
  </tr>  
  
  <tr>
  <th>Il</th>
  <td><input type=text size="60" name="il"></td>
  </tr>  
  
  <tr>
  <th>PostaKodu</th>
  <td><input type=text size="60" name="posta"></td>
  </tr>  
  
  <tr>
  <th>Ilgili Kisi</th>
  <td><input type=text size="60" name="ilgili"></td>
  </tr>  
  
  <tr>
  <th>Tel1</th>
  <td><input type=text size="60" name="tel1"></td>
  </tr>  
  
  <tr>
  <th>Tel2</th>
  <td><input type=text size="60" name="tel2"></td>
  </tr>  
  
  <tr>
  <th>Dahili_No</th>
  <td><input type=text size="60" name="dno"></td>
  </tr>  
  
  <tr>
  <th>Cep Tel</th>
  <td><input type=text size="60" name="ceptel"></td>
  </tr>  
  
  <tr>
  <th>Faks</th>
  <td><input type=text size="60" name="faks"></td>
  </tr>  
  
  <tr>
  <th>Email</th>
  <td><input type=text size="30" name="email"></td>
  </tr>  
  
  
  <tr>
  <td colspan="2" align=center><input type=submit value="Ekle">
  <input type=reset value="temizle"></td>
  </tr>
    </form>
    </table>
   
        
    </script>
  
    
    <% } %>
    </body>
</html>
