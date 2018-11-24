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
            if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli") {
                f=1;
            }
            try{
                if(onemli.getValue("teklif")=="teklif") {
                    f=1;
                }
            } catch(Exception e) { }

            if(f==0) {
                out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
            } else{
        %>    
        <p><strong><a href="potansiyelekle.jsp">Yeni Potansiyel Teklif Ekle </a></strong></p>
        <p><strong><a href="teklifekle.jsp">Kayitlarda Olmayan Musteri'ye Teklif Ver  </a></strong></p>
        <p><a href="cevap.jsp">Cevap Bekleyen Isler</a></p>
        <p><a href="teklifrapor.jsp">Teklif Raporlamalari</a></p>
    
        <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>