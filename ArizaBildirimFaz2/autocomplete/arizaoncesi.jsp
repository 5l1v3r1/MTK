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
                
                if(document.a.location.value==1)
            {
                alert("oldu");
            return false;
                }    
                
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
            out.print("Lütfen eksiksiz doldurun");
        }
      else  if(Integer.parseInt(gelen)==6)
        {
        out.print("Programı çalıştırdıktan sonra arıza kaydı oluşturmak için baştan başlayınız.");
        
        }
       else    if(Integer.parseInt(gelen)==7)
        {
        out.print("Ağdaki cihazlara ping atabildiğinizi kontrol ettikten sonra arıza kaydı oluşturmak için baştan başlayınız.");
        
        }
        
         else    if(Integer.parseInt(gelen)==8)
        {
        out.print("Monitör ve Decoder'deki elektrik kontrolünü yaptıktan sonra arıza kaydı oluşturmak için baştan başlayınız.");
        
       
        }
        
          else    if(Integer.parseInt(gelen)==9)
        {
        out.print("Kabloları kontrol ettikten sonra arıza kaydı oluşturmak için baştan başlayınız.");
        
        }
            else    if(Integer.parseInt(gelen)==10)
        {
        out.print("Ağ cihazının elektrik ve ağ bağlantılarını kontrol ettikten sonra arıza kaydı oluşturmak için baştan başlayınız.");
        
        }
        else
            {
                
                     response.sendRedirect("fideskamera.jsp");

            }
    }
        %>
<body>
    <form name="a" action="arizaoncesi.jsp" method="post" onsubmit="return check()">
                <h2>Arıza Öncesi Soru Cevaplama</h2>

    <select id="pre" name="location" class="dependent">
        
  <option></option>
  <option value="0">Genel İzleme Problemi > Sadece Kayıtlar İzlenemiyor </option>
  <option value="1">Genel İzleme Problemi > Canlı İzleme Yapılamıyor > Büyük Ekranda İzleme Yapılamıyor > Monitör ve Decoder Çalışıyor</option>
    <option value="8">Genel İzleme Problemi > Canlı İzleme Yapılamıyor > Büyük Ekranda İzleme Yapılamıyor > Monitör ve Decoder Çalışmıyor</option>
 
  <option value="6">Genel İzleme Problemi > Canlı İzleme Yapılamıyor > İzleme Bilgisayarında Kameralar izlenmiyor > Bilgisayarda Program Çalışmıyor</option>
  <option value="2">Genel İzleme Problemi > Canlı İzleme Yapılamıyor > İzleme Bilgisayarında Kameralar izlenmiyor > Bilgisayarda Program Çalışıyor > Ağdaki Diğer cihazlara bağlantı var</option>
   <option value="7">Genel İzleme Problemi > Canlı İzleme Yapılamıyor > İzleme Bilgisayarında Kameralar izlenmiyor > Bilgisayarda Program Çalışıyor > Ağdaki Diğer cihazlara bağlantı yok</option>

  <option value="3">Kameraların bazıları izlenemiyor > Bir Kamera İzlenmiyor > Kameraya Ping Atılıyor </option>
  <option value="4">Kameraların bazıları izlenemiyor > Bir Kamera İzlenmiyor > Kameraya Ping Atılmıyor > Kameranın Işıkları Yanıyor </option>
    <option value="9">Kameraların bazıları izlenemiyor > Bir Kamera İzlenmiyor > Kameraya Ping Atılmıyor > Kameranın Işıkları Yanmıyor </option>
  <option value="5">Kameraların bazıları izlenemiyor > Bir Grup Kamera İzlenmiyor > Kameranın bağlı olduğu ağ cihazındaki diğer kameralar izleniyor </option>
  <option value="10">Kameraların bazıları izlenemiyor > Bir Grup Kamera İzlenmiyor > Kameranın bağlı olduğu ağ cihazındaki diğer kameralarda izlenemiyor </option>

</select>

        <input name="btn_submit" type="submit" ></input>
    </form>
</body>

    

</html>