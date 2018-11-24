<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>    
        <%
            int d;
            int tid=Integer.parseInt(request.getParameter("tid"));
            String sonuc=request.getParameter("sonuc");
            String extra=request.getParameter("extra");
            String statu=request.getParameter("statu");
            String firma=request.getParameter("firma");

            if(sonuc.equals("1"))
                d=1;
            else
                d=2;

            PreparedStatement sorgulama=con.prepareStatement("update teklif set durum=?,extra2=? where tid=?");
            sorgulama.setInt(1,d);
            sorgulama.setString(2,extra);
            sorgulama.setInt(3,tid);
            sorgulama.executeUpdate();

            if(sonuc.equals("1")){
                if(statu.equals("Hayir")) {
                    PreparedStatement sorgulama2=con.prepareStatement("update musteri set statu=1 where firma_adi=?");
                    sorgulama2.setString(1,firma);
                    sorgulama2.executeUpdate();

                    out.println(firma+"si databasemize eklenmistir");
                }
            }
            %>
        <p><a href="teklif1.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>