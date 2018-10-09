<%--
  Created by IntelliJ IDEA.
  User: vipul
  Date: 10/10/18
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

    <!-- SweetAlert -->
    <script src="bower_components/sweetalert/lib/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="bower_components/sweetalert/lib/sweet-alert.css">
</head>
<body>

<a href="http://google.com">Visit Google!</a>

<script>
    $('a').click(function(e) {
        e.preventDefault(); // Prevent the href from redirecting directly
        var linkURL = $(this).attr("href");
        warnBeforeRedirect();
    });

    function warnBeforeRedirect() {
        // swal({
        //     title: "Leave this site?",
        //     text: "If you click 'OK', you will be redirected to " + linkURL,
        //     type: "warning",
        //     showCancelButton: true
        // }, function() {
        //     // Redirect the user
        //     window.location.href = linkURL;
        // });
        swal("success","success","success");
    }
</script>

</body>

<script type="text/javascript"> window.onload = warnBeforeRedirect; </script>

</html>
