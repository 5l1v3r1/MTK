<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>

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
<%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("projeekle")=="projeekle")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{
            java.util.Date d=new java.util.Date();
%>
<html>
    <head>
       
        <title>JSP Page</title>
    </head>
    
    <script>
            
        function check()
{
    if(document.add.servis.length==0)
    {
        alert("servis kapsamina bisey yazman gerek");
        return false;
        }
        }
    </script>
<body>

    <h1>JSP Page</h1>
    
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
   
        <form action="santyap.jsp" method=post onsubmit="return check()" name="add">
    <table border="1">
    
<input type=hidden value="<%=request.getParameter("pno")%>" name="pno">

<td>Baslangic Tarihi</td>
         
 <td>Ay:   <select name="bay">
           <% for(int i=1;i<=12;i++)
           {    
                if(i==d.getMonth()+1) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
 </td>
                    
           <td> Gun:  <select name="bgun">
           <% for(int i=1;i<=31;i++)
           {    
                if(i==d.getDate()) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
 </td>
           <td> Yil:  <select name="byil">
           <% for(int i=2000;i<=2010;i++)
           {    
                if(i==d.getYear()+1900) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
 </td>
           </tr>

    <td>Bitis Tarihi</td>
         
 <td>Ay:   <select name="eay">
           <% for(int i=1;i<=12;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
 </td>
                    
           <td> Gun:  <select name="egun">
           <% for(int i=1;i<=31;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
 </td>
           <td> Yil:  <select name="eyil">
           <% for(int i=2000;i<=2010;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
 </td>
           </tr>
    <tr>
    <td>Servis Kapsami</td>
    <td><input type=text name="servis"></td>
    </tr>
    <tr>
    <td>Periyodik Bakim(Ay cinsinden)</td>
    <td> 
    <select name="bakim">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option> 
    <option value="12">12</option>
    </select>
    </td>
    </tr>
    <tr>
    <td><input type=submit value="gonder"></td></tr>
    </table>
        </form>
        <% } %>
        <p><a href=form.jsp>Geri</a></p>
    </body>
</html>
