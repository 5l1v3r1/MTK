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
    if(onemli.getValue("degistirme")=="degistirme")
    {
        f=1;
    }
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
} else {     

    String sorgu="select * from musteri where musteri_id = ?";

    PreparedStatement sorgulama=con.prepareStatement(sorgu);

    sorgulama.setInt(1,Integer.valueOf(request.getParameter("id")));
    ResultSet sonuc=sorgulama.executeQuery();
       
       
       while(sonuc.next())
       {
    %>

    <table border="1" align=center>
    <form action="v.jsp" method=post>
        <input type="hidden" name="mid" value="<%=sonuc.getInt(1)%>">
        <input type="hidden" name="ad" value="<%=request.getParameter("ad")%>">
  <tr> 
  <td>Firma_Adi</td>
  <td><input type=text size="60" name="fad" value="<%=sonuc.getString(2)%>"></td>
  </tr>  
    
    <tr>
  <td>Sokak/No</td>
  <td><input type=text size="60"  name="sokak" value="<%=sonuc.getString(3)%>"></td>
  </tr>  
    
    <tr>
  <td>Cadde</td>
  <td><input type=text size="60" name="cadde" value="<%=sonuc.getString(4)%>"></td>
  </tr>  
  
  <tr>
  <td>Semt</td>
  <td><input type=text size="60" name="semt" value="<%=sonuc.getString(5)%>"></td>
  </tr>  
  
  <tr>
  <td>Ilce</td>
  <td><input type=text size="60" name="ilce" value="<%=sonuc.getString(6)%>"></td>
  </tr>  
  
  <tr>
  <td>Il</td>
  <td><input type=text size="60" name="il" value="<%=sonuc.getString(7)%>"></td>
  </tr>  
  
  <tr>
  <td>PostaKodu</td>
  <td><input type=text size="60" name="posta" value="<%=sonuc.getString(8)%>"></td>
  </tr>  
  
  <tr>
  <td>Ilgili Kisi</td>
  <td><input type=text size="60" name="ilgili" value="<%=sonuc.getString(9)%>"></td>
  </tr>  
  
  <tr>
  <td>Tel1</td>
  <td><input type=text size="60" name="tel1" value="<%=sonuc.getString(10)%>"></td>
  </tr>  
  
  <tr>
  <td>Tel2</td>
  <td><input type=text size="60" name="tel2" value="<%=sonuc.getString(11)%>"></td>
  </tr>  
  
  <tr>
  <td>Dahili_No</td>
  <td><input type=text size="60" name="dno" value="<%=sonuc.getString(12)%>"></td>
  </tr>  
  
  <tr>
  <td>Cep Tel</td>
  <td><input type=text size="60" name="ceptel" value="<%=sonuc.getString(13)%>"></td>
  </tr>  
  
  <tr>
  <td>Faks</td>
  <td><input type=text size="60" name="faks" value="<%=sonuc.getString(14)%>"></td>
  </tr>  
  
  <tr>
  <td>Email</td>
  <td><input type=text size="30" name="email" value="<%=sonuc.getString(15)%>"></td>
  </tr>  
  
  
  <tr>
  <td colspan="2" align=center><input type=submit value="Guncelle">
  <input type=reset value="temizle"></td>
  </tr>
    </form>
    </table>
    <%
       }


%>
<% } %>
<p align=right><a href="formmusteri.jsp">Back</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>