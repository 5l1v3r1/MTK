<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
 <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("bilgiler")=="bilgiler")
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

    <form action="deleteil.jsp" method=post>
    
    <h1><%=request.getParameter( "name").toUpperCase()%>  isimli musteriyi silmeye eminmisiniz?</h1>
    
    <input type=hidden name="id" value="<%=request.getParameter("id")%>">
    <input type=hidden name="il" value="<%=request.getParameter("il")%>">
    <input type=submit value="Sil">
    
    
    
    </form>
 
    <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>