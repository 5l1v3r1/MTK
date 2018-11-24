<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>

    <h1>Servis Antlasmalari</h1>
    <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("raporlama")=="raporlama")
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



<%
java.util.Date d=new java.util.Date();
        DateFormat df=new SimpleDateFormat("yyyy-dd-MM");
%>
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
        
       
        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select A.firma_adi,B.projeno,B.baslangic,B.bitis,B.serviskapsami,B.periyodik_bakim from yapilanis A,servisantlasmasi B where A.proje_no=B.projeno");
         int i=0;
%>

<table border="1">
<tr>
<td>Sirket Ismi</td>
<td>ProjeNo</td>
<td>Baslangic zamani</td>
<td>Bitis Zamani</td>
<td>Servis Kapsami</td>
<td>Periyodik Bakim</td>
<td>Servis Antlasmasini Sil</td>
<td>Durum</td>
</tr>
        <% while(sonuc.next())    {   

String sorgu2="select count(*) from servisantlasmasi where projeno=? ";
 PreparedStatement sorgulama2=con.prepareStatement(sorgu2);
     sorgulama2.setString(1,sonuc.getString(2));
      ResultSet sonuc2=sorgulama2.executeQuery();      
    sonuc2.next();
           String sorgu3="select * from servisantlasmasi where projeno=?";
           PreparedStatement sorgulama3=con.prepareStatement(sorgu3);
           sorgulama3.setString(1,sonuc.getString(2));
           ResultSet sonuc3=sorgulama3.executeQuery();
           sonuc3.next();


%>
        
        <tr>
        <td><%=sonuc.getString(1)%></td>
        <td><%=sonuc.getString(2) %></td>
         <td><%=sonuc.getDate(3) %></td>
          <td><%=sonuc.getDate(4) %></td>
           <td><%=sonuc.getString(5) %></td>
           <td><%=sonuc.getString(6) %></td>
           <td><a href="baksasil.jsp?pno=<%=sonuc.getString(2)%>">Servis Antlasmasi Sil</a></td>
           <% if(Integer.parseInt(sonuc2.getString(1))>0){ 
               try{
                if(df.format(sonuc3.getDate(3)).compareTo(df.format(d))==0){
i=1;%>
                 <td><a href="baksaozel.jsp?pno=<%=sonuc.getString(2)%>">Servis Antlasmasinin Son gunu</a></td><% }}catch(Exception e){ out.println(e.getMessage());}  %>
                <%  if(sonuc3.getDate(3).before(d)&&i!=1){ %>
        <td><a href="updateservis.jsp?pno=<%=sonuc.getString(2)%>">Servis Antlasmasi Bitmis Tekrar Yapmak icin tiklayin</a></td>    <% } else if(i!=1) {%>        
                

     <td><a href="baksaozel.jsp?pno=<%=sonuc.getString(2)%>">Servis Antlasmasi Var Bakmak icin tiklayin</a></td><% } } %>
      <% if(Integer.parseInt(sonuc2.getString(1))==0){ %>
     <td><a href="servisantlasmasiyap.jsp?pno=<%=sonuc.getString(2)%>">Servis Antlasmasi Yok Yapmak icin tiklayin</a></td><% } %>
      </tr>
  <%  
i=0;



        }
        
        
%>
       <% } %>
</table>


    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>