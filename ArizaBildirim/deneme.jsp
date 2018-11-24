<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
         <style type="text/css" title="currentStyle">
			@import "../DataTables-1.9.4/media/css/demo_page.css"; 
			@import "../DataTables-1.9.4/media/css/demo_table.css";
			@import "../DataTables-1.9.4/media/css/TableTools.css";
                        @import "../DataTables-1.9.4/media/css/ColVis.css";
                        
		</style>
 <script type="text/javascript" src="../DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" language="javascript" src="../DataTables-1.9.4/media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="../DataTables-1.9.4/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../DataTables-1.9.4/media/js/ColVis.js"></script>
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="../DataTables-1.9.4/media/js/TableTools.js"></script>
<script type="text/javascript" src="../DataTables-1.9.4/media/js/ColumnFilterWidgets.js"></script>
<script type="text/javascript" charset="utf-8">
<script  type="text/javascript">
 
    $(document).ready(function () {
 
 
        $("#btnExport").click(function(e) {
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#myDataTable').html()));
            e.preventDefault();
        });​
 
        $.datepicker.regional[""].dateFormat = 'dd/mm/yy';
        $.datepicker.setDefaults($.datepicker.regional['']);
 
        var tab=  $('#myDataTable').dataTable({
           
            "bProcessing": true,
            "bServerSide": true,
            "sAjaxSource": "Company/DataProvider",
            "bJQueryUI": true,
            "aoColumns": [
                         {
                             "sName": "ID" 
                         },
                         { "sName": "COMPANY_NAME" },
                         { "sName": "ADDRESS" },
                         { "sName": "TOWN" }
            ]
 
        });
       
 
        tab.makeEditable({
            "aoColumns": [
                null,
                null,
                null,
                {
                indicator: 'Saving...',
                tooltip: 'Click to select town',
                loadtext: 'loading...',
                type: 'select',
                onblur: 'submit',
                loadurl: 'AjaxDataProvider1'
            
            }]
        });
 
    });
 
        </script>
 

 
<table id="myDataTable" class="display">
                    <thead>
 
                         <tr>
                            <th>ID</th>
                            <th>Company name</th>
                            <th>Address</th>
                           <th>Town</th>
                        </tr>
    
                    </thead>
                        
                    <tbody> 
                   </tbody>
 
                </table>
 
    <input type="button" id="btnExport" value="Export to Excel" />