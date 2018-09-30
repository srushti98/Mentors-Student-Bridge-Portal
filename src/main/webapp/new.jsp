<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .navbar {
            overflow: hidden;
            background-color: #2f28d6;
            font-family: Arial, Helvetica, sans-serif;
        }

        .navbar a {
            float: left;
            font-size: 16px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .dropdown {
            float: left;
            overflow: hidden;

        }

        .dropdown .dropbtn {
            cursor: pointer;
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            /*background-color: inherit;*/
            background-color: #2f28d6;
            font-family: inherit;
            margin: 0;
        }

        .navbar a:hover, .dropdown:hover .dropbtn, .dropbtn:focus {
            background-color: #221b94;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(21, 20, 214, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: #2f28d6;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }
    </style>
</head>
<body>

<div class="navbar bg-primary">
    <a href="new.jsp">Mentor-Student</a>
    <a href="#news">Home</a>
    <div class="dropdown">
        <button class="dropbtn" onclick="myFunction2()">EditProfile
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content" id="myDropdown2">
            <a href="#">Personal Details</a>
            <a href="#">Academic Details</a>
            <a href="#">Parent Details</a>
            <a href="#">Extra Activities</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="myFunction1()">Submit
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content" id="myDropdown1">
            <a href="#">Leave Application</a>
            <a href="#">Undertaking</a>
            <a href="#">MinutesofMeeting</a>
            <a href="#">MeetMentor</a>
        </div>
    </div>
    <a href="#home" style="float: right">LogOut</a>
    <a href="#news" style="float: right">Name</a>
</div>


<script>
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction1() {
        document.getElementById("myDropdown1").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(e) {
        if (!e.target.matches('.dropbtn')) {
            var myDropdown = document.getElementById("myDropdown1");
            if (myDropdown.classList.contains('show')) {
                myDropdown.classList.remove('show');
            }
        }
    }

    function myFunction2() {
        document.getElementById("myDropdown2").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(e) {
        if (!e.target.matches('.dropbtn')) {
            var myDropdown = document.getElementById("myDropdown2");
            if (myDropdown.classList.contains('show')) {
                myDropdown.classList.remove('show');
            }
        }
    }
</script>
</body>
</html>
