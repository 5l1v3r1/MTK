<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>



<head>
     <link rel="stylesheet" href="mtk.css" type="text/css">
        <link rel="stylesheet" href="chosen.css">
            
             <style type="text/css">
            body {
            }
        </style>
        <link rel="stylesheet" type="text/css" href="tautocomplete.css" />
        <script src="jquery.js" type="text/javascript"></script>
        <script src="tautocomplete.js" type="text/javascript"></script>
  <style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>
   <script>
            $(document).ready(function () {
                var text2 = $("#Text2").tautocomplete({
                    width: "700px",
                    columns: ['name'],
                    ajax: {
                        url: "kapo.json",
                        type: "GET",
                        data: function () {
                            return [{ test: text2.searchdata() }];
                        },
                        success: function (data) {
                            
                            var filterData = [];

                            var searchData = eval("/" + text2.searchdata() + "/gi");

                            $.each(data, function (i, v) {
                                if (v.country.search(new RegExp(searchData)) != -1) {
                                    filterData.push(v);
                                }
                            });
                            return filterData;
                        }
                    },
                    onchange: function () {
					
                        $("#ta-txt").html(text2.text());
                        $("#ta-id").html(text2.id());
                    }
                });
            });
        </script>
                <script>
if (windowname. closed == true) 
{ 
window.close(); 
session.invalidate(); 
} 

            function check()
            {
                
                 
                if(document.a.country.value==-1)
            {
                alert("Lütfen Arıza Tipi giriniz !");
            return false;
                }    
          
               if(document.a.onem.value==0)
            {
                alert("Lütfen Onem duzeyi giriniz !");
            return false;
                }      
       
            if(document.a.sorun.value==0)
            {
                alert("Lütfen bir sorun giriniz !");
            return false;
                }
                
        
                
                
         if(document.a.sikayetci.value==0)
            {
                alert("Lütfen Ilgili birini giriniz !");
            return false;
                }        
               
                }

</script>

    
    
</head>
<body>
    <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
    
    if(request.getParameter("btn_submit")==null)
    {
        
        String user=session.getAttribute("userid").toString();
        String param = request.getParameter("param");
        %>
       <h3 align="center">FİDES KAMERA ARIZA KAYIT</h1>

    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello= ue&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
         <table  border="1" align="center">

      <form name="uploadForm" action="dee.jsp" enctype="multipart/form-data" method="post">
                <tr>
                    <th>Arıza detayı ilgili döküman(Arıza Formunu Kaydetmeden önce dosya yükleyin )</th>
                    <%
       
       
       HttpSession onemli=request.getSession();
       
       if(onemli.getValue("upload")!=null)
       {
           String fileName=onemli.getValue("upload").toString();
           %>
                    
                    <TD><input name="filename" readonly type="text" value="<%=fileName%>"/></TD>
            
           
       <%
       }
       else 
       {
       %>
                    <TD><input  type="file" name="file"/><input TYPE=Button name='Upload' Value='Upload' onClick="uploadForm.Upload.value='Uploading...';document.uploadForm.action='dee.jsp';document.uploadForm.submit()"></TD>
                </tr>
                <% }%>
                </table>
        </form>
                
                <br>
                <br>
    <form  action="fideskamera.jsp" method=post name="a" onsubmit="return check()">
                 <table  border="1" align="center">
 
          <tr><th>Arıza Tipi </th>
          <td>   <select   style="width: 360px" id="country"  name="country" onchange="showState(this.value)">  
       <option value="-1">Seçiniz</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 Statement stmt = con.createStatement(); 
  Statement stmt2 = con.createStatement();  

 ResultSet rs = stmt.executeQuery("Select ariza  from arizatipi where tip='kamera'");
  ResultSet rs2 = stmt2.executeQuery("Select * from lokasyon order by name");

 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>  
      <%
 }
     %>
              </select>  </td>
      </tr>
       <tr>
          
         
           <tr>
      <th>Önem Düzeyi </th>
      <td><select  style="width: 360px" name="onem">
            <option value="0">Seciniz</option>
            <option value="acil">TT Arıza</option>
            <option value="normal">Normal</option>
    </select>
    </td>
      </tr>
      
     
         <tr>

    <th nowrap>Lokasyon:  </th>
 
     <td>   
 
            <input name="Text2" size="500" type="text" id="Text2" style="width: 400px; font-size:16px;" /><br /><br />

 
  </td>
</tr>
       <tr>
       <input type="hidden" name="pre" value="<%=request.getParameter("pre")%>"></input>
    <th nowrap > Servise Gelindiğinde Görüşülecek Kişi: </th>
 
<td><input size="50" name="sikayetci" type="text" placeholder="Yetkili giriniz.." ></td>

  

       </tr>
    
<!-- Text input-->
<tr>

    <th nowrap>Telefon: </th> 
 
      <td> <input size="50"  name="tel" type="text" placeholder="Telefon Giriniz.." ></td>
   
 
</tr>
    
<tr>

    <th>Arıza Açıklama: </th>
                    
    <td> <textarea rows="10" cols="50" placeholder="Sorun Giriniz.." name="sorun"></textarea></td>

</tr>
<!-- Button -->
<tr align="center">

      <td  colspan="2"> <button name="btn_submit">Arıza Kaydet</button></td>

</tr>
   </table>
                    <p align="center"><a href="ArizaBildirim.jsp">Geri</a></p>

</form>
    
     <%

    }
    
    else
    {
        
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
  String user=session.getAttribute("userid").toString();
  String file="";
       HttpSession onemli=request.getSession();

      if(onemli.getValue("upload")!=null)
       {
            file=onemli.getValue("upload").toString();
       }
  
          DateFormat df = new SimpleDateFormat("yyyy/dd/MM hh:mm:ss");
          java.util.Date dd = new java.util.Date();
       String y = String.valueOf(df.format(dd));  
       String tip=request.getParameter("country");
  


       int pre=Integer.parseInt(request.getParameter("pre"));
       String pree="";
       
       if(pre==11)
       {
           
           pree="Genel İzleme Problemi > Sadece Kayıtlar İzlenemiyor";
       }
        if(pre==1)
       {
           
           pree="Genel İzleme Problemi > Canlı İzleme Yapılamıyor > Büyük Ekranda İzleme Yapılamıyor > Monitör ve Decoder Çalışıyor";
       }
              if(pre==2)
       {
           
           pree="Genel İzleme Problemi > Canlı İzleme Yapılamıyor > İzleme Bilgisayarında Kameralar izlenmiyor > Bilgisayarda Program Çalışıyor > Ağdaki Diğer cihazlara bağlantı var";
       }
             if(pre==3)
       {
           
           pree="Kameraların bazıları izlenemiyor > Bir Kamera İzlenmiyor > Kameraya Ping Atılıyor";
       }
                if(pre==4)
       {
           
           pree="Kameraların bazıları izlenemiyor > Bir Kamera İzlenmiyor > Kameraya Ping Atılmıyor > Kameranın Işıkları Yanıyor";
       }
             
                  if(pre==5)
       {
           
           pree="Kameraların bazıları izlenemiyor > Bir Grup Kamera İzlenmiyor > Kameranın bağlı olduğu ağ cihazındaki diğer kameralar izleniyor";
       }
       

           String sorgu = "insert into kayit (firma_adi,projeno,kayit_tarihi,kayit_saati,sikayetci,tel,sorun,sikayeti_alan,onay,antlasma,garanti,iscinsi,eleman,randevu,bolge,lokasyon,sistem,arizatipi,filename,onem,sirket,pre) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement sorgulama = con.prepareStatement(sorgu);
            sorgulama.setString(1, "TURK TELEKOM ARIZA");
            sorgulama.setString(2, "ProjesizAriza");
            sorgulama.setDate(3, new java.sql.Date(df.parse(y).getTime()));
            sorgulama.setTime(4, new java.sql.Time(System.currentTimeMillis()));
            sorgulama.setString(5, request.getParameter("sikayetci"));
            sorgulama.setString(6, request.getParameter("tel"));
            sorgulama.setString(7, request.getParameter("sorun"));
            sorgulama.setString(8, user);
            sorgulama.setInt(9, 0); //onay
            sorgulama.setInt(10, 0);  //antlasma
            sorgulama.setInt(11, 0);
            sorgulama.setString(12, "");
            sorgulama.setString(13, "");
            sorgulama.setTimestamp(14, null);
            sorgulama.setString(15, "TELEKOM");
            sorgulama.setString(16, request.getParameter("Text2").substring(4));
            sorgulama.setString(17, "kamera");
            sorgulama.setString(18, tip);
            sorgulama.setString(19, file);
            sorgulama.setString(20, request.getParameter("onem"));
            sorgulama.setString(21, "fides");
            sorgulama.setString(22, pree);
            sorgulama.executeUpdate();
             String maxQuery="select max(mid) from kayit";
           Statement maxs=con.createStatement();
           ResultSet rs4=maxs.executeQuery(maxQuery);
           rs4.next();
           
           int mid=rs4.getInt(1);
           
           out.print("Arıza kayit id 'si :" +mid);
              onemli=request.getSession(true);
            onemli.removeValue("upload");
          
%>            
<script>
                  alert("Arıza kaydınız oluşturulmuştur.");
                window.location.href="ArizaBildirim.jsp"; 
                </script>
  <%
            
   
   // con.close();
    
    }
    
    %>
</body>
</html>
