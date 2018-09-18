<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Parent Details</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>

    <style>
        .form{
            background-color: rgb(86, 86, 86);
        }

        h1{
            font-size: 40px;
            font-family: "Javanese Text";
            margin-top: 40px;
            text-align: center;
            color: snow;
        }

        label{
            font-size: 20px;
            color: snow;
        }

        .btn-danger,.btn-primary{
            border-radius: 0px;
            width: 48%;
        }
    </style>

</head>
<body>
<%
    if (session.getAttribute("stud_name")==null)
        response.sendRedirect("/index.jsp");
    String stud_mis_id = (String)session.getAttribute("stud_name");
    String stud_name = (String)session.getAttribute("stud_name"); %>

<div class="container-fluid">
    <div class="row">
        <!--<div class="col-md-3"></div>-->
        <div class="col-md-12 form">
            <form action=""  method="POST" enctype="multipart/form-data">
                <h1>Parent Details</b> </h1>
                <div class="form-group">
                    <label>Father Name</label>
                    <input type="text" class="form-control" placeholder="Full Name">
                    <label>Education</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Occupation</label>
                    <input type="number" class="form-control" placeholder="">
                    <label>Contact no.</label>
                    <input type="tel" class="form-control" placeholder="Contact no.">
                    <label>Email</label>
                    <input type="email" class="form-control" placeholder="Email id">
                    <label>Permanent Address</label>
                    <textarea class="form-control" rows="3" placeholder="Permanent Address"></textarea>
                </div>

                <div class="form-group">
                    <label>Mother Name</label>
                    <input type="text" class="form-control" placeholder="Full Name">
                    <label>Education</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Occupation</label>
                    <input type="number" class="form-control" placeholder="">
                    <label>Contact no.</label>
                    <input type="tel" class="form-control" placeholder="Contact no.">
                    <label>Email</label>
                    <input type="email" class="form-control" placeholder="Email id">
                    <label>Permanent Address</label>
                    <textarea class="form-control" rows="3" placeholder="Permanent Address"></textarea>
                </div>

                <div class="form-group">
                    <label>Siblings</label>
                    <input type="number" class="form-control" placeholder="Number of siblings">
                    <label>Academics</label>
                    <input type="text" class="form-control" placeholder="">
                </div>

                <div class="form-group">
                    <input type="submit" class="btn-primary" value="submit">
                    <input type="reset" class="btn-danger" value="reset">
                </div>



            </form>


        </div>
    </div>
</div>


</body>
</html>