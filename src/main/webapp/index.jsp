<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.js"></script>
    <style>
        body{
            margin-top:100px;
            color:#6a6f8c;
            background:#c8c8c8;
            font:600 16px/18px 'Open Sans',sans-serif;
        }

        .login-wrap{
            width:100%;
            margin:auto;
            max-width:525px;
            min-height:670px;
            position:relative;
            background:url("img/loginbg3.jpeg") no-repeat center;
            box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
        }

        .login-html{
            width:100%;
            height:100%;
            position:absolute;
            padding:90px 70px 50px 70px;
            background:rgba(40,57,101,.9);
        }

        .login-form{
            min-height:345px;
            position:relative;
            perspective:1000px;
            transform-style:preserve-3d;
        }

        .login-form .group{
            margin-bottom:15px;
        }

        .login-form .group .label,
        .login-form .group .input,
        .login-form .group .button{
            width:100%;
            color:#fff;
            display:block;
        }

        .login-form .group .input,
        .login-form .group .button{
            border:none;
            padding:15px 20px;
            border-radius:25px;
            background:rgba(255,255,255,.1);
        }

        .login-form .group .label{
            color:#aaa;
            font-size:12px;
        }
        .login-form .group .button{
            background:#1161ee;
        }

        /*.login-form .group label .icon{
            width:15px;
            height:15px;
            border-radius:2px;
            position:relative;
            display:inline-block;
            background:rgba(255,255,255,.1);
        }*/

        .hr{
            height:2px;
            margin:60px 0 50px 0;
            background:rgba(255,255,255,.2);
        }
        .foot-lnk{
            text-align:center;
        }
    </style>

</head>
<body>


<div class="login-wrap">
    <div class="login-html">
        <form action="LoginServlet" method="POST">
            <div class="login-form">
                <h1 style="text-align: center">Mentor System</h1>
                <%
                    if (session.getAttribute("error")!=null) {
                        String error = (String) session.getAttribute("error");
                %>
                <div class="alert alert-dismissible alert-danger">
                    <%--<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button>--%>
                    <a href="index.jsp" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Oh snap!</strong> <a href="#" class="alert-link"><%=error%></a> Try again.
                </div>
                <%
                    }
//                    session.invalidate();
                %>
                <div class="group">
                    <label for="user" class="label" >MIS ID</label>
                    <input id="user" type="text" class="form-control input" name="login_mis_id" placeholder="Mis-id">
                </div>
                <div class="group">
                    <label for="pass" class="label">Password</label>
                    <input id="pass" type="password" class="form-control input" data-type="password" name="login_pswd" placeholder="Password">
                </div>
                <!--<div class="group">
                    <input id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                </div>-->
                <div class="group" style="padding-top: 20px">
                    <input type="submit" class="button" value="Sign In">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="/jsp/forgot_password.jsp">Forgot Password?</a>
                </div>
            </div>
        </form>
    </div>

</div>

<script>
    var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
        function alertName(){
            swal("Password updated successfully","New password is: "+Msg,"success");
        }
    }
</script>
</body>
<script type="text/javascript"> window.onload = alertName; </script>
<%--<script type="text/javascript"> window.onload = errorName; </script>--%>
</html>