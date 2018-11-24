
<%@page import="java.sql.*" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
       <%
       String c=" ";
       String h=" ";
       String g=" ";
       String o=" ";
       String s=" ";
       String y=" ";
       if(request.getParameter("c").equals("yes"))
       {
           c="cctv";
           
       }
      if(request.getParameter("h").equals("yes"))
       {
            h="Hirsiz Alarm";
           
       }
       
       if(request.getParameter("g").equals("yes"))
       {
          g="Gecis Kontrol";
           
       }
       if(request.getParameter("o").equals("yes"))
       {
           o="Otopark kontrol";
           
       }
       if(request.getParameter("s").equals("yes"))
       {
           s="Seslendirme";
           
       }
       if(request.getParameter("y").equals("yes"))
       {
           y="Yangin Alarm";
           
       }
       String gun=request.getParameter("gun");
       String ay=request.getParameter("ay");
       String yil=request.getParameter("yil");
       String date=gun+"/"+ay+"/"+yil;
       
       String is=c+" "+h+" "+g+" "+o+" "+s+" "+y;
       
    Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=1234");
String sorgu="select * from musteri where musteri_id= ?";
        PreparedStatement ps=con.prepareStatement(sorgu);
        ps.setInt(1,Integer.parseInt(request.getParameter("id")));
        ResultSet sonuc=ps.executeQuery();
        
   String sorgu2="insert into yapilanis values(?,?,?,?,?,?,?,?)";
   PreparedStatement ps2=con.prepareStatement(sorgu2);
   
   
   ps2.setInt(1,Integer.parseInt(sonuc.getString(1)));
   ps2.setString(2,sonuc.getString(2));
   ps2.setString(3,request.getParameter("projeno"));
   ps2.setString(4,is);
   ps2.setString(5,date);
   ps2.setFloat(6,Float.parseFloat(request.getParameter("tutar")));
   ps2.setString(7,request.getParameter("not"));
   ps2.setInt(8,Integer.parseInt(request.getParameter("gs")));
   ps2.executeUpdate();
   con.close();
        
        %>
    </body>
</html>
