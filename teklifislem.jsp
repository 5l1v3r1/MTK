<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            HttpSession files=request.getSession();

            String file=(String)files.getValue("file");
            String konu=request.getParameter("konu");
            int du=0;
            HttpSession onemli=request.getSession();
            String user=request.getParameter("user");

            java.util.Date d=new java.util.Date();
            java.text.DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd");

            String date=(String)df.format(d);
            String filename=file;
            String extra=request.getParameter("extra");

            PreparedStatement x=con.prepareStatement("select count(*) from teklif where filename=?");
            x.setString(1,filename);
            ResultSet s=x.executeQuery();
            s.next();
            if(Integer.parseInt(s.getString(1))==0) {
                PreparedStatement sorgulama=con.prepareStatement("insert into teklif (firma_adi,konu,filename,username,tarih,durum,extra)values(?,?,?,?,?,?,?)");
                sorgulama.setString(1,request.getParameter("fad"));
                sorgulama.setString(2,konu);
                sorgulama.setString(3,filename);
                sorgulama.setString(4,user);
                sorgulama.setDate(5,new java.sql.Date(df.parse(date).getTime()));
                sorgulama.setInt(6,du);
                sorgulama.setString(7,extra);
                sorgulama.executeUpdate();
            } else
                out.print("<strong>Bu teklif dosyasindan zaten bulunmaktadir...</strong>");
            %>
            <p><a href="teklif1.jsp">Geri</a></p>
        </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>