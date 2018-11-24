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
                Statement sorgulama2=con.createStatement();
                ResultSet sonuc2=sorgulama2.executeQuery("select * from yapilaniss");

            %>
            <table border="1" align=center>
                <form action="teklifadd.jsp" method=post name="add">
            <tr>
                <th colspan="2">Musteri Bilgisi Gir</td>
            </tr>  
            <tr>
                <th>Firma Adi</td>
                <td><input type=text size="30" name="fad" maxlength="30"></td>
            </tr>  
            <tr>
                <th>Sokak/No</td>
                <td><input type=text size="30"  name="sokak" maxlength="30"></td>
            </tr>  
            <tr>
                <th>Cadde</td>
                <td><input type=text size="20" name="cadde" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Semt</td>
                <td><input type=text size="10" name="semt" maxlength="10"></td>
            </tr>  
            <tr>
                <th>Ilce</td>
                <td><input type=text size="15" name="ilce" maxlength="15"></td>
            </tr>  
            <tr>
                <th>Il</td>
                <td><input type=text size="15" name="il" maxlength="15"></td>
            </tr>  
            <tr>
                <th>PostaKodu</td>
                <td><input type=text size="5" name="posta" maxlength="5"></td>
            </tr>  
            <tr>
                <th>Ilgili Kisi</td>
                <td><input type=text size="20" name="ilgili" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Tel1</td>
                <td><input type=text size="20" name="tel1" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Tel2</td>
                <td><input type=text size="20" name="tel2" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Dahili_No</td>
                <td><input type=text size="10" name="dno" maxlength="10"></td>
            </tr>  
            <tr>
                <th>Cep Tel</td>
                <td><input type=text size="20" name="ceptel" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Faks</td>
                <td><input type=text size="20" name="faks" maxlength="20"></td>
            </tr>  
            <tr>
                <th>Email</td>
                <td><input type=text size="50" name="email" maxlength="50"></td>
            </tr>  
            <tr>
                <td colspan="2" align=center><input type=submit value="Ileri">
                <input type=reset value="temizle"></td>
            </tr>
        </table>
        </form>
        <p align=right><a href="form.jsp">Geri</a></p>
    </body>
    <% } %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>