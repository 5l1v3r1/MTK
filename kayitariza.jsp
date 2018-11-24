<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
   <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>	
            <script>

            function check()
            {
            
            if(document.a.pno.value==0)
            {
                alert("proje secmen lazim");
            return false;
                }
                
                if(document.a.bolge.value==0)
            {
                alert("bolge secmen lazim");
            return false;
                }
                }

</script>
    </head>
    <body>
        <%@include file="topborder.jsp"%>

<%

    //String firma=request.getParameter("firma");
   String isim="";

        int id =Integer.parseInt(request.getParameter("firma"));
    String sorgu="select * from yapilanis where musteri_id=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setInt(1,id);
    ResultSet sonuc=sorgulama.executeQuery();


                  String sorgu2="select * from musteri where musteri_id=?";
    PreparedStatement sorgulama2=con.prepareStatement(sorgu2);
    sorgulama2.setInt(1,id);
    ResultSet sonuc2=sorgulama2.executeQuery();
    sonuc2.next();
    isim=sonuc2.getString(2);


    Statement st1=con.createStatement();
         ResultSet personel=st1.executeQuery("select * from personel order by name");
%>
    <h1><%=isim.toUpperCase()%> firmasina Ariza Kaydi</h1>

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
    <form action="arizaekle.jsp" method=post name="a" onsubmit="return check()">
    <table border="1">
    <tr>
    <input type=hidden name="firma" value="<%=isim%>">
    <th>Proje No</th>
    <td><select name="pno">
            <option value="0">Seciniz</option>
            <option value="ProjesizAriza">Projesiz ARIZA</option>
            <% while(sonuc.next()){ %>
            <option value="<%=sonuc.getString(3)%>"><%=sonuc.getString(3)%></option>
                <% } %>
    </select>
    </td>
    </tr><tr>
   
    <th>Bölge</th>
    <td><select name="bolge">
            <option value="0">Seciniz  </option>
            <option value="ANKARA">Ankara Ariza     </option>
            <option value="TELEKOM">Telekom Ariza    </option>
			<option value="MOBESE">MOBESE Ariza    </option>
            <option value="ISTANBUL">Istanbul Ariza   </option>
    </select>
    </td>
    </tr>
     
    <tr>
    <th>Sikayet Eden Kisi</th>
    <td><input type=text name="sikayetci"></td>
    </tr>
    <tr>
    <th>Telefonu</th>
    <td><input type=text name="tel"></td>
    </tr>
    <tr>
    <th>Sorun</th>
    <td><textarea name="sorun" cols="30" rows="5"></textarea></td>
    </tr>
<tr>
<th>Gelmesi özellikle istenilen Personel varsa Seçiniz</th>
<td> <select name="eleman">
 <option value="">Seciniz</option>
        <% while(personel.next()){ %>

        <option value="<%=personel.getString(2)%>"><%=personel.getString(2)%></option>

                <%} %>

</td></tr>
 <tr>
     <th>Randevu saat ve tarihi verilecekse giriniz</th>
	  	<td>
	  		<input name="tarih" type="Text" id="demo1" maxlength="25" size="25"><a href="javascript:NewCal('demo1','ddmmyyyy',true,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Tarih"></a>

	  	</td>
	  </tr>
    <tr>
    <td colspan="2" align=center><input type=submit value="Sikayeti Kaydet"></td>
    </tr>
    </table>
    </form>

      <p><a href="kayitarizaa.jsp">Geri</a></p>
    </body>
    <%


    %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>