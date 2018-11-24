<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
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
    </head>
    <body>
        <%@include file="topborder.jsp"%>
<%

HttpSession onemli=request.getSession();
if(onemli.getValue("pas")!="gecerli")
{
    response.sendRedirect("login.jsp");
}



%>
    



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
   
        <form action="santupdate.jsp" method=post onsubmit="return check()" name="add">
    <table border="1">
    
<input type=hidden value="<%=request.getParameter("pno")%>" name="pno">

<td>Baslangic Tarihi</td>
         
 <td>Ay:   <select name="bay">
           <% for(int i=1;i<=12;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
 </td>
                    
           <td> Gun:  <select name="bgun">
           <% for(int i=1;i<=31;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
 </td>
           <td> Yil:  <select name="byil">
           <% for(int i=2000;i<=2010;i++)
           {
            %>
          <option value=<%=i%>><%=i%></option>
           }
           
          <% } %>
          
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
    <td>Periyodik Bakim(Ay Cinsinden)</td>
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
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>