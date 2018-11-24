<%@ include file="header.jsp" %>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            HttpSession onemli=request.getSession();
            String user=(String)onemli.getValue("user");
            int flag=0;

            String tekrar=request.getParameter("tekrarsifre");
            String sifre=request.getParameter("ysifre");

            if(tekrar.compareTo(sifre)==0)
                flag=1;

            int f=0;
            PreparedStatement sorgulama=con.prepareStatement("select * from admin where userid=?");
            sorgulama.setString(1,user);
            ResultSet sonuc=sorgulama.executeQuery();

            sonuc.next();

            if(sonuc.getString(2).compareTo(request.getParameter("sifre"))==0) {
                f=1;
            }

            if(f==1&&flag==1) {
                PreparedStatement sorgulama2=con.prepareStatement("update admin set sifre=? where userid=?");
                sorgulama2.setString(1,request.getParameter("ysifre"));
                sorgulama2.setString(2,user);
                sorgulama2.executeUpdate();
                out.println("<a href=admindegistir.jsp>Sifreniz Degismistir,Geri donmek icin tiklayin</a>");
            }

            if(f==0) {
                out.println("<a href=admindegistir.jsp>Eski sifrenizi yanlis girdiniz</a>");
            }

            if(flag==0) {
                out.println("<a href=admindegistir.jsp>Yeni sifrenizi yanlis girdiniz</a>");
            }
        %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@include file="ResourceEnd.jsp"%>
