<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <table align=center>   
            <form action="personelekle1.jsp" method=post>
                <tr>
                    <th>Personel Adi</td>
                    <td><input type=text name="ad"></td>
                </tr>
                <tr>
                    <th>Personel Soyadi </td>
                    <td><input type=text name="soyad"></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type=submit value="Ekle"></td>
                </tr>  
            </form>
        </table>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>