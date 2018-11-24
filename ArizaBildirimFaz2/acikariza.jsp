<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
    
    HttpSession onemli=request.getSession(true);
            onemli.removeValue("upload");
%>
        <%@include file="header.html"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" type="text/css" href="../table.css">
    </head>
    <body>        <%@include file="topborder.jsp"%>

         <style type="text/css" title="currentStyle">
			@import "../DataTables-1.9.4/media/css/demo_page.css"; 
			@import "../DataTables-1.9.4/media/css/demo_table.css";
			@import "../DataTables-1.9.4/media/css/TableTools.css";
                        @import "../DataTables-1.9.4/media/css/ColVis.css";
                        
		</style>
 <script type="text/javascript" src="../DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" language="javascript" src="../DataTables-1.9.4/media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="../DataTables-1.9.4/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/TableTools.js"></script>
<script type="text/javascript" src="../DataTables-1.9.4/media/js/ColumnFilterWidgets.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        
        
        $('#example').dataTable( {
         "sDom": 'CTW<"clear">lfrtip',
 "aaSorting": [],
         "oColumnFilterWidgets": {
			"aiExclude": [ 0,4,7,8,9,10,11,12,13,14,15 ]			
					},
         "oColVis": {
		"buttonText": "Kolonlar Goster/Sakla",
			"bRestore": true,
			"sAlign": "left"	
		},
      
            "oTableTools": {
			"sSwfPath": "../DataTables-1.9.4/media/copy_csv_xls_pdf.swf"
                   
		},
            "sPaginationType": "full_numbers",
            "iDisplayLength": 15,
            "oLanguage": {
                "bProcessing": true,
    "sProcessing":   "Isleniyor...",
    "sLengthMenu":   "Sayfada _MENU_ Kayit Goster",
    "sZeroRecords":  "Eslesen Kayit Bulunmadi",
    "sInfo":         "  _TOTAL_ Kayittan _START_ - _END_ Arasi Kayitlar",
    "sInfoEmpty":    "Kayit Yok",
    "sInfoFiltered": "( _MAX_ Kayit Icerisinden Bulunan)",
    "sInfoPostFix":  "",
    "sSearch":       "Bul:",
    "sUrl":          "",
    "oPaginate": {
        "sFirst":    "Ilk",
        "sPrevious": "Onceki",
        "sNext":     "Sonraki",
        "sLast":     "Son"
    }
}
            
        } );
        
     
    } );
    
    
function confirmDel() {
 var agree=confirm("Bu içeriği silmek istediğinizden emin misiniz?\nBu işlem geri alınamaz!");
 if (agree) {
  return true ; }
 else {
  return false ;}
}
    
</script>         
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
    
    
     Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 
    String user2=session.getAttribute("userid").toString();
    String sorgu="";
    PreparedStatement sorgulama=null;
    ResultSet sonuc;
    String bolge="TELEKOM";
       if(user2.compareTo("admin")==0||user2.compareTo("120293")==0||user2.compareTo("012445")==0||user2.compareTo("137559")==0||user2.compareTo("193174")==0||user2.compareTo("194222")==0||user2.compareTo("193139")==0||user2.compareTo("196871")==0)
       {
      sorgu="select * from kayit where (onay=0 or onay=1 or onay=5) and bolge=? order by kayit_tarihi desc";
       sorgulama=con.prepareStatement(sorgu);

sorgulama.setString(1,bolge);

sonuc=sorgulama.executeQuery();
           
       }
       
       else if(user2.compareTo("palmet")==0||user2.compareTo("nitel")==0||user2.compareTo("mavili")==0||user2.compareTo("kent")==0||user2.compareTo("eec")==0||user2.compareTo("kent")==0||user2.compareTo("drager")==0)
       {
       
            sorgu="select * from kayit where (onay=0 or onay=1 or onay=5) and bolge=? and sirket=? order by kayit_tarihi desc";

 sorgulama=con.prepareStatement(sorgu);


sorgulama.setString(1,bolge);
sorgulama.setString(2,user2);

sonuc=sorgulama.executeQuery();
       }
       
       else{
 sorgu="select * from kayit where (onay=0 or onay=1 or onay=5) and bolge=? and sikayeti_alan=? order by kayit_tarihi desc";

 sorgulama=con.prepareStatement(sorgu);


sorgulama.setString(1,bolge);
sorgulama.setString(2,user2);

sonuc=sorgulama.executeQuery();
       }
%>

  <table id="example" border="0" cellpadding="0" cellspacing="0" class="pretty">
       
      <thead>
   <tr>
       <th>ID</th>
       <th>Firma</th>
       <th>Sistem İsmi</th>
   <th>Arıza Tipi</th>
   <th>Önem Düzeyi </th>
   
   <th>Lokasyon</th>
  

   <th>Arızayı Bildiren Kullanıcı</th>  
   <th>Sorun</th>
   <th>Ekli Dosya</th>
   <th>Açılma Tarihi</th>
   <th>Durum</th>
   <th>Firma Notu</th>
   <%
        if(user2.compareTo("palmet")!=0||user2.compareTo("nitel")!=0||user2.compareTo("mavili")!=0||user2.compareTo("kent")!=0||user2.compareTo("eec")!=0||user2.compareTo("kent")!=0||user2.compareTo("drager")!=0)
       {
          %>
   <th>Sil</th>
   
          <% 
       }
            %>
            
               <%
        if(user2.compareTo("palmet")==0||user2.compareTo("nitel")==0||user2.compareTo("mavili")==0||user2.compareTo("kent")==0||user2.compareTo("eec")==0||user2.compareTo("kent")==0||user2.compareTo("drager")==0)
       {
          %>
   <th>İşlem Yap</th>
   
          <% 
       }
            %>
            
   </tr>
   
      <thead>
      <tbody>
   <% while(sonuc.next()) { 
   
   
   %>
    <tr>
                <td><%=sonuc.getInt("mid") %>  </td>
        <td><%=sonuc.getString("sirket").toUpperCase() %>  </td>
            <td><%=sonuc.getString("sistem").toUpperCase()%></td> 
            <td><%=sonuc.getString("arizatipi")%></td>
            
            <% if(sonuc.getString("onem").compareTo("acil")==0){
                %>
                            <td>TT Arıza</td>

                <%
            }
            else
            {
                %>  
                    <td><%=sonuc.getString("onem").toUpperCase()%></td>

                <%
            }
            
            %>
            <%
            
            String lokasyon=sonuc.getString("lokasyon");
            int index=0;
            for(int i=0;i<lokasyon.length();i++)
            {
                if(lokasyon.charAt(i)=='B')
                {
                    index=i;
                     break;

                }
            }
            %>
            
            <td><%=sonuc.getString("lokasyon").substring(index)%></td>
            <td><%=sonuc.getString("sikayeti_alan")%></td>
            
            <%
            
            String sorun=sonuc.getString("sorun");
            String soruns[]=sorun.split("\t");
            sorun="";
            for(int i=0;i<soruns.length;i++)
             sorun=sorun+" "+soruns[i].trim();
            %>
            <td><%=sorun%></td>
            <%
            if(sonuc.getString("filename").compareTo("")==0)
            {
            %>
            <td></td>
            <% } else{
                %>
                            <td><a href="uploads/<%=sonuc.getString("filename")%>">Bak</a></td>
<%
            }
            %>
            
            <% 
            
            java.util.Date d=sonuc.getDate("kayit_tarihi");
        DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
        
             
        
            String mk=String.valueOf(df.format(d));
%>
 <td><%=mk%></td>
 <%
            //Durum gelecek
            String durum="";
             if(sonuc.getInt("onay")==5)
            {
                durum="Parça Bekleniyor";
                %><td><%=durum%> <%
            }
            if(sonuc.getInt("onay")==0)
            {
                durum="Açık";
                %><td><%=durum%> <%
            }
            
            if(sonuc.getInt("onay")==1)
            {
                durum="İşlemde";
                %><td><%=durum%> <%
            }
             
            
            %>
            
            
                           <td><%=sonuc.getString("extra2")%></td>

            
            <%
            
            
                    String user=session.getAttribute("userid").toString();
                 
                 
        if(user2.compareTo("palmet")!=0||user2.compareTo("nitel")!=0||user2.compareTo("mavili")!=0||user2.compareTo("kent")!=0||user2.compareTo("eec")!=0||user2.compareTo("kent")!=0||user2.compareTo("drager")!=0)
       {
          %>
              <td><a  href="silariza.jsp?id=<%=sonuc.getInt(1)%>" onclick="return confirmDel();">Sil</a></td>
   
          <% 
       }
        if(user2.compareTo("palmet")==0||user2.compareTo("nitel")==0||user2.compareTo("mavili")==0||user2.compareTo("kent")==0||user2.compareTo("eec")==0||user2.compareTo("kent")==0||user2.compareTo("drager")==0)
       {
          %>
              <td><a  href="onayservis.jsp?id=<%=sonuc.getInt(1)%>">İşlem</a></td>
   
          <% 
       }
            %>
            
            
            
    </tr>
    <% }
    con.close();
    
    
    %>
        
      </tbody>
   </table>
            <p align="center"><a  href="ArizaBildirim.jsp">Geri</a></p>

    </body>
</html>
