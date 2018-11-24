<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
   <%@include file="mail.jsp" %>

<%

 int f;
       double ucret=0.0;
       double saat=0.0;
    int id=Integer.parseInt(request.getParameter("id"));
    String sonuc=request.getParameter("sor");
    String company=request.getParameter("company");
    String eleman="";
    String values[]=request.getParameterValues("eleman");
String fatura="";
        for(int i=0;i<values.length;i++)
        {
                if(i==values.length-1)
                {
                    eleman+=values[i];
                }
                else
                {
                eleman+=values[i]+",";
                
                }
        }
    try{
     saat=Double.parseDouble(request.getParameter("saat"));
    }
        catch(Exception e)
        {
            
        }
fatura=request.getParameter("fatura");
  
  if(fatura==null)
      f=0;
  else  f=1;
    

try{
    
    ucret=Double.parseDouble(request.getParameter("ucret"));
    
}
        catch(Exception e)
        {
            
        }
  
    
   String kaynak=request.getParameter("kaynak");
   if(kaynak==null)
       kaynak="";
   
   int onay=0;
    PreparedStatement x=con.prepareStatement("select count(*) from kayit where mid=? and sikayeti_alan=? ");
             x.setInt(1,id);
            x.setString(2,company);
            ResultSet s=x.executeQuery();
            s.next();
            if(Integer.parseInt(s.getString(1))==1) {
                
                onay=10;
            }
   
   
   
   if(request.getParameter("bolge").compareTo("TELEKOM")==0)
       onay=3;
   else if (onay!=10&&onay!=3)
       onay=2;
   
    
    String sorgu="update kayit set onay_tarihi=?,sonuc=?,harcanan_sure=?,giden_eleman=?,ucret=?,fatura_kesim=?,onay_saati=?,extra=?,kaynak=?,onay=? where mid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setDate(1,new java.sql.Date(System.currentTimeMillis())); 
    sorgulama.setString(2,sonuc);
    sorgulama.setDouble(3,saat);
    sorgulama.setString(4,eleman);
    sorgulama.setDouble(5,ucret);
    sorgulama.setInt(6,f);
    sorgulama.setTime(7,new java.sql.Time(System.currentTimeMillis())); 
    sorgulama.setString(8,request.getParameter("ext"));
    sorgulama.setString(9,kaynak);
    sorgulama.setInt(10,onay);
    sorgulama.setInt(11,id);
    sorgulama.executeUpdate();
    
    
    if(onay==10)
    {
        
          PreparedStatement sorgulama2=con.prepareStatement("select email from external_user where username=?");
               sorgulama2.setString(1,company);
               ResultSet sonuc2=sorgulama2.executeQuery();
                    
               sonuc2.next();
               
               String email=sonuc2.getString("email");
               
               if(email!=null || email!="")
                    sendMail(email);
        
    }
             

    %>
     <p><a href="onayariza.jsp">Onaylanmistir</a></p>
  
 
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>