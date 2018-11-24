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
            String name = request.getParameter("firma");
            String pno = request.getParameter("pno");

            String eleman = request.getParameter("eleman");
            String tarih = request.getParameter("tarih");
            if (tarih == "") {
                //tarih="1990-01-01 00:00:00";
            }
            Timestamp tstamp = new Timestamp(00 - 00 - 00);


            String iscinsi = "";
            DateFormat df = new SimpleDateFormat("yyyy/dd/MM hh:mm:ss");
            String sikayetci = request.getParameter("sikayetci");
            String bolge = request.getParameter("bolge");
            String santral = request.getParameter("santral");

            String tel = request.getParameter("tel");
            String sorun = request.getParameter("sorun");
            HttpSession onemli = request.getSession();
            String ilgili = (String) onemli.getValue("user");
            int onay = 0;
            int g = 0;
            int antlasma = 0;
            java.util.Date dd = new java.util.Date();
            String y = String.valueOf(df.format(dd));
            String z = y.substring(10);
            StringTokenizer st = new StringTokenizer(z, ":");






            if (!pno.equals("ProjesizAriza")) {


                String son = "select *from yapilanis where proje_no=?";
                PreparedStatement pst = con.prepareStatement(son);
                pst.setString(1, pno);
                ResultSet sonuc4 = pst.executeQuery();
                sonuc4.next();
                iscinsi = sonuc4.getString(4);
                int gs = sonuc4.getInt(8);

                DateFormat dfa = new SimpleDateFormat("yyyy-MM-dd");
                GregorianCalendar gc = new GregorianCalendar(sonuc4.getDate(5).getYear() + 1900 + gs, sonuc4.getDate(5).getMonth(), sonuc4.getDate(5).getDate());
                java.util.Date mn = gc.getTime();

                if (dfa.format(dd).compareTo(dfa.format(mn)) > 0) {
                    g = 0;
                } else {
                    g = 1;
                }
                String asorgu = "select count(*) from kayit where projeno=? and onay=0";
                PreparedStatement ps = con.prepareStatement(asorgu);
                ps.setString(1, pno);
                ResultSet sonuc = ps.executeQuery();
                sonuc.next();

                if (Integer.parseInt(sonuc.getString(1)) == 0) {
                    PreparedStatement mahir = con.prepareStatement("select count(projeno),projeno,bitis from servisantlasmasi where projeno=? group by projeno");
                    mahir.setString(1, pno);
                    ResultSet nb = mahir.executeQuery();
                    nb.next();
                    try {
                        if (Integer.parseInt(nb.getString(1)) > 0) {
                            if (nb.getDate(3).after(dd) || nb.getDate(3).equals(dd)) {
                                antlasma = 1;
                            } else {
                                antlasma = 0;
                            }
                        }
                    } catch (Exception e) {
                    }
                }
            }

            String sorgu = "insert into kayit (firma_adi,projeno,kayit_tarihi,kayit_saati,sikayetci,tel,sorun,sikayeti_alan,onay,antlasma,garanti,iscinsi,eleman,randevu,bolge) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement sorgulama = con.prepareStatement(sorgu);
            sorgulama.setString(1, name);
            sorgulama.setString(2, pno);
            sorgulama.setDate(3, new java.sql.Date(df.parse(y).getTime()));
            sorgulama.setTime(4, new java.sql.Time(System.currentTimeMillis()));
            sorgulama.setString(5, sikayetci);
            sorgulama.setString(6, tel);
            sorgulama.setString(7, sorun);
            sorgulama.setString(8, ilgili);
            sorgulama.setInt(9, onay);
            sorgulama.setInt(10, antlasma);
            sorgulama.setInt(11, g);
            sorgulama.setString(12, iscinsi);
            sorgulama.setString(13, eleman);
            if (tarih != "") {
                sorgulama.setTimestamp(14, tstamp.valueOf(tarih));
            } else {
                sorgulama.setTimestamp(14, null);
            }
            sorgulama.setString(15, bolge);
          
            sorgulama.executeUpdate();


        %>
        <p><a href="form.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>