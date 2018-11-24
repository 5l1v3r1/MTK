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
if(onemli.getValue("projeekle")=="projeekle")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{
            java.util.Date d=new java.util.Date();
   
    String pno=request.getParameter("pno");
    String servis=request.getParameter("servis");
    int bakim=Integer.parseInt(request.getParameter("bakim"));
    String bay=request.getParameter("bay");
    String bgun=request.getParameter("bgun");
    String byil=request.getParameter("byil");
    String eay=request.getParameter("eay");
    String egun=request.getParameter("egun");
    String eyil=request.getParameter("eyil");
    
    String baslangic=byil+"/"+bgun+"/"+bay;
    String bitis=eyil+"/"+egun+"/"+eay;
     java.text.DateFormat df=new SimpleDateFormat("yyyy/dd/MM");
     
String sqlsorgu="INSERT INTO servisantlasmasi values(?,?,?,?,?)"; 

PreparedStatement sorgulama=con.prepareStatement(sqlsorgu);

sorgulama.setString(1,pno);
sorgulama.setDate(2,new java.sql.Date(df.parse(baslangic).getTime()));
sorgulama.setDate(3,new java.sql.Date(df.parse(bitis).getTime()));
sorgulama.setString(4,servis);
sorgulama.setInt(5,bakim);
sorgulama.executeUpdate();

} %>
<br>
    <p>Kayit Eklenmistir</p>
    <a href="form.jsp">Ana Sayfaya Geri Don</a>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>