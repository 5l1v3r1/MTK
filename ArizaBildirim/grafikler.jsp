<%@page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%@ page  import ="org.jfree.chart.plot.PiePlot"%>
<%@ page  import ="org.jfree.chart.plot.PlotOrientation"%>
<%@ page  import ="org.jfree.chart.labels.StandardPieSectionLabelGenerator"%>
<%@ page  import ="org.jfree.chart.renderer.category.BarRenderer"%>
<%@ page  import ="org.jfree.chart.plot.CategoryPlot"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	
    
    
    <%
       /* 
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 String query="select count(kayit_tarihi) as sayi ,kayit_tarihi from kayit group by kayit_tarihi limit 6";
JDBCCategoryDataset dataset=new JDBCCategoryDataset(con,query);
JFreeChart chart=ChartFactory.createLineChart("Query Chart", "kayit_tarihi", "sayi", dataset,PlotOrientation.VERTICAL,false,true,true);
      
BarRenderer renderer=null;
CategoryPlot plot=null;
    
renderer=new BarRenderer();
ChartFrame frame=new ChartFrame("Query Chart",chart);
frame.setVisible(true);
frame.setSize(700,950);    

con.close();
               
        
        
        
               */
        

        
          Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musteri","root","fides");  
 String query="select arizatipi,count(*) as sayi from kayit where bolge='TELEKOM' GROUP BY arizatipi order by sayi desc limit 5";
//String query="select kayit_tarihi , count(*) as sayi from kayit where bolge='TELEKOM' and kayit_tarihi>'2014-11-20' group by kayit_tarihi";
 Statement stmt = null;
ResultSet rs = null;

stmt = con.createStatement();
    rs = stmt.executeQuery(query);
    
     DefaultPieDataset dataset = new DefaultPieDataset();
     JFreeChart chart;
     PiePlot plot;
     OutputStream outputStream;
     
    while(rs.next())
    {
        dataset.setValue(rs.getString(1).toUpperCase(),  rs.getInt(2));
        
    }
     //Son 1 hafta sorgusu 
 //select kayit_tarihi from kayit where kayit_tarihi >= DATE_SUB(CURDATE(), INTERVAL 10 DAY) and ;
//select count(*) from kayit where onay!=2 and bolge='TELEKOM' and sistem='kamera';

		boolean legend = true;
		boolean tooltips = true;
		boolean urls = true;

		 chart = ChartFactory.createPieChart("En Fazla Bildirilen 5 ARIZA Tipi", dataset, true, true, true);

		chart.setBorderPaint(Color.GREEN);
		chart.setBorderStroke(new BasicStroke(5.0f));
		chart.setBorderVisible(true);
                
                 plot = (PiePlot) chart.getPlot();
                 plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} - {1} Adet - {2}"));
                
                response.setContentType("image/png");

		 outputStream = response.getOutputStream();
		int width = 1200;         //1600 350 
		int height = 300;
		ChartUtilities.writeChartAsPNG(outputStream, chart, width, height);
                response.setContentType("text/html");

                out.print("asda");
  //1.Grafik Bitti------------------------------------------------------------------------------------------------------------------
                 
                
                con.close();
    %>

    <b>adadsas</b>
</body>
</html>
