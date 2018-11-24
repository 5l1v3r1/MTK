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
       
        <title>JSP Page</title>
    </head>
    
    <script>

            function check()
            {
            
            if(document.a.pno.value==0)
            {
                alert("proje secmen lazim");
            return false;
                }
                }

</script>
    <body>
    <%@include file="connect.jsp"%>
     
<%

    String firma=request.getParameter("firma");
   
        
    String sorgu="select * from yapilanis where firma_adi=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,firma);
    ResultSet sonuc=sorgulama.executeQuery();
    
    


%>
    <h1><%=firma.toUpperCase()%> firmasina Ariza Kaydi</h1>
    
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
    <form action="arizaekle.jsp" method=post name="a" onsubmit="return check()">
    <table border="1">
    <tr>
    <input type=hidden name="firma" value="<%=firma%>">
    <td>Proje No</td>
    <td><select name="pno">
            <option value="0">Seciniz</option>
            <% while(sonuc.next()){ %>
            <option value="<%=sonuc.getString(3)%>"><%=sonuc.getString(3)%></option>
                <% } %>
    </select>
    </td>
    </tr>
    <tr>
    <td>Sikayet Eden Kisi</td>
    <td><input type=text name="sikayetci"></td>
    </tr>
    <tr>
    <td>Telefonu</td>
    <td><input type=text name="tel"></td>
    </tr>
    <tr>
    <td>Sorun</td>
    <td><textarea name="sorun" cols="30" rows="5"></textarea></td>
    </tr>
    
    <tr>
    <td colspan="2" align=center><input type=submit value="Sikayeti Kaydet"></td>
    </tr>
    </table>
    </form>
    
      <p><a href="kayitarizaa.jsp">Geri</a></p> 
    </body>
    <% 
    
   
    %>
    <%@include file="disconnect.jsp"%>
</html>
