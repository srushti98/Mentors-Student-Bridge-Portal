<!DOCTYPE html>
<html lang="en">

<?php
    include_once 'include/connect.php';
?>

<head>
    <meta charset="UTF-8">
    <title>Login page</title>
    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.js"></script>


    <style>
        .bg{
            background: url("img/clg1.jpg") no-repeat ;
            background-size: cover;

        }

        #log{
            border: 2px solid white;
            padding: 50px 40px;
            margin-top: 50px;
            margin-bottom: 50px;
            border-radius: 10px;
            background: rgba(1000,1000,1000,.8);
        }

        h1{
            text-align: center;
            font-size: 40px;
            color: #005cbf;
        }

        label{
            font-size: 20px;
            color: #005cbf;
        }

        button{
            margin-left: 150px;
            margin-top: 25px;
        }

        a:hover {
            text-decoration-color: #005cbf;
            text-decoration: underline;
        }

        a{
            float: right;
            color: red;
            text-decoration-color: black;
            font-size: 20px;
        }

        img{
            height: 150px;
            position: relative;
            margin: auto 125px;

        }

        @media screen and (max-width: 1200px) {
            #log {padding-top: 15px;
                -ms-flex: 100%;
                flex: 100%;
                max-width: 100%;
            }

        }

    </style>


</head>
<body>
<div class="container-fluid  bg" >
    <h3>Hello</h3>
    <div class="row">
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
        <div class="col-md-4 col-sm-4 col-xs-12">

            <form action="LoginServlet" method="POST" id="log">
                <img src="img/logo.jpg" alt="PICT-LOGO" class="rounded-circle">
                <h1>Mentor Programme</h1>
                <div class="form-group">
                    <label>Mis id</label>
                    <input type="text" class="form-control" name="login_mis_id" placeholder="Registration-id">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="login_pswd" placeholder="Password">
                </div>
                <div class="custom-checkbox">
                    <label><input type="checkbox">Remember me</label>
                    <a href="#">New User</a>
                </div>
                <button type="Submit"  class="btn-primary btn-lg" name="login"><i class="fas fa-sign-in-alt"></i>Login</button>
                <!--- <button type="submit" class="btn-lg">Login</button> -->
            </form>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
    </div>
</div>




</body>
</html>