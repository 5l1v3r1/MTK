<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <form action="loggor.jsp" method=post name="a">
 <table>      <tr> <td> <%
  Statement sorgulama2=con.createStatement();
   ResultSet sonuc2=sorgulama2.executeQuery("select * from kullanicilar");      
String kimo="";
if (request.getMethod().equals("POST")) {

kimo=request.getParameter("kim");
}

           %>
<select name="kim">
<% if(kimo.equals("admin")){ %>
            <option value="admin" selected>admin</option>
    <%  } else { %>
     <option value="admin">admin</option><% } %>
            <% while(sonuc2.next()){ 
                if(kimo.equals(sonuc2.getString(1))){ %>
             <option value="<%=sonuc2.getString(1)%>" selected><%=sonuc2.getString(1)%></option>
                <%  } else { %>
            <option value="<%=sonuc2.getString(1)%>"><%=sonuc2.getString(1)%></option>
                <% } } %>
    </select>
    </td>
</tr>
<tr><td> <input type="submit" value="Bak"> </td></tr>
                             
        
        
        
      
    </table>
    </form>
        <%
if(kimo!=null){

           
    String sorgu="select * from logon where name=? order by tarih desc,saat desc LIMIT 30";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,request.getParameter("kim"));
    ResultSet sonuc=sorgulama.executeQuery();

            HttpSession onemli=request.getSession();
            if(onemli.getValue("pas")!="gecerli") {
                response.sendRedirect("login.jsp");
            }
            %>
        <table border="1">   
            <tr>
                <th><strong>Kullanici</strong></td>
                <th><strong>Tarih</strong></td>
                <th><strong>Saat</strong></td>
            </tr>
            <% while(sonuc.next()) { %>
            <tr>
                <td><%=sonuc.getString(2)%></td>
                <td><%=sonuc.getDate(3)%></td>
                <td><%=sonuc.getTime(4)%></td>
            </tr>
            <% } %>
        </table> <% } %>
     
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>