<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            HttpSession onemli=request.getSession();
            if(onemli.getValue("pas")!="gecerli") {
                response.sendRedirect("login.jsp");
            }
            Statement sorgulama=con.createStatement();
            ResultSet sonuc=sorgulama.executeQuery("select * from kullanicilar");

            String s="";
            String ms="";
            String mg="";
            String me="";
            String r="";
            String pe="";
            String pd="";
            String ps="";
            String f="";
            %>
        <table border="1">
            <tr>
            <th width="60"><strong>Kullanici</strong></td>
                <th width="60"><strong>Sifresi</strong></td>
                <th width="60"><strong>Musteri Silme</strong></td>
                <th width="60"><strong>Musteri Ekleme</strong></td>
                <th width="60"><strong>Musteri Degistirme</strong></td>
                <th width="60"><strong>Raporlama</strong></td>
                <th width="60"><strong>Proje Ekle </strong></td>
                <th width="60"><strong>Proje Duzelt</strong></td>
                <th width="60"><strong>Proje Sil</strong></td>
                <th width="60"><strong>Fatura Kes</strong></td>
                <th width="60"><strong>Teklif Verme</strong></td>
                <th width="60"><strong>&nbsp;</td>
                <th width="60"><strong>&nbsp;</td>
            </tr>
            <% while(sonuc.next()){
            %>
            <tr>
                <td><%=sonuc.getString(1)%></td>
                <td><%=sonuc.getString(2)%></td>
                <% 
                if(Integer.parseInt(sonuc.getString(3))==1)
                    {
                        %>
                <td>Var</td> <% } else { %> <td>Yok</td> <% }             
                if(Integer.parseInt(sonuc.getString(4))==1)
                    {
                        %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }
                    if(Integer.parseInt(sonuc.getString(5))==1) {
                    %> <td>Var</td>           
                <% } else { %> <td>Yok</td> <% }       
                    if(Integer.parseInt(sonuc.getString(6))==1) {
                    %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }
                    if(Integer.parseInt(sonuc.getString(7))==1) {
                    %><td>Var</td> 
                <% } else { %> <td>Yok</td> <% }
                if(Integer.parseInt(sonuc.getString(8))==1)
                {
                %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }    
                    if(Integer.parseInt(sonuc.getString(9))==1) {
                    %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }    
                    if(Integer.parseInt(sonuc.getString(10))==1) {
                    %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }       
                    if(Integer.parseInt(sonuc.getString(11))==1) {
                            %> <td>Var</td>
                <% } else { %> <td>Yok</td> <% }
                %>
                <td><a href="yetkidegistir.jsp?user=<%=sonuc.getString(12)%>"><%=resources.getString("Modify")%></a></p></td>
                <td><a href="kullanicisil.jsp?user=<%=sonuc.getString(12)%>"><%=resources.getString("Delete")%></a></p></td>
            </tr>
            <% } %> 
        </table>
        <br>
        <hr>
        <br>
        <table>
            <form action="kullaniciekle.jsp" method=post>
                <tr>
                    <th colspan="2" align=center>Yeni Kullanici Ekle</td>
                </tr>
                <tr>
                    <th><%=resources.getString("Username")%></td>
                    <td><input type=text name="user"></td>
                </tr>
                <tr>
                    <th><%=resources.getString("Password")%></td>
                    <td><input type=password name="sifre"</td>
                </tr>
                <tr>
                    <th>Yetkiler</td>
                    <td>
                        <table>
                            <tr><td>Musteri Ekle</td><td><input type=checkbox name="gorme" value="yes"></td></tr>
                            <tr><td>Musteri Silme</td><td><input type=checkbox name="silme" value="yes"></td></tr>
                            <tr><td>Musteri Degistirme</td><td><input type=checkbox name="update" value="yes"></td></tr>
                            <tr><td>Raporlama</td><td><input type=checkbox name="rapor" value="yes"></td></tr>
                            <tr><td>Proje Ekle</td><td><input type=checkbox name="pekle" value="yes"></td></tr>
                            <tr><td>Proje Degistirme</td><td><input type=checkbox name="pupdate" value="yes"></td></tr>
                            <tr><td>Proje Silme</td><td><input type=checkbox name="psilme" value="yes"></td></tr>
                            <tr><td>Fatura Kesme</td><td><input type=checkbox name="fatura" value="yes"></td></tr>
                            <tr><td>Teklif Verme</td><td><input type=checkbox name="teklifv" value="yes"></td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit value="Ekle"></td>
                </tr>
            </form>
        </table>
        <br>
        <hr>
       
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>