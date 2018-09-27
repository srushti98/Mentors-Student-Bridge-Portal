<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet" type="text/css"/>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
            src: local('Material Icons'),
            local('MaterialIcons-Regular'),
            url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
            url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
            url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
        }

        .material-icons {
            font-family: 'Material Icons';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;  /* Preferred icon size */
            /*display: inline-block;*/

            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr;

            /* Support for all WebKit browsers. */
            -webkit-font-smoothing: antialiased;
            /* Support for Safari and Chrome. */
            text-rendering: optimizeLegibility;

            /* Support for Firefox. */
            -moz-osx-font-smoothing: grayscale;

            /* Support for IE. */
            font-feature-settings: 'liga';
        }


        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }

    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%
        //HttpSession session= request.getSession();

        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String sname = (String)session.getAttribute("stud_name");
        System.out.println(sname);
    %>
    <a class="navbar-brand" href="#">WELCOME <%=sname%></a>


    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <%System.out.println(sname);%>
                <a class="nav-link" href="/jsp/admin_index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_studentslist.jsp">View all Students</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_mentorlist.jsp">View all Mentors</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_allotmentlist.jsp">View Allotments</a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet"><i class="material-icons">
            account_circle
        </i> signout</a>
    </div>

</nav>
<div class="c1">
    <div class="content" style="min-height: 600px;margin-top: 50px">
        <div class="baner_image">
            <div class="inner_baner_image" style="margin-left: 600px">
                <div class="baner_content">
                    <%System.out.println(sname);%>
                    <h1>Welcome to Admin Portal</h1>
                    <p>View and Allot</p>

                </div>

            </div>

        </div>


    </div>

</div>

</body>
</html>


<%--<%--%>
    <%--session.setMaxInactiveInterval(2);--%>
    <%--session.setAttribute("stud_name","ADMIN");--%>
<%--%>--%>

<script type="text/javascript">
    var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
        function alertName(){
            alert("Mentor has been alloted");
        }
    }
</script>





</body>
<script type="text/javascript"> window.onload = alertName; </script>

</html>

