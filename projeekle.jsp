<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
        <script>
    
    
    function check()
    {
    
        if(document.add.projeno.value.length==0)
        {
                alert("projeno girmen lazim");
                return false;
        }
    
        
		if(isNaN(document.add.tutar.value))
		{
		alert("tutar kismi rakam olmali");
		return false;
		
		}
    
  if(document.add.not.value.length==0)
        {
                alert("not girmen lazim");
                return false;
        }
		
		  }
    </script>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    
    
    
    <h1>Proje Ekleme</h1>
    <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("projeekle")=="projeekle")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{

    
     
        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from musteri where statu=1 order by firma_adi");
          Statement sta=con.createStatement();
        ResultSet sonuca=sta.executeQuery("select * from yapilaniss");
       java.util.Date d=new java.util.Date();

    %>
     
    <form action="iproje.jsp" method="post" onsubmit="return check()" name="add">
        <table>
           
           
          <tr>
         
          <th>FirmaAdi</th>
          
          <td>
          
          <select name="id">
               <% while(sonuc.next()) {
%>
              <option value="<%=sonuc.getString(2)%>"><%=sonuc.getString(2)%></option>     
              
         <%  }  %>
          </select>
           
          </td>
           
           </tr>
           <tr>
           <th>Proje No</th>
           <td><input type="text" name="projeno"></td>         
           </tr>
           <tr>
           <th>Yapilan Isin cinsi</th>
           
          <td><select name="is" multiple>
            <% while(sonuca.next()){ %>
          <option value="<%=sonuca.getString(1) %>"><%=sonuca.getString(1)%></option>  
                <% } %>
          </select>
          </td>
          <td>(Ctrl tusu ile birden fazla is secilebilir)</td>
           </tr>
           <tr>
           <th>Teslim Tarihi</th>
         
 <td>Ay:   <select name="ay">

            <% for(int i=1;i<=12;i++)
           {    
                if(i==d.getMonth()+1) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
 </td>
                    
           <td> Gun:  <select name="gun">
            
            <% for(int i=1;i<=31;i++)
           {    
                if(i==d.getDate()) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
         
 </td>
           <td> Yil:  <select name="yil">
            <% for(int i=2000;i<=2010;i++)
           {    
                if(i==d.getYear()+1900) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
           
 </td>
           </tr>
           <tr>
           <th>Tutar</th>
           <td><input type="text" name="tutar"></td>
           <td><select name="birim">
           
           <option value="YTL">Euro</option>
           <option value="YTL">YTL</option>
           <option value="USD">USD</option>
           
           
           </select>
           </td>
           </tr>
           <tr>
           <th>Not</th>
           <td><input type="text" name="not"> </td>

                 </tr>
           <tr>
           <th>Son kullanici farkli ise Firma yada Kisi ismi</th>
           <td><input type="text" name="sonkullanici"></td>
                 </tr>
            <tr>
           <th>Garanti Suresi</th>
        
           <td><select name="gs">
           <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           </select></td>
                 </tr>
                 
            
 
           <tr>
           <td align="center"><input type=submit value="Ok"></td>
           </tr>
           
         
        </table>
        
        
        
    </form>

   
          <% 
}
        %>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>