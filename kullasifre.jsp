<%@include file="header.jsp"%>

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
<%
                HttpSession onemli=request.getSession();
                String user=(String)onemli.getValue("user");
                
              
                String tekrar=request.getParameter("tekrars?fre");
                String sifre=request.getParameter("ysifre");
                int flag=0;
                if(tekrar.compareTo(sifre)==0)
                    flag=1;
               int f=0;
               
               PreparedStatement sorgulama=con.prepareStatement("select * from kullanicilar where username=?");
               sorgulama.setString(1,user);
               ResultSet sonuc=sorgulama.executeQuery();
                    
               sonuc.next();
               
               if(sonuc.getString(2).compareTo(request.getParameter("sifre"))==0)
               {
                   f=1;
               }

               if(f==1&&flag==1)
               {
                   PreparedStatement sorgulama2=con.prepareStatement("update kullanicilar set sifre=? where username=?");
                   sorgulama2.setString(1,request.getParameter("ysifre"));
                   sorgulama2.setString(2,user);
                   sorgulama2.executeUpdate();
                    out.println("<a href=kullanicisifre.jsp>Sifreniz Degismistir,Geri donmek icin tiklayin</a>");
                   
               }
                       

                if(f==0)
                {
                   out.println("<a href=kullanicisifre.jsp>Eski sifrenizi yanlis girdiniz</a>");
                   
                }
               
               
                if(flag==0)
                {
                   out.println("<a href=kullanicisifre.jsp>Yeni sifrenizi yanlis girdiniz</a>");
                   
                }

%>

    
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
    
    </body>
         <%@include file="disconnect.jsp"%>
</html>
