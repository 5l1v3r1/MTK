<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <table>
            <form action="adarama.jsp" method=post>
                <tr>
                    <th colspan=3><center><strong>Musteri Ara</strong></center></td>
                </tr>
                <tr>
                    <th><strong>Firma Adina Gore Arama</strong></td>
                    <td><input type=text name="ad"></td>
                    <td><input type=submit value="ara"></td>
                </tr>
            </form>
            <form action="ilarama.jsp" method=post>
                <tr>
                    <th><strong>Il Adina Gore Arama   </strong></td>
                    <td><input type=text name="il"></td>
                    <td><input type=submit value="ara"></td>
                </tr>
            </form>
            <form action="projearama.jsp" method=post>
            <tr>
                <th><strong>Proje Adina Gore Arama</strong></td>
                <td><input type=text name="proje"></td>
                <td><input type=submit value="ara"></td>
            </tr>
        </table>
        </form>
      
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>