<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar.*"%>
<%@page import="java.text.*"%>

<html>
    <head>
       
        <title>JSP Page</title>
    </head>
    <body>
<HTML> 

<form name="uploadForm" action="dee.jsp" enctype="multipart/form-data" method="post">
  <input type="file" name="file"/>
  <input TYPE=Button name='Upload' Value='Upload' onClick="uploadForm.Upload.value='Uploading...';document.uploadForm.action='dee.jsp';document.uploadForm.submit()">

</form>



</HTML> 






    </body>
</html>
