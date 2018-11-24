<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
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
   
   
    response.sendRedirect("../login.jsp");
}
    
     
    
    
    if(request.getParameter("btn_submit")==null)
    {
        
        String user=session.getAttribute("userid").toString();
        
        


        String param = request.getParameter("param");
        %>
       <h3 align="center">Cihaz Ekleme</h1>

   
         <table  border="1" align="center">

                
                
                <br>
                <br>
    <form  action="cihazekle.jsp" method=post name="a" onsubmit="return check()">
                 <table  border="1" align="center">
 
          <tr><th>Cihaz Türü </th>
          <td>   <select   style="width: 360px" id="country"  name="country" onchange="showState(this.value)">  
       <option value="-1">Seçiniz</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 Statement stmt = con.createStatement(); 
  Statement stmt2 = con.createStatement();  

 ResultSet rs = stmt.executeQuery("Select tur  from cihazturu");
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

    <th nowrap>Lokasyon:  </th>
 
     <td>   
 
            <input name="Text2" size="500" type="text" id="Text2" style="width: 400px; font-size:16px;" /><br /><br />

 
  </td>
</tr>
       <tr>

    <th nowrap > Kamera Adı: </th>
 
<td><input size="50" name="cihazname" type="text" placeholder="Kamera adı giriniz.." ></td>

  

       </tr>
    
<!-- Text input-->
<tr>

    <th nowrap>Kamera IP'si </th> 
 
      <td> <input size="50"  name="ip" type="text" placeholder="IP Giriniz.." ></td>
   
 
</tr>
<tr>

    <th nowrap>Seri No:  </th> 
 
      <td> <input size="50"  name="serino" type="text" placeholder="Seri No Giriniz.." ></td>
   
 
</tr>
<!-- Button -->
<tr align="center">

      <td  colspan="2"> <button name="btn_submit">Kaydet</button></td>

</tr>
   </table>
                    <p align="center"><a href="ArizaBildirim.jsp">Geri</a></p>

</form>
    
     <%

    }
    
    else
    {
               out.println(request.getParameter("Text2"));

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
  String user=session.getAttribute("userid").toString();
  String file="";
  
          DateFormat df = new SimpleDateFormat("yyyy/dd/MM hh:mm:ss");
          java.util.Date dd = new java.util.Date();
       String y = String.valueOf(df.format(dd));  
       String tip=request.getParameter("country");
  
/*
           String sorgu = "insert into cihaz (cihazname,ip,serino,type,status,nerede,kayıt_tarihi,addedby,lokasyon) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement sorgulama = con.prepareStatement(sorgu);
            
            sorgulama.setString(1, request.getParameter("cihazname"));
            sorgulama.setString(2, request.getParameter("ip"));
            sorgulama.setString(3, request.getParameter("serino"));
            sorgulama.setString(4, tip);
            sorgulama.setInt(5, 0);     //monte
            sorgulama.setString(6, "");
            sorgulama.setDate(7, new java.sql.Date(df.parse(y).getTime()));
            sorgulama.setString(8, "admin");
            sorgulama.setString(9, request.getParameter("Text2").substring(4));

            sorgulama.executeUpdate();
            
            /*
             String maxQuery="select max(mid) from kayit";
           Statement maxs=con.createStatement();
           ResultSet rs4=maxs.executeQuery(maxQuery);
           rs4.next();
           
           int mid=rs4.getInt(1);
           */
        //   out.print("Arıza kayit id 'si :" +mid);
             
%>            
<script>
              //    alert("Cihaz eklenmiştir.");
             //   window.location.href="ArizaBildirim.jsp"; 
                </script>
  <%
            
   
   // con.close();
    
    }
    
    %>
</body>
</html>
