<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>
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
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/TableTools.js"></script>
<script type="text/javascript" src="../DataTables-1.9.4/media/js/ColumnFilterWidgets.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        
        
        $('#example').dataTable( {
         "sDom": 'CTW<"clear">lfrtip',
        "aaSorting": [],
         "oColumnFilterWidgets": {
			"aiExclude": [ 0,3,5,6,7,8,9,10,11,12,13,14,15,16 ]			
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
    
    
</script>         
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
 
       Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/musteri?user=root&password=fides");
   java.text.DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
String baslan=request.getParameter("tarih");
String bit=request.getParameter("tarih2");
int onem=Integer.parseInt(request.getParameter("onem"));

String bolge="TELEKOM";
String qry="";
if(baslan==""&&baslan!=null)
    {
    
baslan="2000-01-01";
    }
if(bit==""&&bit!=null)
    {

bit="2020-01-01";
    }

if(request.getParameter("sistem").compareTo("0")!=0)
{
    qry+="and sistem='"+request.getParameter("sistem")+"'";
}
if(request.getParameter("onem").compareTo("0")!=0)
{
    
    
    qry+="and onem='"+request.getParameter("onem")+"'";
}

if(request.getParameter("kaynak").compareTo("0")!=0)
{
    qry+="and kaynak='"+request.getParameter("kaynak")+"'";
}
    String user2=session.getAttribute("userid").toString();

if(user2.compareTo("admin")==0||user2.compareTo("120293")==0||user2.compareTo("137559")==0||user2.compareTo("193174")==0||user2.compareTo("194222")==0||user2.compareTo("193139")==0||user2.compareTo("196871")==0)
       {
           //nothing.same query
       
       }
else if(user2.compareTo("palmet")==0||user2.compareTo("nitel")==0||user2.compareTo("mavili")==0||user2.compareTo("kent")==0||user2.compareTo("eec")==0||user2.compareTo("kent")==0||user2.compareTo("drager")==0)
       {
       
           qry+="and sirket='"+user2+"'";
       }
else
{
    
      qry+="and sikayeti_alan='"+user2+"'";
  
}

if(request.getParameter("firma").compareTo("0")!=0 )
{
    String firma=request.getParameter("firma");
    
      qry+="and sirket='"+firma+"'";
}
      String sorgu="select * from kayit where bolge=? and onay=2 and kayit_tarihi>=? and kayit_tarihi<=? "+qry+"order by kayit_tarihi desc";
PreparedStatement sorgulama=con.prepareStatement(sorgu);
ResultSet sonuc;
sorgulama.setString(1,bolge);
sorgulama.setDate(2,new java.sql.Date(df.parse(baslan).getTime()));
sorgulama.setDate(3,new java.sql.Date(df.parse(bit).getTime()));
sonuc=sorgulama.executeQuery();



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
  

   <th>Bildiren Kullanıcı</th>  
   <th>Sorun</th>
   <th>Hata Kaynağı</th>
   <th>FirmaAçıklama</th>
   <th>Açılma Tarihi</th>
  <th>Kapanma Tarihi</th>
  <th>Süre</th>
 
   </tr>
   
      <thead>
      <tbody>
   <% while(sonuc.next()) { %>
    <tr>
                    <td><%=sonuc.getInt("mid")%></td>

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
             <td><%=sonuc.getString("kaynak").toUpperCase()%></td>
              <td><%=sonuc.getString("extra")%></td>
              
            <% 
            
            java.util.Date d=sonuc.getDate("kayit_tarihi");
            java.util.Date d2=sonuc.getDate("onay_tarihi");

        DateFormat df2=new SimpleDateFormat("dd-MM-yyyy");
        
             
        
            String mk=String.valueOf(df2.format(d));
            String mk2=String.valueOf(df2.format(d2));
            
            %>
            <td><%=mk%></td>
            <td><%=mk2%></td>
            <% 
            
            long day=sonuc.getDate("onay_tarihi").getTime()-sonuc.getDate("kayit_tarihi").getTime();
            long days =day/(60*24*60*1000);
            days--;
            if(days<0)
                days=0;
            %>
            <td><%=days%></td>
            

    </tr>
    <% }
    con.close();
    
    
    %>
        
      </tbody>
   </table>
            <p align="center"><a  href="rapor.jsp">Geri</a></p>

    </body>
</html>
