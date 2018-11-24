<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*,java.io.*,java.net.*" session="true" errorPage="Error.jsp"%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       
        <title>JSP Page</title>
       
    </head>
    <body>
<!--<img src="fides.jpg"><img align=right src="a.jpg" width="200">-->
    <h1>Raporlama ve Aktif Arizalar</h1>
    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    <table border="0">
    <tr>
    <td><a href="aktifariza.jsp"  >Aktif Arizalar</a></td>
    </tr>
    <tr>
    <td><a href="onayariza.jsp">Onay Bekleyen Arizalar</a></td>
    </tr>
    <tr>
    <td><a href="faturaa.jsp" >Fatura Kesimi icin Bekleyen Isler</a></td>
    </tr>
   
    <tr>
    
    <tr><td align=left><a href="baksa.jsp" >Servis Antlasmasi olan Musterilere Bak</a></td>
    </tr>
     <tr>
    <td><a href="rapor.jsp" target="MainWnd">Raporlamalar</a></td>
    </tr>
     <tr>
    <td><a href="raporperiyodik.jsp" target="MainWnd">Periyodik Bakim Gidimleri</a></td>
    </tr>
    </table>
<!--    <p align=center ><a href="form.jsp" target="MainWnd">Geri</a></p>-->
    </body>
</html>
