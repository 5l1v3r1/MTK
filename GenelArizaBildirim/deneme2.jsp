
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    
String name = request.getParameter("name");
String buffer="";  
try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root", "fides");
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select name from lokasyon_full where name like '"+name+"%'");
    while(rs.next())
    {
    buffer=buffer+"'"+rs.getString("name")+"',";
    }
response.getWriter().println(buffer);
}
 catch (Exception e) {
    e.printStackTrace();
 }

%>