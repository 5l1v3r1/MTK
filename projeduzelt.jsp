<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
 <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("projeduzelt")=="projeduzelt")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{
%>
    <h1>Proje Guncelleme</h1>
    
    
    
    <%
    
    String pno=request.getParameter("id");
   
    String sorgu="select * from yapilanis where proje_no=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,pno);
    ResultSet sonuc=sorgulama.executeQuery();   
    sonuc.next();
    
    
    String yapilanis=sonuc.getString(4);
    
     int j=0;
    int s=0;
    String []is=new String[5];
    
    StringTokenizer st=new StringTokenizer(yapilanis,"-");
    
    while(st.hasMoreTokens())
    {
        is[j]=st.nextToken();
        
        j++;
        
    }
    
    String date=sonuc.getDate(5).toString();
    
    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    
    java.util.Date da=new java.util.Date(df.parse(date).getTime());
   
   
    Statement sorgulama2=con.createStatement();
    ResultSet sonuc2=sorgulama2.executeQuery("select * from yapilaniss");
    
  
    
    %>
    <form action="uproje.jsp" method="post">
        <table>
           <tr>
       
           <input type=hidden name="id" value="<%=sonuc.getInt(1)%>">
                <input type=hidden name="proje" value="<%=request.getParameter("proje")%>">
              <input type=hidden name="ad" value="<%=sonuc.getString(2)%>">
           <td>Proje No</td>
           <td><input type="text" name="projeno" value="<%=pno%>"></td>         
           </tr>
            <tr>
           <td>Yapilan Isin cinsi</td> 
           <td><select name="is" multiple>
            <% while(sonuc2.next()) { 
                for(int k=0;k<3;k++){
                    if(sonuc2.getString(1).equals(is[k]))
                    {
                        s=1;
                    }
                    
                }
                if(s==1) {%>
                    
          <option value="<%=sonuc2.getString(1)%>" selected><%=sonuc2.getString(1)%></option>  
                        <% } else {%>
                            <option value="<%=sonuc2.getString(1)%>"><%=sonuc2.getString(1)%></option>  
          <% } s=0;} %>
          
          </select>
          </td>
           <td>(Ctrl tusu ile birden fazla is secilebilir)</td>
           </tr>
           <td>Teslim Tarihi(Bastan Giriniz)</td>
         
<td>Ay:   <select name="ay">
           
            <% for(int i=1;i<=12;i++)
           {    
                if(i==da.getMonth()+1) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
          
 </td>
                    
           <td> Gun:  <select name="gun">
            
            <% for(int i=1;i<=31;i++)
           {    
                if(i==da.getDate()) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
         
 </td>
           <td> Yil:  <select name="yil">
            <% for(int i=2000;i<=2010;i++)
           {    
                if(i==da.getYear()+1900) {
            %>
          <option value=<%=i%> selected><%=i%></option>
           <% } else { %>
               <option value=<%=i%>><%=i%></option>
          <% } }%>
           </select>
 </td>
           </tr>
           <td>Tutar</td>
           <td><input type="text" name="tutar" value="<%=sonuc.getFloat(6)%>"></td>
            <td><select name="birim">
            <option value="<%=sonuc.getString(9)%>"><%=sonuc.getString(9)%></option>
           <option value="Euro">Euro</option>
           <option value="YTL">YTL</option>
           <option value="USD">USD</option>
           
           
           </select>
           </td>
           </tr>
           <tr>
           <td>Not</td>    
           <td><input type="text" name="not" value="<%=sonuc.getString(7)%>">  
                 </tr>
            <tr>
           <td>Garanti Suresi</td>    
        
           <td><select name="gs">
           <option value="<%=sonuc.getInt(8)%>"><%=sonuc.getInt(8)%></option>
           <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           </select></td>
                 </tr>
                 
             <tr>
           <td>Son kullanici farkli ise Firma yada Kisi ismi</td>
           <td><input type="text" name="sonkullanici" value="<%=sonuc.getString(10)%>"></td>
                 </tr>

           <tr>
           <td align="center"><input type=submit value="Guncelle"></td>
           </tr>
           
         
        </table>
         <% } %>
         
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>