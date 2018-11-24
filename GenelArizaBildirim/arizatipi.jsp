<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>
<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>

<%@ include file="Resource.jsp" %>
<html>
    <head>
              <link rel="stylesheet" href="mtk.css" type="text/css">

        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
    HttpSession onemli=request.getSession(true);
            onemli.removeValue("upload");

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}

else if(request.getParameter("guncelle")!=null){
    
    PreparedStatement sorgulama=con.prepareStatement("select ariza,tip from arizatipi where id=?");
            sorgulama.setInt(1,Integer.parseInt(request.getParameter( "id")));
                ResultSet sonuc=sorgulama.executeQuery();

                sonuc.next();
                String name=sonuc.getString(1);
    %>
    
    
     <form action="arizatipi.jsp" method=post >
            <table align=center border="1">
                <tr>
                    <th><%=sonuc.getString(2).toUpperCase()%> Ariza Tipi</td>
                    <td><input type=text name="ad" value="<%=name%>"></td>
                    <input type=hidden value="<%=request.getParameter("id")%>" name="id">
                    <input type=hidden value="<%=sonuc.getString(2)%>" name="tip">
    
                </tr>
                
                <tr>
                    <td colspan="2" align=center><input name="guncelleSubmit" type=submit value="gonder"></td>
                </tr>
            </table>
                    <p align="center"><a href="arizatipi.jsp?tip=<%=request.getParameter("tip")%>">Geri</a></p>
        </form>
    
    <%
}

else if (request.getParameter("guncelleSubmit")!=null)
{
    
   // out.print(request.getParameter("sifre"));
            PreparedStatement sorgulama=con.prepareStatement("update arizatipi set ariza=? where id=?");
            sorgulama.setString(1,request.getParameter("ad"));
            sorgulama.setInt(2,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("arizatipi.jsp?tip="+request.getParameter("tip"));
        %>
        <p><a href="arizatipi.jsp?tip=<%=request.getParameter("tip")%>">Geri</a></p><%
}

else if(request.getParameter("delete")!=null)
{
     PreparedStatement ps=con.prepareStatement("delete from arizatipi where id=?");
            ps.setInt(1,Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("arizatipi.jsp?tip="+request.getParameter("tip"));
    
}

else if(request.getParameter("ekleme")!=null)
{
    %>
   
    <p align="center">  <b align="center"> <%=request.getParameter("tip").toUpperCase()%> Arıza Tipi Ekleme</b></p>
    <hr>
      <table align=center>   
            <form action="arizatipi.jsp" method=post>
                <tr>
                    <th>Arıza Tipi</td>
                    <td><input type=text name="ad"></td>
                    <input type=hidden value="<%=request.getParameter("tip")%>" name="tip">
                </tr>
                                 
   
                <tr>
                    <td colspan="2" align=center><input type=submit name="arizaekle" value="Ekle"></td>
                </tr>  
                        <p align="center"><a href="arizatipi.jsp?tip=<%=request.getParameter("tip")%>">Geri</a></p>

            </form> 

        </table>
<%    
    
}

else if(request.getParameter("arizaekle")!=null)
{
    String tip=request.getParameter("tip");
    out.print(tip);
       PreparedStatement sorgulama=con.prepareStatement("insert into arizatipi (ariza,tip) values(?,?)");
            sorgulama.setString(1,request.getParameter( "ad"));
            sorgulama.setString(2,request.getParameter( "tip"));
            sorgulama.executeUpdate();
            response.sendRedirect("arizatipi.jsp?tip="+tip);
    
}
else{
            String sorgu="select * from arizatipi where tip = ?";
                    PreparedStatement sorgulama=con.prepareStatement(sorgu);

             sorgulama.setString(1,request.getParameter("tip"));
       ResultSet sonuc=sorgulama.executeQuery();
            %>
            <b> <p align="center"><%=request.getParameter("tip").toUpperCase() %> Arıza Tipi</p></b>
        <table align="center">    
            <tr>
                <th>Arıza Tipi</td>
                 <th> Degistir</td>
                <th> Sil</td>
            </tr>
           <% while(sonuc.next()){ 
            %>     
            <tr>
                
                <td><%=sonuc.getString(2)%></td>
                <td><a href="arizatipi.jsp?guncelle=guncelle&&tip=<%=request.getParameter("tip")%>&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Modify")%></a></td>
                <td><a href="arizatipi.jsp?tip=<%=request.getParameter("tip")%>&&delete=delete&&id=<%=sonuc.getInt(1)%>"><%=resources.getString("Delete")%></a></td>
            </tr>
            <% }  %>
        </table>
        <p align="center"><a  href="arizatipi.jsp?tip=<%=request.getParameter("tip")%>&&ekleme=ekleme"><%=request.getParameter("tip").toUpperCase()%> Arıza Tipi Ekle</a></p>
        <p align="center"><a  href="arizatipleri.jsp">Geri</a></p>

        <%@include file="disconnect.jsp"%>
         <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

