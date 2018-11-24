<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
     
    <% 
    String values[]=request.getParameterValues("is");
      String is="";
       
       for(int i=0;i<values.length;i++)
       {
           if(i==values.length-1)
           {
               is+=values[i];
           }
           else{
           is+=values[i]+"-";
           }
       }
       String gun=request.getParameter("gun");
       String ay=request.getParameter("ay");
       String yil=request.getParameter("yil");
       String sonkullanici=request.getParameter("sonkullanici");
       String date=yil+"/"+gun+"/"+ay;
       java.text.DateFormat df=new SimpleDateFormat("yyyy/dd/MM");
     String birim=request.getParameter("birim");
       
    String sorgu="update yapilanis set proje_no=?,iscinsi=?,teslim_tarihi=?,tutar=?,bilgi=?,gs=?,birim=?,sonkullanici=? where proje_no=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,request.getParameter("projeno"));
    sorgulama.setString(2,is);
    sorgulama.setDate(3,new java.sql.Date(df.parse(date).getTime()));
    sorgulama.setFloat(4,Float.parseFloat(request.getParameter("tutar")));
    sorgulama.setString(5,request.getParameter("not"));
    sorgulama.setInt(6,Integer.parseInt(request.getParameter("gs")));
    sorgulama.setString(7,birim);
        sorgulama.setString(8,sonkullanici);
    sorgulama.setString(9,request.getParameter("projeno"));
    sorgulama.executeUpdate();
    
    
    %>
    <p><a href="projearama.jsp?proje=<%=request.getParameter("projeno")%>">Geri donmek icin tiklayin</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>