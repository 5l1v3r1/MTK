<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <table>
            <form action="yapilanissekle.jsp" method=post>
                <tr>
                    <th>Is:</td>
                    <td><input type=text name="is"></td>
                </tr>
                <tr>
                    <td><input type=submit value="ekle"></td>
                </tr>
            </form>
        </table>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>