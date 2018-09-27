<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <title>Academic Details</title>

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
                <h1>Academic Details</b> </h1>
                <div class="form-group">
                    <label>SSC school and aggregate</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>HSC school and aggregate</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>PCM</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>CET</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>JEE</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Admission category (CAP(Open)/CAP(Reserved)/Institute
                        Level/PIO?NRI/Foreign/J&K/GOI)</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Subject area of interest</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Career Plan</label>
                    <textarea class="form-control" rows="3" placeholder=""></textarea>
                    <label>Preference Job/Business/Higher Studies</label>
                    <input type="text" class="form-control" placeholder="">
                    <label>Affinity R&D(Yes/No)</label>
                    <input type="text" class="form-control" placeholder="">

                    <div class="form-group" style="margin-top: 10px" >
                        <label>Upload Documents</label>
                        <input type="file" name="file">
                    </div>

                    <div class="form-group">
                         <input type="submit" class="btn-primary" value="submit">
                         <input type="reset" class="btn-danger" value="reset">
                    </div>
                </div>



            </form>


        </div>
    </div>
</div>


</body>
</html>