<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
           <style type="text/css" title="currentStyle">
			@import "DataTables-1.9.4/media/css/demo_page.css"; 
			@import "DataTables-1.9.4/media/css/demo_table.css";
			@import "DataTables-1.9.4/media/css/TableTools.css";
                        @import "DataTables-1.9.4/media/css/ColVis.css";
                        
		</style>
    <link rel="stylesheet" type="text/css" href="table.css"></link>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
               
   <script type="text/javascript" src="DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" language="javascript" src="DataTables-1.9.4/media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="DataTables-1.9.4/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" charset="utf-8" src="DataTables-1.9.4/media/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="DataTables-1.9.4/media/js/TableTools.js"></script>
<script type="text/javascript" src="DataTables-1.9.4/media/js/ColumnFilterWidgets.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        
        
        $('#example').dataTable( {
         "sDom": 'W<"clear">lfrtip',
         "oColumnFilterWidgets": {
			"aiExclude": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 ]			
					},
         "oColVis": {
		"buttonText": "Kolonlar Goster/Sakla",
			"bRestore": true,
			"sAlign": "left"	
		},
      
            "oTableTools": {
			"sSwfPath": "DataTables-1.9.4/media/copy_csv_xls_pdf.swf"
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
    
    
</script>       
   
    
 <%
         
   
        //servis antlasmasi olan ariza kayitlari
    Statement st=con.createStatement();
    ResultSet sonuc=st.executeQuery("select * from kayit where onay=1 and antlasma=1 order by kayit_tarihi,kayit_saati");
    
    //garanti suresi devam eden ariza kayitlari
    Statement st1=con.createStatement();
    ResultSet sonuc1=st1.executeQuery("select * from kayit where onay=1 and garanti=1 and antlasma=0 order by kayit_tarihi,kayit_saati");
    
    // garanti suresi dolmus olan ariza kayitlari
    
    Statement st2=con.createStatement();
    ResultSet sonuc2=st2.executeQuery("select * from kayit where onay=1 and sirket='fides' order by kayit_tarihi,kayit_saati");
    
    // periyodik bakim icin gelen kayitlar
    
    Statement st3=con.createStatement();
    ResultSet sonuc3=st3.executeQuery("select * from kayit where onay=3 and sirket='fides'");
    
 
        %>
        
  
     
     <h2>Onay Bekleyen Ariza Kayitlari</h2>
    <table id="example" border="0" cellpadding="0" cellspacing="0" class="pretty">
        <thead>
     <tr>
         <th>ARIZA ID</th>
     <th>Bolge </th>    
     <th>Musteri Adi </th>
     <th>Proje Ismi</th>
     <th>Onay ver</th>
     <th>Belirtilen Sorunu </th>
     <th>Aktif Arizalara Geri gonder</th>
     </tr>
        </thead>
     <% while(sonuc2.next()) { %>
     
     <tr>
         <td><%=sonuc2.getInt("mid")%></td>
      <td><%=sonuc2.getString("bolge")%></td>    
     <td><%=sonuc2.getString(2)%></td>
     <td><%=sonuc2.getString(3)%></td>
     <td><a href="onayservis.jsp?id=<%=sonuc2.getInt(1)%>&&name=<%=sonuc2.getString(2)%>">Onay Ver</a></td>
     <td><%=sonuc2.getString("sorun")%></td>
     <td><a href="gerigonder.jsp?id=<%=sonuc2.getInt(1)%>">Geri gonder</a></td>
     <% } %>
     
     </table>
     <hr>
     <h2>TT Onayi Bekleyen Ariza Kayitlari</h2>
     <table border="1">
     
     <tr>
     <th>Lokasyon </th>
     <th>Sorun</th>
     <th>Kapatilma Tarihi</th>
     </tr>
     
     <% while(sonuc3.next()) { 

              
            
%>  
                      <tr>
     <td><%=sonuc3.getString("lokasyon")%></td>
          <td><%=sonuc3.getString("sorun")%></td>

     <td><%=sonuc3.getDate("onay_tarihi")%></td>
     <% } %>
     
     </table>
    

    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>