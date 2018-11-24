<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
   
    <%
        


String sqlsorgu="INSERT INTO musteri(firma_adi,Sokak_No,cadde,semt,ilce,il,posta_kodu,ilgiliKisi,tel1,tel2,dahili_no,cep_tel,faks,email,statu) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement sorgulama=con.prepareStatement(sqlsorgu);

sorgulama.setString(1,request.getParameter("fad"));
sorgulama.setString(2,request.getParameter("sokak"));
sorgulama.setString(3,request.getParameter("cadde"));
sorgulama.setString(4,request.getParameter("semt"));
sorgulama.setString(5,request.getParameter("ilce"));
sorgulama.setString(6,request.getParameter("il"));
sorgulama.setString(7,request.getParameter("posta"));
sorgulama.setString(8,request.getParameter("ilgili"));
sorgulama.setString(9,request.getParameter("tel1"));
sorgulama.setString(10,request.getParameter("tel2"));
sorgulama.setString(11,request.getParameter("dno"));
sorgulama.setString(12,request.getParameter("ceptel"));
sorgulama.setString(13,request.getParameter("faks"));
sorgulama.setString(14,request.getParameter("email"));
sorgulama.setInt(15,1);
sorgulama.executeUpdate();

    
    %>
    <br>
    <p>Kayit Eklenmistir</p>
    <a href="form.jsp">Son Hali gormek icin tikla</a>
  
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>