<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Random"%>


<%
  //  HttpSession onemli=request.getSession();
  //  String user=(String)onemli.getValue("user");

    
    String user=session.getAttribute("userid").toString();
    java.util.Date d=new java.util.Date();
    java.text.DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd");

    String date=(String)df.format(d);

   
    String err = "";
    String lastFileName = "";

    String contentType = request.getContentType();
    String boundary = "";
    final int BOUNDARY_WORD_SIZE = "boundary=".length();
    if(contentType == null || !contentType.startsWith("multipart/form-data")) {
        err = "Ilegal ENCTYPE : must be multipart/form-data\n";
        err += "ENCTYPE set = " + contentType;
    }else{
        boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
        boundary = "--" + boundary;
        try {
            javax.servlet.ServletInputStream sis = request.getInputStream();
            byte[] b = new byte[1024];

            int x=0;
            int state=0;
            String name=null,fileName=null,contentType2=null;
            java.io.FileOutputStream buffer = null;
            while((x=sis.readLine(b,0,1024))>-1) {
                String s = new String(b,0,x);

                if(s.startsWith(boundary)) {
                    state = 0;
                    //out.println("name="+name+"<br>");
                    //out.println(fileName+"<br>");

                    name = null;
                    contentType2 = null;
                    fileName = null;


                }else if(s.startsWith("Content-Disposition") && state==0) {
                    state = 1;
                    if(s.indexOf("filename=") == -1)
                        name = s.substring(s.indexOf("name=") + "name=".length(),s.length()-2);
                    else {
                        name = s.substring(s.indexOf("name=") + "name=".length(),s.lastIndexOf(";"));
                        fileName = s.substring(s.indexOf("filename=") + "filename=".length(),s.length()-2);
                        if(fileName.equals("\"\"")) {
                            fileName = null;
                        }else {
                            String userAgent = request.getHeader("User-Agent");
                            String userSeparator="/";  // default
                            if (userAgent.indexOf("Windows")!=-1)
                                userSeparator="\\";
                            if (userAgent.indexOf("Linux")!=-1)
                                userSeparator="/";
                            fileName = fileName.substring(fileName.lastIndexOf(userSeparator)+1,fileName.length()-1);
                            if(fileName.startsWith( "\""))
                                fileName = fileName.substring( 1);
                        }
                    }
                    name = name.substring(1,name.length()-1);
                    if (name.equals("file")) {
                        if (buffer!=null)
                            buffer.close();
                       // lastFileName = fileName;
                        Random rng=new Random();
                        String characters="absfgh1234";
                        char[] text = new char[5];
		    for (int i = 0; i < 5; i++)
		    {
		        text[i] = characters.charAt(rng.nextInt(characters.length()));
		    }
                    String newFilename=new String(text);
                    String[] result = fileName.split("\\.");
                    String extension=result[1];
                    
                        fileName=user+"_"+date+"_"+newFilename+"."+ extension;
                        lastFileName = fileName;

                        buffer = new java.io.FileOutputStream("/var/lib/tomcat/webapps/MTK/ArizaBildirim/uploads/" + fileName);
                      // buffer = new java.io.FileOutputStream("D:\\" + fileName);
                        HttpSession files=request.getSession(true);
                        files.putValue("file",fileName);
                    }
                }else if(s.startsWith("Content-Type") && state==1) {
                    state = 2;
                    contentType2 = s.substring(s.indexOf(":")+2,s.length()-2);
                }else if(s.equals("\r\n") && state != 3) {
                    state = 3;
                }else {
                    if (name.equals("file"))
                        buffer.write(b,0,x);
                }
            }
            sis.close();
            buffer.close();
        }catch(java.io.IOException e) {
            err = e.toString();
        }
    }
    boolean ok = err.equals("");
    if(!ok) {
        out.println(err);
    }else{
         HttpSession onemli=request.getSession();
         onemli.setAttribute("upload", lastFileName);
  //  String user=(String)onemli.getValue("user");
        
        
%>
    
<SCRIPT language="javascript">
    window.location="ArizaBildirim.jsp";
   // history.back(1)
    alert('UPLOAD edilmistir. <%=lastFileName%>');

</SCRIPT>
    <%
        }
        out.println("done");

    %>

