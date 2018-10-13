<%--
  Created by IntelliJ IDEA.
  User: madhura
  Date: 14/9/18
  Time: 7:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Leave_Application</title>
    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

    <style>
        .new_user_form{
            border: 2px solid black;
            padding: 50px 40px;
            margin-top: 50px;
            margin-bottom: 50px;
            border-radius: 10px;
        }

        .button1 {
            color: white;
            font-family: "Comic Sans MS";
            background-color: #3cb22c;
            border-top-color: #337e29;
        }
        .button2 {
            color: white;
            font-family: "Comic Sans MS";
            background-color:#e31e0e ;
            border-top-color: #a9281d;
        }
        .button4 {border-radius: 12px;}

    </style>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12"><!--</div>
        <div class="col-md-6 new_user_form" >-->
            <form action="../jsp/leave_app_back.jsp" method="post">
                <h1 align="center"><u>Leave application </u></h1>
                <br>
                <div class="form-group">
                    <label>Attendance prior to this leave :</label>
                    <input type="text" class="form-control" name="attendance" required>
                </div>
                <div class="form-group" align="left">
                    <label>Leave Start Date :</label>
                    <input type="date" name="dateFrom"  required />
                </div>
                <div class="form-group" align="left">
                    <label>Leave End Date :</label>
                    <input type="date" name="dateTo" required />
                </div>
                <div class="form-group">
                    <label>Number of working hours falling in the leave period :</label>
                    <input type="number" class="form-control" name="leave_hrs" required>
                </div>


                <div class="form-group">
                    <label>Reason for this leave :</label>
                    <br>
                    <input type="text" name="leave_reason" placeholder="Reason for leave" required>
                </div>
                <div class="blockquote-footer">
                    <button type="submit" class="button1 button4" style="width:100px;height:50px; ">Request</button>
                    <button type="submit" class="button2 button4" style="width:100px;height:50px;">Cancel</button>
                </div>

            </form>
        </div>
        <!---<div class="col-md-3"></div>-->
    </div>
</div>
</body>

</html>
