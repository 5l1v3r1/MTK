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
                  <link rel="stylesheet" type="text/css" href="table.css">
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
			"aiExclude": [0,2,3,4,5,7,8,9,10,11,12,13,14,15 ]			
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
    <h1 align="center">Aktif Ariza Kayitlari</h1>

    <%




    String sorgu="select * from kayit where onay=0 and sirket='fides' order by kayit_tarihi,kayit_saati";
    Statement sorgulama=con.createStatement();
    ResultSet sonuc=sorgulama.executeQuery(sorgu);
    String sorguu="select a.mid,a.projeno,a.firma_adi,b.bitis,a.kayit_tarihi,a.kayit_saati from kayit a,servisantlasmasi b where a.projeno=b.projeno and a.onay=0 order by kayit_tarihi,kayit_saati";
    Statement state=con.createStatement();
    ResultSet result=state.executeQuery(sorguu);
    int garanti=0;
    int i=1;
   int s=0;
java.util.Date d=new java.util.Date();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    int f=1;
    String mk=String.valueOf(df.format(d));

    %>
   
     <table id="example" border="0" cellpadding="0" cellspacing="0" class="pretty">
         <thead>
    <tr>
    <th>ARIZA ID</th>
     <th>Bolge</th>
    <th><b />Proje Numarasi</th>
    <th><b />Sirket Ismi </th>
    <th><b />Kayit Tarihi  ve Saati</th>
    <th><b />Sorun</th>
   
    <th>Sikayeti Alan</th>
     <th><b />Onay</th></b>
    <th><b />Sil</b></th>
    </tr>
    </thead>
            <% while(sonuc.next()){
         //  servis antlasmasi olmayan(a=0)sirketlerin degeri 1 ise yazdir
        String x="select count(projeno) from kayit where projeno=? and onay=0 and antlasma=1 ";
                PreparedStatement xx=con.prepareStatement(x);
                xx.setString(1,sonuc.getString(3));
                ResultSet xxx=xx.executeQuery();
                
                xxx.next();
        String gg="select garanti from kayit where projeno=?";
        PreparedStatement garan=con.prepareStatement(gg);
       garan.setString(1,sonuc.getString(3));
        ResultSet garant=garan.executeQuery();
        garant.next();
                if(garant.getInt(1)==0)
                    garanti=0;
                else        garanti=1;

            String as="select count(*) from kayit where projeno=? and onay=0 and antlasma=0";
             PreparedStatement pes=con.prepareStatement(as);
             pes.setString(1,sonuc.getString(3));
             ResultSet jhk=pes.executeQuery();
             jhk.next();
            // if(Integer.parseInt(xxx.getString(1))==0){
           //  if(Integer.parseInt(jhk.getString(1))!=1){
%>
            <tr>
     <td ><%=sonuc.getInt("mid")%></td>
     <td><%=sonuc.getString("bolge")%></td>

<!--     <td><%=sonuc.getString(3)%></td>-->
     <td><a href="detayaktifariza.jsp?id=<%=sonuc.getInt(1)%>&&garan=<%=garanti%>"><%=sonuc.getString(3)%></a></td>
     <td><a href="rapor1.jsp?firmaname=<%=sonuc.getInt(1)%>" TARGET="_blank"><%=sonuc.getString(2)%></a></td>
   <td><%=sonuc.getDate(4)%>-<%=sonuc.getTime(5)%></td>
   <td><%=sonuc.getString(8)%></td>

   
   <td><%= sonuc.getString("sikayeti_alan") %></td>
     <td><a href="detayaktifariza1.jsp?id=<%=sonuc.getInt(1)%>&&garan=<%=garanti%>">Onaya Gonder</a></td>
       <td><a href="silariza.jsp?id=<%=sonuc.getInt(1)%>">Sil</a></td>
            </tr>
            <% i++; } %>
    </table>


   
  <h3>Parca Bekleyen Firmalar  </h3>
    <%
          
            ResultSet parcasonuc=sorgulama.executeQuery("select * from kayit where onay=5");

       %>
       <table id="example" border="0" cellpadding="0" cellspacing="0" class="pretty">
           
      <thead>
    <tr>
  
     <th>Bolge</th>
   
    <th><b />Sirket Ismi </th>
    <th><b />Parca Durumu</th>
   
    <th><b /></b></th>
    </tr>
    </thead>      
           <% while(parcasonuc.next()) { %>
           <tr>
                 <td><%=parcasonuc.getString("bolge")%></td>
               <td><%=parcasonuc.getString("firma_adi")%></td>
               <td><%=parcasonuc.getString("parca") %> </td>
               <td><a href="parcageldi.jsp?id=<%=parcasonuc.getInt("mid")%>">Parca geldiyse tikla</a></td>
           
           
           </tr>


           <% } %>
       </table>
     
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>