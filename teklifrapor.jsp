<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            java.util.Date d=new java.util.Date();
            int f=0;
            HttpSession onemli=request.getSession();
            if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli") {
                f=1;
            }
            try{
                if(onemli.getValue("raporlama")=="raporlama") {
                    f=1;
                }
            } catch(Exception e) { }

            if(f==0) {
                out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
            } else{
            %>    
            <table border="1">
            <form action="teklifrapor1.jsp" method=post>
            <tr>
            <th colspan="2">Teklif Rapor Ekrani</td>
            </tr>
            <tr>
                <th>Firma Adi </td><td><input type=text name="firmaadi"></td>
            </tr>
            <tr>
                <th>Baslangic(Arama kriteri Baslangic Tarihi)</td>
                <td>Ay:
                    <select name="bay">
                    <% for(int i=1;i<=12;i++)
                    {    
                    if(i==d.getMonth()+1) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>
                <td> Gun:  <select name="bgun">
                    <% for(int i=1;i<=31;i++)
                    {    
                    if(i==d.getDate()) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>
                <td> Yil:  <select name="byil">
                    <% for(int i=2000;i<=2010;i++)
                    {    
                    if(i==d.getYear()+1900-1) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>   
            </tr>
            <tr>
                <th>Bitis(Arama kriteri Bitis Tarihi)</td>
                <td>Ay:
                    <select name="tay">
                    <% for(int i=1;i<=12;i++)
                    {    
                    if(i==d.getMonth()+1) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>
                <td> Gun:  <select name="tgun">
                    <% for(int i=1;i<=31;i++)
                    {    
                    if(i==d.getDate()) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>
                <td> Yil:  <select name="tyil">
                    <% for(int i=2000;i<=2010;i++)
                    {    
                    if(i==d.getYear()+1900) {
                    %>
                    <option value=<%=i%> selected><%=i%></option>
                                            <% } else { %>
                        <option value=<%=i%>><%=i%></option>
                    <% } }%>
                </td>
            </tr>
            <tr>
                <th>Teklif Goturulen Is</td><td><input type=text name="konu"></td>
            </tr>
            <tr>
                <th>Teklifi Goturen Kullanici</td><td><input type="text" name="username"></td>
            </tr>
            <tr>
                <th>Red Eddilen</td><td><input type=checkbox name="red"></td>
            </tr>
            <tr>
                <th>Potansiyel Musteri</td><td><input type=checkbox name="potansiyel"></td>
            </tr>
            <tr>
                <th colspan="2" align=center><input type=submit value="Sorgula"></td>
            </tr>
        </table>
        <p><a href="teklif1.jsp">Geri</a></p>
    </body> 
    <% } %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>