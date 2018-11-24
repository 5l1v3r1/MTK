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

                Statement sorgulama=con.createStatement();
                ResultSet sonuc=sorgulama.executeQuery("select * from musteri where statu=1 order by firma_adi");

                Statement sorgulama2=con.createStatement();
                ResultSet sonuc2=sorgulama2.executeQuery("select * from yapilaniss");

                String user=(String)onemli.getValue("user");
        %>
        <form name="uploadForm" action="dee.jsp" enctype="multipart/form-data" method="post">
            <table>
                <tr>
                    <th>Teklif Dokumanini yukleyiniz...</td>
                </tr>
                <tr>
                    <TD><input type="file" name="file"/><input TYPE=Button name='Upload' Value='Upload' onClick="uploadForm.Upload.value='Uploading...';document.uploadForm.action='dee.jsp';document.uploadForm.submit()"></TD>
                </tr>
            </table>
        </form>
        <table>
            <form name="a" action="potansiyel1.jsp" method=post>
                <tr>
                <th>Firma Adi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <select name="firma">
                        <% while(sonuc.next()) { %> 
                
                        <option value="<%=sonuc.getString(2)%>"><%=sonuc.getString(2)%></option>
                
                        <% } %>   
                    </select>
                </td>
                </tr>
                <tr>
                <th>Konu</td>
                <td>
                    <select name="konu">
                        <% while(sonuc2.next()) { %>
                        <option value=<%=sonuc2.getString(1)%>><%=sonuc2.getString(1)%></option>
                        <% } %>
                    </select>
                </td>
                </tr>
                <tr>
                    <th>Ekleyen</td>
                    <td><input type=text name="user" value="<%=user%>"></td>
                </tr>
                <tr>
                    <th>Extra </td>
                    <td><textarea name="extra"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit value="Gonder"></td>
                </tr>
            </form>
        </table>
        <p><a href="teklif1.jsp">Back</a></p>
        <% } %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>