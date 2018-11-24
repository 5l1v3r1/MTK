<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
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
        <%@include file="topborder.jsp"%>

<%

if(request.getParameter("parca")!=null)
{
int id =Integer.parseInt(request.getParameter("id"));

String parca=request.getParameter("parca");

  String sorgu="update kayit set onay=5,parca=? where mid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,parca);
    sorgulama.setDouble(2,id);
   sorgulama.executeUpdate();

response.sendRedirect("aktifariza.jsp");
    }

else {
int id =Integer.parseInt(request.getParameter("id"));
    String sorguz="select firma_adi,sorun,bolge,lokasyon,arizatipi,sistem,onem from kayit where mid=?";
    PreparedStatement sorgulamaz=con.prepareStatement(sorguz);
    sorgulamaz.setInt(1,id);
    ResultSet sonucz=sorgulamaz.executeQuery();

sonucz.next();

String company=sonucz.getString(1);
String sorun=sonucz.getString("sorun");

out.print("<h1>Sorunu:</h1><b>"+sorun);
if(sonucz.getString("bolge").compareTo("TELEKOM")==0)
{
out.println("<b><br>Lokasyon:</b> "+sonucz.getString("lokasyon"));
         out.println("<br><b>Sistem</b> "+sonucz.getString("sistem"));
         out.println("<br><b>ArizaTipi</b> "+sonucz.getString("arizatipi"));
         out.println("<br><b>Onem</b> "+sonucz.getString("onem"));
}
%>
    
    <h2><%=sonucz.getString(1)%> Sirketine  Ariza  Onayi Verme</h2>
<%

        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from arizasonucu");
        
         Statement st1=con.createStatement();
         ResultSet sonuc2=st1.executeQuery("select * from personel order by name");
%>
    
<table border="0">
<form action="jonayservis.jsp" method=post name="a" onsubmit="return check();">

<tr>
    
    <input type="hidden" value="<%=company%>" name="company">

<td>Islem :</td>

<td> <select name="sor">

        <% while(sonuc.next()){  %>
            
            <option value="<%=sonuc.getString(1)%>"><%=sonuc.getString(1)%></option>
            
                <% } %>
                </select>
</td>
</tr>
<tr>

<td>Harcanan Sure:</td>
<td><input type=text name="saat">(Lutfen saat yaziniz ornegin:1 gun ise 24 saat)</td>
</tr>
<tr>
<td>Giden Eleman yada Elemanlar</td>
<td> <select name="eleman" multiple>
        
        <% while(sonuc2.next()){ %>
                
        <option value="<%=sonuc2.getString(2)%>"><%=sonuc2.getString(2)%></option>

                <%} %>            
                
</td>   
</tr>
    <%
        
        if(sonucz.getString(3).compareTo("TELEKOM")==0)
        {
        %>
<tr>
<td>Hata Kaynagi</td>

    <td><select name="kaynak">
    <option value="tt">TT KAYNAKLI</option>
     <option value="firma">FIRMA KAYNAKLI</option>
     <option value="uretici">URETICI KAYNAKLI</option>
     <option value="dogal">DOGAL KAYNAKLI</option>
     <option value="personel">PERSONEL KAYNAKLI</option>

</select>
        </td>
</tr>

<%  } %>
<tr>
<input type=hidden name="id" value="<%=request.getParameter("id")%>">
<input type=hidden name="bolge" value="<%=sonucz.getString(3)%>">

<td>Fatura Kesimi </td>
<td><input type=checkbox name="fatura" value="yes"></td>
</tr>
<tr>

<td>Ucret(Lutfen fatura kesildiyse bu alani doldurunuz)</td>
<td><input type=text name="ucret">USD</td>
</tr>
<tr>
<td>Extra Birsey olduysa lutfen not ediniz</td>
<td><textarea name="ext"></textarea></td>
</tr>


 <%
        
        if(sonucz.getString(3).compareTo("TELEKOM")==0)
        {
        %>

<tr>
    
<td align=center><input type=submit value="TT Onayina Gonder"></td>
</tr>

<% } else {
            
            %>
            
<tr>
    
<td align=center><input type=submit value="Kaydet"></td>
</tr>
            <%
        } %>
</form>
 

</table>
<table border="1">
    <form action="onayservis.jsp" method="post">
        <tr>  <td> <h1>Parca Bekleniyorsa Lutfen giriniz </h1></td>
            <td><textarea name="parca"></textarea></td><td><input type="submit" value="Parca Bekleniyor"></td>
            </tr>
            <input type=hidden name="id" value="<%=request.getParameter("id")%>"> 
    </form>
</table>

<form>



</form>
   
    <p><a href="onayariza.jsp">Geri</a></p>
    <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>