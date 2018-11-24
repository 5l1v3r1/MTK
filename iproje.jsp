<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            request.setCharacterEncoding("UTF-8");
            String values[]=request.getParameterValues("is");
            String gun=request.getParameter("gun");
            String ay=request.getParameter("ay");
            String yil=request.getParameter("yil");
            String date=yil+"-"+gun+"-"+ay;
            java.text.DateFormat df=new SimpleDateFormat("yyyy-dd-MM");
            String birim=request.getParameter("birim");
            String is="";
            String sonkullanici=request.getParameter("sonkullanici");
            for(int i=0;i<values.length;i++) {
                if(i==values.length-1) {
                    is+=values[i];
                } else{
                    is+=values[i]+"-";
                }
            }
            String name=request.getParameter("id");

            PreparedStatement sorgulama=con.prepareStatement("select musteri_id from musteri where firma_adi=?");
            sorgulama.setString(1,name);
            ResultSet sonucc=sorgulama.executeQuery();
            sonucc.next();

            String sorgu2="insert into yapilanis values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement sorgulama2=con.prepareStatement(sorgu2);

            sorgulama2.setInt(1,Integer.valueOf(sonucc.getString(1)));
            sorgulama2.setString(2,request.getParameter("id"));
            sorgulama2.setString(3,request.getParameter("projeno"));
            sorgulama2.setString(4,is);
            sorgulama2.setDate(5,new java.sql.Date(df.parse(date).getTime()));
            sorgulama2.setFloat(6,Float.valueOf(request.getParameter("tutar")));
            sorgulama2.setString(7,request.getParameter("not"));
            sorgulama2.setInt(8,Integer.valueOf(request.getParameter("gs")))  ;
            sorgulama2.setString(9,birim);
            sorgulama2.setString(10,sonkullanici);
            sorgulama2.executeUpdate();

        %>
        <p><a href=form.jsp>Eklenmistir</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>