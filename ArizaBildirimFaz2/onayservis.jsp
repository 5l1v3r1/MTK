<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<html>
    <head>
        <link rel="stylesheet" href="mtk.css" type="text/css">
        <link rel="stylesheet" href="chosen.css">
            
             <style type="text/css">
            body {
            }
        </style>
        <%@include file="header.html"%>
        <script>

function check()
{

    if(document.a.eleman.value=="")
    {
        alert("Giden eleman kismindan en az 1 kisi secilmelidir");
        return false;
    }
    if(document.a.sor.value==0)
    {
    alert("En ust secenekteki ");
        return false;
    }
   
if(isNaN(document.add.ucret.value)) 
		{
		alert("ucret kismi rakam olmali");
		return false;
		
		}
		if(document.a.saat.value="")
		{
		alert("Harcanan sureyi girin");
		return false;
		}
}
</script>

    </head>
    <body>

<%

    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
    
       Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
     String user2=session.getAttribute("userid").toString();


int id =Integer.parseInt(request.getParameter("id"));
    String sorguz="select firma_adi,sorun,bolge,lokasyon,arizatipi,sistem,onem,sirket from kayit where mid=?";
    PreparedStatement sorgulamaz=con.prepareStatement(sorguz);
    sorgulamaz.setInt(1,id);
    ResultSet sonucz=sorgulamaz.executeQuery();

sonucz.next();

String sorun=sonucz.getString("sorun");
String sirket=sonucz.getString("sirket");

//Yetki
if(sirket.compareTo(user2)!=0)
{
    
        response.sendRedirect("acikariza.jsp");

}

out.print("<h1>Sorunu:</h1><b>"+sorun);
if(sonucz.getString("bolge").compareTo("TELEKOM")==0)
{
out.println("<b><br>Lokasyon:</b> "+sonucz.getString("lokasyon"));
         out.println("<br><b>Sistem</b>: "+sonucz.getString("sistem"));
         out.println("<br><b>ArizaTipi</b>: "+sonucz.getString("arizatipi"));
         out.println("<br><b>Onem</b>: "+sonucz.getString("onem"));
}
%>
    
    <h2 align="center">  Ariza  Onayi Verme</h2>
<%

        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from arizasonucu");
        
         Statement st1=con.createStatement();
         ResultSet sonuc2=st1.executeQuery("select * from personel order by name");
%>
    
<table align="center" border="0">
<form action="jonayservis.jsp" method=post name="a" onsubmit="return check();">

<tr>
<th>Islem :</th>

<td> <select name="sor">

        <% while(sonuc.next()){  %>
            
            <option value="<%=sonuc.getString(1)%>"><%=sonuc.getString(1)%></option>
            
                <% } %>
                </select>
</td>
</tr>


</tr>
    
<tr>
<th>Hata Kaynagi</th>

    <td><select name="kaynak">
    <option value="tt">TT KAYNAKLI</option>
     <option value="firma">FIRMA KAYNAKLI</option>
     <option value="uretici">URETICI KAYNAKLI</option>
     <option value="dogal">DOGAL KAYNAKLI</option>
     <option value="personel">PERSONEL KAYNAKLI</option>

</select>
        </td>
</tr>

<tr>
<input type=hidden name="id" value="<%=request.getParameter("id")%>">
<input type=hidden name="bolge" value="<%=sonucz.getString(3)%>">


<tr>
<th>Arıza Notu</th>
<td><textarea row="215" cols="100" name="ext"></textarea></td>
</tr>




<tr align="center">
    
    <td colspan=2><input type=submit value="TT Onayina Gonder"></td>
</tr>



</form>
 

</table>






   
<p align="center"><a href="acikariza.jsp">Geri</a></p>

    </body>
</html>
