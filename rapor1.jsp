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
         "sDom": 'CTW<"clear">lfrtip',
         "oColumnFilterWidgets": {
			"aiExclude": [ 2,3,4,5,6,7,8,9,10,11,12,13,14,15 ]			
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
            "iDisplayLength": 100,
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

String fatura=request.getParameter("fatura");
String servis=request.getParameter("servis");
String garanti=request.getParameter("garanti");

int f,s,g;

    if(fatura==null)
            f=0;
    else        f=2;

    if(servis==null)
            s=0;
    else        s=1;

String qry="";

    if(garanti==null)
        {

        qry="and garanti!=2 order by onay_tarihi";
             g=0;
                }

    else      {
    
    qry="and garanti=1 order by onay_tarihi";
         g=1;
}


 java.text.DateFormat df=new SimpleDateFormat("yyyy-MM-dd");


//String bay=request.getParameter("bay");
//String bgun=request.getParameter("bgun");
//String byil=request.getParameter("byil");
//String tay=request.getParameter("tay");
//String tgun=request.getParameter("tgun");
//String tyil=request.getParameter("tyil");
//String baslangic=byil+"-"+bay+"-"+bgun;
//String bitis=tyil+"-"+tay+"-"+tgun;

String baslan=request.getParameter("tarih");
String bit=request.getParameter("tarih2");


ResultSet sonuc;
//if(bgun==null||bay==null)
//    {
//baslangic="2000-01-01";
//bitis="2020-01-01";
//    }
if(baslan=="")
    {
    
baslan="2000-01-01";
    }
if(bit=="")
    {

bit="2020-01-01";
    }

if (request.getParameter("firmaname")==null) {

    String sorgu="select * from kayit where onay=2 and sirket='fides' and firma_adi LIKE ? and projeno LIKE ? and onay_tarihi>=? and onay_tarihi<=? and sorun LIKE ? and sikayeti_alan LIKE ? and sonuc LIKE ? and giden_eleman LIKE ? and fatura_kesim=? and antlasma=? and iscinsi LIKE ? and sikayetci LIKE ?"+qry;
PreparedStatement sorgulama=con.prepareStatement(sorgu);

sorgulama.setString(1,request.getParameter("firmaadi")+'%');

sorgulama.setString(2,request.getParameter("pno")+'%');

sorgulama.setDate(3,new java.sql.Date(df.parse(baslan).getTime()));

sorgulama.setDate(4,new java.sql.Date(df.parse(bit).getTime()));

sorgulama.setString(5,request.getParameter("sorun")+'%');

sorgulama.setString(6,request.getParameter("sikayetialan")+'%');

sorgulama.setString(7,request.getParameter("sonuc")+'%');


sorgulama.setString(8,request.getParameter("gideneleman")+'%');

sorgulama.setInt(9,f);

sorgulama.setInt(10,s);

//sorgulama.setInt(11,g);

sorgulama.setString(11,request.getParameter("yapilanis")+'%');

sorgulama.setString(12,request.getParameter("sikayetci")+'%');


sonuc=sorgulama.executeQuery();


            }
else
    {
    String firma;
 String getFirmaAdi="select m.firma_adi from kayit k ,musteri m where m.firma_adi=k.firma_adi and k.mid=?";
PreparedStatement sorgulama2=con.prepareStatement(getFirmaAdi);

sorgulama2.setInt(1,Integer.parseInt(request.getParameter("firmaname")));

sonuc=sorgulama2.executeQuery();

sonuc.next();
firma=sonuc.getString(1);
out.print("Firma:"+firma);

     String sorgu="select * from kayit where onay=2 and firma_adi LIKE ? "+qry;
PreparedStatement sorgulama=con.prepareStatement(sorgu);




sorgulama.setString(1,'%'+firma+'%');

sonuc=sorgulama.executeQuery();

%><p><%=firma%></p><%
    }


%>

  <table id="example" border="0" cellpadding="0" cellspacing="0" class="pretty">
       
      <thead>
   <tr>
       <th>Bolge</th>
   <th>Firma Adi</th>
   <th>Proje No</th>
   
   <th>Kayit Tarihi</th>
  
   <th>Onay Tarihi</th>

   <th>Sikayetci</th>  
   <th>Tel</th>
   <th>Sorun</th>
      <th>Sonuc</th>
       <th>Aciklama</th>
   <th>Sikayeti Alan</th>

   <th>Harcanan Sure</th>
   <th>Giden Eleman</th>
   <th>Ucret</th>
   <th>Fatura Kesim</th>
  
   <th>Garanti Kapsami</th>
  
   </tr>
   
      <thead>
      <tbody>
   <% while(sonuc.next()) { %>
   
        <tr>
            <td><%=sonuc.getString("bolge")%></td>   
        <td><%=sonuc.getString(2)%></td>
        <td><%=sonuc.getString(3)%></td>
       
        <td><%=sonuc.getDate(4)%>/<%=sonuc.getTime(5)%></td>
        
        <td><%=sonuc.getDate(11)%>/<%=sonuc.getTime(19)%></td>
        
        <td><%=sonuc.getString(6)%></td>
        <td><%=sonuc.getString(7)%></td>
        <td><%=sonuc.getString(8)%></td>
         <td><%=sonuc.getString(12)%></td>
          <td><%=sonuc.getString(20)%></td>
        <td><%=sonuc.getString(9)%></td>
       
        <td><%=sonuc.getDouble(13)%></td>
        <td><%=sonuc.getString(14)%></td>
        <td><%=sonuc.getFloat(15)%></td>
         <% if(Integer.parseInt(sonuc.getString(16))==1) {%>
       <td>Kesilmek icin Bekleniyor</td> <% } else if(Integer.parseInt(sonuc.getString(16))==2){   %>
             <td>Kesilmis</td> <% }
             
             else { %>

       <td>Kesilmemis</td><% }%>
         
       <% if(Integer.parseInt(sonuc.getString(18))==1) {%>
       <td>Devam Ediyor</td> <% } else { %>
       <td>Bitmis</td><% }%>
       
        </tr>
        <% } %>
        
      </tbody>
   </table>
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

</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>