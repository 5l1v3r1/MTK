<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>

    <h1>Musteri Adini Seciniz</h1>

   
    <%


        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from musteri where statu=1 order by firma_adi");



%>
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
    <table border="0">
    <form action="kayitariza.jsp" method=post name="a">
    <tr>
   
 
    <td>
          
            <select name="firma">
                    <% while(sonuc.next()){
                        %>
                    <option value="<%=sonuc.getString(1)%>"><%=sonuc.getString(2)%></option>
                        <% } %>
            
            </select>
          
               
    </td>
    
    <td><input type=submit value="ileri"></td></form>
    </tr>
    </table>
    <hr>
    <h2>2.secenek Elle Girme</h2>
    <table>
    
    <form action="kayitariza111.jsp" method=post>
    
        <tr>
        <td><input type=text name="firma"></td>
        <td><input type=submit value="Ileri"></td>
        </tr>
        
    
    
    </form>
    
    
    </table>

    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>