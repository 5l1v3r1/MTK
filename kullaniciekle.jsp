<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String user=request.getParameter("user");
            String sifre=request.getParameter("sifre");
            String gorme=request.getParameter("gorme");
            String silme=request.getParameter("silme");
            String update=request.getParameter("update");
            String rapor=request.getParameter("rapor");
            String pekle=request.getParameter("pekle");
            String pupdate=request.getParameter("pupdate");
            String psilme=request.getParameter("psilme");
            String fatura=request.getParameter("fatura");
            String teklifv=request.getParameter("teklifv");
            int g,s,u,r,pe,pu,ps,f,tek;
            if(gorme==null)
                g=0;
            else    g=1;
            if(silme==null)
                s=0;
            else        s=1;
            if(update==null)
                u=0;
            else         u=1;
            if(rapor==null)
                r=0;
            else    r=1;
            if(pekle==null)
                pe=0;
            else    pe=1;
            if(pupdate==null)
                pu=0;
            else    pu=1;
            if(psilme==null)
                ps=0;
            else    ps=1;
            if(fatura==null)
                f=0;
            else    f=1;
            if(teklifv==null)
                tek=0;
            else    tek=1;
            PreparedStatement sorgulama=con.prepareStatement("insert into kullanicilar (username,sifre,bilgiler,ekleme,degistirme,raporlama,projeekle,projeduzelt,projesil,faturakes,teklif) values(?,?,?,?,?,?,?,?,?,?,?)");
            sorgulama.setString(1,user);
            sorgulama.setString(2,sifre);
            sorgulama.setInt(3,s);
            sorgulama.setInt(4,g);
            sorgulama.setInt(5,u);
            sorgulama.setInt(6,r);
            sorgulama.setInt(7,pe);
            sorgulama.setInt(8,pu);
            sorgulama.setInt(9,ps);
            sorgulama.setInt(10,f);
            sorgulama.setInt(11,tek);
            sorgulama.executeUpdate();

        %>
        <p><a href="kullanicilar.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>
<% response.sendRedirect("kullanicilar.jsp"); %> 