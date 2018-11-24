<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>

<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 Statement stmt = con.createStatement(); 

  PreparedStatement sorgulama=con.prepareStatement("insert into arizatipi (ariza,tip) values(?,?)");
            sorgulama.setString(1,"çöşiı");
            sorgulama.setString(2,"kamera");
            out.print("çöşiı");
            sorgulama.executeUpdate();
    %>

