<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>

<html>
    <head>
      <link rel="stylesheet" href="mtk.css" type="text/css">
        <link rel="stylesheet" href="chosen.css">
  <style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
   
   
            <script>
if (windowname. closed == true) 
{ 
window.close(); 
session.invalidate(); 
} 

            function check()
            {
            
                if(document.a.tip.value==-1)
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
                
        
                
                if(document.a.lokasyon.value==0)
            {
                alert("Lütfen bir lokasyon giriniz !");
            return false;
                }
         if(document.a.sikayetci.value==0)
            {
                alert("Lütfen Ilgili birini giriniz !");
            return false;
                }        
                }

</script>

 <script language="javascript" type="text/javascript">  
     
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="state.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("tip").innerHTML=xmlHttp.responseText   
      }   
      }
      
      

      </script>  
    </head>
    <body>
        <%@include file="topborder.jsp"%>

<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
    
    if(request.getParameter("btn_submit")==null)
    {
        String user=session.getAttribute("userid").toString();
        String param = request.getParameter("param");
    if (param == null)
        param = "";
       if(user.compareTo("admin")==0||user.compareTo("120293")==0||user.compareTo("137559")==0||user.compareTo("193174")==0||user.compareTo("194222")==0||user.compareTo("193139")==0||user.compareTo("196871")==0)
       {
           
           
            if (param.compareTo("InformationEntry") != 0){
%><SPAN style="font-size: 10pt">
    <p align="center">  <img SRC="right.gif"><b><a href="ArizaBildirim.jsp?param=InformationEntry">Admin Islemleri</a></b></p> </SPAN>

            <%
       }
     //out.print(user);
         else { %>

         <p align="center"><SPAN style="font-size: 10pt"><b><img SRC="down.gif"><a href="ArizaBildirim.jsp">Admin Islemleri</a></b> </SPAN></p>
           <p align="center"><a href="personel.jsp"  >Kullanıcı Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="lokasyon.jsp"  >Lokasyon Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="istatistik.jsp"  >İstatistikler</a></p>
            <p align="center"><a href="arizatipi.jsp?tip=kgs"  >Kgs Arıza Tipi Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="arizatipi.jsp?tip=kamera"  >Kamera Arıza Tipi Ekle,Güncelle,Sil</a></p>
        <%
            }
            }
            
%>
       <%    if (param.compareTo("Musteri") != 0){
%><SPAN style="font-size: 10pt">
    <p align="center">   <img SRC="right.gif"><b><a href="ArizaBildirim.jsp?param=Musteri" >Arıza Islemleri</a></b></p></SPAN> 

<%  } else { %>
<SPAN style="font-size: 10pt"><p align="center"><b><img SRC="down.gif"><a href="ArizaBildirim.jsp">Ariza Islemleri</a></b></SPAN></p>
        <p align="center"> <a  href='acikariza.jsp'>Açık Arızalar</a></p>
    <p align="center"> <a  href='ttonay.jsp'>TT Onayı Bekleyen Arızalar</a></p>
    <p align="center"> <a href='rapor.jsp'>Geçmiş Arıza Raporlama</a></p>
       
         <%   } %>


    
    <h3 align="center">TT KGS & KAMERA ARIZA KAYIT</h1>

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
                    <th>Arıza ile ilgili döküman</th>
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
        </form>
    <form  action="ArizaBildirim.jsp" method=post name="a" onsubmit="return check()">
        
          <tr><th>Sistem İsmi </th>
          <td>   <select   style="width: 360px" id="country"  name="country" onchange="showState(this.value)">  
       <option value="none">Seçiniz</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 Statement stmt = con.createStatement(); 
  Statement stmt2 = con.createStatement();  

 ResultSet rs = stmt.executeQuery("Select distinct tip from arizatipi");
  ResultSet rs2 = stmt2.executeQuery("Select * from lokasyon_full order by name");

 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>  
      <%
 }
     %>
              </select>  </td>
      </tr>
       <tr>
          
          <th>Arıza Tipi</th>  
          <td>
     
      <select style="width: 360px" id="tip" name="tip" >  
      <option  value='-1'>Seçiniz</option>  
      </select>  
   
          </td></tr>
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
 
     <td>   <select data-placeholder="Choose a Country..." class="chosen-select"  tabindex="2" style="width: 360px" id="lokasyon"  name="lokasyon" >  
       <option value="0">Seçiniz</option> 
  <%
 
  while(rs2.next()){
     %>
      <option value="<%=rs2.getString(2)%>"><%=rs2.getString(2).toUpperCase()%></option>  
      <%
 }
 
 
 
 %>
    </select>  </td>
</tr>
       <tr>

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

      <td  colspan="2"> <button name="btn_submit">Kaydet</button></td>

</tr>
   </table>

</form> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
  <script src="chosen.jquery.js" type="text/javascript"></script>
  <script type="text/javascript">
    var config = {
      '.chosen-select'           : {search_contains: true},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
      
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
    </body>
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
       String sistem=request.getParameter("country");
       String tip=request.getParameter("tip");
  



           String sorgu = "insert into kayit (firma_adi,projeno,kayit_tarihi,kayit_saati,sikayetci,tel,sorun,sikayeti_alan,onay,antlasma,garanti,iscinsi,eleman,randevu,bolge,lokasyon,sistem,arizatipi,filename,onem) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            sorgulama.setString(16, request.getParameter("lokasyon"));
            sorgulama.setString(17, sistem);
            sorgulama.setString(18, tip);
            sorgulama.setString(19, file);
            sorgulama.setString(20, request.getParameter("onem"));

            sorgulama.executeUpdate();
            
              onemli=request.getSession(true);
            onemli.removeValue("upload");
          
%>            
<script>
                  alert("Arıza kaydınız oluşturulmuştur.");
                window.location.href="ArizaBildirim.jsp"; 
                </script>
  <%
            
   
    con.close();
    
    }
            String user=session.getAttribute("userid").toString();

    %>
            <p align="center"> <a align="right" href='sifredegistir.jsp'><%=user%></a></p>
             <p align="center"> <a align="right" href='frame.jsp'>İstatistikler</a></p>

         <p align="center"> <a align="right" href='logout.jsp'>Çıkış</a></p>

</html>
