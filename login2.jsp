<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String user=request.getParameter("user");
            String pas=request.getParameter("pas");
String kim=user;
            int f=0;
            String sorgu="select * from admin";
            Statement st=con.createStatement();
            ResultSet sonuc=st.executeQuery(sorgu);

            HttpSession onemli=request.getSession(true);

            Statement st2=con.createStatement();
            ResultSet sonuc2=st2.executeQuery("select * from kullanicilar");


            while(sonuc.next()) {
                if(sonuc.getString(1).equals(user)) {
                    if(sonuc.getString(2).compareTo(pas)==0) {

                        
                        String sorgu2="insert into logon (name,tarih,saat) values(?,?,?)";
                        PreparedStatement sorgulama=con.prepareStatement(sorgu2);
                        sorgulama.setString(1,kim);
                        sorgulama.setDate(2,new java.sql.Date(System.currentTimeMillis()));
                        sorgulama.setTime(3,new java.sql.Time(System.currentTimeMillis()));
                        sorgulama.executeUpdate();
                        
                        
                        if(user.equals("mahir"))
                            user="admin";
                         

                        if(user.equals("fatih"))
                            user="admin";

                        if(user.equals("omer"))
                            user="admin";

                        onemli.putValue("user",user);
                        onemli.putValue("pas","gecerli");

                        
                        response.sendRedirect("frame.jsp");
                        
                    }
                }
            }

            while(sonuc2.next()) {
                if(sonuc2.getString(1).equals(user)) {

                    onemli.putValue("bakma","bak");
                    if(sonuc2.getString(2).compareTo(pas)==0) {
                        if(user.equals("murat"))
                            user="admin";
                        if(user.equals("akk"))
                            user="admin";

                        onemli.putValue("user",user);
                        onemli.putValue("pas","gecerli");
                        if(sonuc2.getInt(3)==1) {
                            onemli.putValue("bilgiler","bilgiler");
                        }

                        if(sonuc2.getInt(4)==1) {
                            onemli.putValue("ekleme","ekleme");
                        }
                        if(sonuc2.getInt(5)==1) {
                            onemli.putValue("degistirme","degistirme");
                        }

                        if(sonuc2.getInt(6)==1) {
                            onemli.putValue("raporlama","raporlama");
                        }

                        if(sonuc2.getInt(7)==1) {

                            onemli.putValue("projeekle","projeekle");
                        }

                        if(sonuc2.getInt(8)==1) {

                            onemli.putValue("projeduzelt","projeduzelt");
                        }
                        if(sonuc2.getInt(9)==1) {

                            onemli.putValue("projesil","projesil");
                        }
                        if(sonuc2.getInt(10)==1) {

                            onemli.putValue("faturakes","faturakes");
                        }
                        if(sonuc2.getInt(11)==1) {

                            onemli.putValue("teklif","teklif");
                        }
                        String sorgu2="insert into logon (name,tarih,saat) values(?,?,?)";
                        PreparedStatement sorgulama=con.prepareStatement(sorgu2);
                        sorgulama.setString(1,kim);
                        sorgulama.setDate(2,new java.sql.Date(System.currentTimeMillis()));
                        sorgulama.setTime(3,new java.sql.Time(System.currentTimeMillis()));
                        sorgulama.executeUpdate();
                        response.sendRedirect("frame.jsp");
                    }
                }
            }
        %>
        <%@include file="disconnect.jsp"%>
       

     
    </body>
</html>
<%@ include file="ResourceEnd.jsp" %>