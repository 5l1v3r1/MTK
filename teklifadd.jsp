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
            String user=(String)onemli.getValue("user");

            Statement sorgulama3=con.createStatement();
            ResultSet sonuc3=sorgulama3.executeQuery("select * from yapilaniss");

            PreparedStatement sorgulama2=con.prepareStatement("select count(*) from musteri where firma_adi=?");
            sorgulama2.setString(1,request.getParameter("fad"));
            ResultSet sonuc2=sorgulama2.executeQuery();
            sonuc2.next();

            if(Integer.parseInt(sonuc2.getString(1))==0) {

                String sqlsorgu="INSERT INTO musteri(firma_adi,Sokak_No,cadde,semt,ilce,il,posta_kodu,ilgiliKisi,tel1,tel2,dahili_no,cep_tel,faks,email,statu) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement sorgulama=con.prepareStatement(sqlsorgu);

                sorgulama.setString(1,request.getParameter("fad"));
                sorgulama.setString(2,request.getParameter("sokak"));
                sorgulama.setString(3,request.getParameter("cadde"));
                sorgulama.setString(4,request.getParameter("semt"));
                sorgulama.setString(5,request.getParameter("ilce"));
                sorgulama.setString(6,request.getParameter("il"));
                sorgulama.setString(7,request.getParameter("posta"));
                sorgulama.setString(8,request.getParameter("ilgili"));
                sorgulama.setString(9,request.getParameter("tel1"));
                sorgulama.setString(10,request.getParameter("tel2"));
                sorgulama.setString(11,request.getParameter("dno"));
                sorgulama.setString(12,request.getParameter("ceptel"));
                sorgulama.setString(13,request.getParameter("faks"));
                sorgulama.setString(14,request.getParameter("email"));
                sorgulama.setInt(15,0);
                sorgulama.executeUpdate();
            } else
                out.println("<strong>Bu isimde bir Musteri zaten kayitlidir...</strong>");
            if(Integer.parseInt(sonuc2.getString(1))==0) {
        %>
        <form name="uploadForm" action="dee.jsp" enctype="multipart/form-data" method="post">
            <table>
                <tr>
                    <th><%=request.getParameter("fad")%> Sirketi icin Teklif Dokumanini yukleyiniz...</td>
                </tr>
                <tr>
                    <TD><input type="file" name="file"/><input TYPE=Button name='Upload' Value='Upload' onClick="uploadForm.Upload.value='Uploading...';document.uploadForm.action='dee.jsp';document.uploadForm.submit()"></TD>
                </tr>
            </table>
        </form>
        <table>
            <form name="a" action="teklifislem.jsp" method=post>
                <input type=hidden name=fad value="<%=request.getParameter("fad")%>">
                <tr>
                    <th>Konu</td>
                    <td>
                        <select name="konu">
                            <% while(sonuc3.next()) { %>
                            <option value=<%=sonuc3.getString(1)%>><%=sonuc3.getString(1)%></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Ekleyen</td>
                    <td><input type=text name="user" value="<%=user%>"></td>
                    </td>
                </tr>
                <tr>
                    <th>Extra</td>
                    <td><textarea name="extra"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit value="Gonder"></td>
                </tr>
            </form>
        </table>
        <% } %>
        <p><a href="teklif1.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>