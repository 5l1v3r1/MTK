

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
            body {
            }
        </style>
        <link rel="stylesheet" type="text/css" href="tautocomplete.css" />
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="tautocomplete.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                var text2 = $("#Text2").tautocomplete({
                    width: "700px",
                    columns: ['name'],
                    ajax: {
                        url: "kapo.json",
                        type: "GET",
                        data: function () {
                            return [{ test: text2.searchdata() }];
                        },
                        success: function (data) {
                            
                            var filterData = [];

                            var searchData = eval("/" + text2.searchdata() + "/gi");

                            $.each(data, function (i, v) {
                                if (v.country.search(new RegExp(searchData)) != -1) {
                                    filterData.push(v);
                                }
                            });
                            return filterData;
                        }
                    },
                    onchange: function () {
					
                        $("#ta-txt").html(text2.text());
                        $("#ta-id").html(text2.id());
                    }
                });
            });
        </script>
        
    <form  action="kapo3.jsp" method=post name="a">
        
        <table>
            <tr>
                <td>  <input size="50" name="sikayetci" type="text" placeholder="Yetkili giriniz.." ></td>
</tr>
<tr>
                <td>  <input name="Text2" size="500" type="text" id="Text2" style="width: 400px; font-size:16px;" /></td>
</tr>
           
<tr> <td> <input type="submit" value="g"></input></td></tr>
                </table>

    </form>
</head>
<body>

    
</body>
</html>
