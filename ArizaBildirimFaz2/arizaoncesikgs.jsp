<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>
<head>

    <script src="jquery.js"></script>
<script src="jquery.dependent-selects.js"></script>
    <script>
$(function(){
$('.dependent').dependentSelects();
})</script>

<script>
     function check()
            {
                
              
                
    }
</script>
</head>
<html>
    <%
  if(request.getParameter("btn_submit")!=null)
    {
        
        String gelen=request.getParameter("pre");
        if(gelen==null||gelen=="")
            
        {
            gelen="0";
            out.print("<b>Lütfen eksiksiz doldurun</b>");
        }
      else  if(Integer.parseInt(gelen)==2)
        {
        out.print("<b>Panel Enerjisi aktif edilip, daha sonra arıza kaydı oluşturmaya baştan başlayınız.</b>");
        
        }
       else    if(Integer.parseInt(gelen)==5)
        {
        out.print("<b>Ethernet Işığının yanması sağlanıp daha sonra arıza kaydı oluşturmak için baştan başlayınız.</b>");
        
        }
        
         else    if(Integer.parseInt(gelen)==3)
        {
        out.print("<b>Switch,port veya ayar değişimi yapılmışsa ,gereken ayarlar yapılarak daha sonra arıza kaydı oluşturmak için baştan başlayınız.</b>");
        
       
        }
        
          else    if(Integer.parseInt(gelen)==6)
        {
        out.print("<b>Eğer panel offline durumda ise öncelikle A seçeneği izlenerek panelin online olması sağlanacak.</b>");
        
        }
            else    if(Integer.parseInt(gelen)==8)
        {
        out.print("<b>Access Denied logu düşüyorsa TT sistem yöneticilerine başvurularak kapı ve kullanıcı için yetki ayarları yaptırılacak.</b>");
        
        }
        else
            {
                
                    response.sendRedirect("fideskgs.jsp?pre="+gelen);

            }
    }
        %>
<body>
    <form name="a" action="arizaoncesikgs.jsp" method="post" onsubmit="return check()">
                <h2 align="center">Arıza Giriş Öncesi Sorun Filtreleme</h2>
                <div align="center">
    <select  id="pre" name="pre" class="dependent">
        
  <option></option>
  <option value="1">Panel Offline > Panele Ping Atılabiliyor </option>
  <option value="2">Panel Offline > Panele Ping Atılamıyor > Panel Enerjisi Yok </option>
   <option value="3">Panel Offline > Panele Ping Atılamıyor > Panel Enerjisi Var > Ethernet Kablosu Işığı Yanıyor > Switch Port Ayarlarında Değişiklik Yapıldı</option>
   <option value="4">Panel Offline > Panele Ping Atılamıyor > Panel Enerjisi Var > Ethernet Kablosu Işığı Yanıyor > Switch Port Ayarlarında Değişiklik Yapılmadı</option>
   <option value="5">Panel Offline > Panele Ping Atılamıyor > Panel Enerjisi Var > Ethernet Kablosu Işığı Yanmıyor </option>
    <option value="6">Geçiş Arızası > Panel Offline </option>
    <option value="7">Geçiş Arızası > Panel Online > Kart Okutulduğunda Sisteme Log Düşmüyor </option>
    <option value="8">Geçiş Arızası > Panel Online > Kart Okutulduğunda Sisteme Log Düşüyor > Access Denied Logu Düşüyor </option>
    <option value="9">Geçiş Arızası > Panel Online > Kart Okutulduğunda Sisteme Log Düşüyor > Access Granted Logu Düşüyor </option>
    <option value="10">Fiziksel Arıza </option>

   

</select>
                    <div>
                        <br>
                        
        <input name="btn_submit" type="submit" ></input>
    </form>
                        <p align="center"><a href="ArizaBildirim.jsp">Geri</a></p>

</body>

    

</html>