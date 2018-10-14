<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: srushti
  Date: 2/10/18
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/linenav.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>

    <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
    <meta charset="utf-8">

</head>

<body>




<div id='cssmenu'>
    <ul>
        <li class='active'><a href='#'><span>Home</span></a></li>
        <li><a href='#'><span>Products</span></a></li>
        <li><a href='#'><span>Company</span></a></li>
        <li class='last'><a href='#'><span>Contact</span></a></li>
    </ul>
</div>
<h1>upload your signed undertaking</h1>
<form method="post" action="../FileUploadExcelFinalServlet" enctype="multipart/form-data" style="margin-top: 500px">
    <%--<input type="file" name="File" multiple="multiple" onchange="readURL(this);">--%>
    <input type="file" name="File" id="file">
    <a href="#" target="_blank" class="preview">View</a>
    <button type="submit">
        upload
    </button>

</form>

</body>
<html>







</body>
<script>
    var $preview = $(".preview");
    $preview.hide();

    $("input").on("change", function(){

        var files = this.files;
        var fileReader = new FileReader();

        fileReader.onload = function(e){
            $preview.attr("href", e.target.result);
            $preview.show();
        };

        fileReader.readAsDataURL(files[0]);
    });
</script>
</html>
