<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Extra Details</title>

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
                <h1>Extra</b> </h1>
                <div class="form-group">
                    <label>Hobbies</label>
                    <textarea class="form-control" rows="3" placeholder=""></textarea>
                    <label>Extra/Co curricular Activities</label>
                    <textarea class="form-control" rows="3" placeholder=""></textarea>
                    <label>Sports</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Any Special Achievements</label>
                    <textarea class="form-control" rows="3" placeholder=""></textarea>
                    <label>Scholarships</label>
                    <textarea class="form-control" rows="3" placeholder=""></textarea>
                </div>


                <div class="form-group">
                    <input type="submit" class="btn-primary" value="submit">
                    <input type="reset" class="btn-danger" value="reset">
                </div>
            </form>
        </div>



    </div>





        </div>
    </div>
</div>


</body>
</html>