<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.Dbconn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Socio Rank Algo for Recommendation System</title>
	
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                 <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header center wow fadeInDown">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						<a class="navbar-brand " href="UserHome.jsp">Socio Rank Algo for Recommendation System</a>                
                </div>
			<a href="UserHome.jsp" style="margin-left: 50%;"><input type="button" class="btn btn-primary" value="Back"></a>	
		</nav><!--/nav-->      
                    </div>
                   
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                
                <div class="collapse navbar-collapse ">
                    <ul class="nav navbar-nav">
                        <li ><a href="TravellingSystem.jsp">TravellingHome</a></li>
                       	<li ><a href="LongRouteReservation.jsp">Long Route Reservation</a></li>
                       	<li class="active"><a href="FlightSearch.jsp">Flight Search</a></li>
                       	<li ><a href="HotelSearch.jsp">Hotel Search</a></li>
                       	<li ><a href="PreviousHistory.jsp">Previous History</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("name")%><i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="Login">Logout</a></li> 
                            </ul>
                        </li>
                        
                                               
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
            </div><!--/.container-->
        		
    </header><!--/header-->

 
    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>Search Flight</h2>
                <div class="col-md-6 col-md-offset-3">

			<form role="form" action="FlightRecomendation" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered">

			<tr>
			<td class="col-md-2"><label for="txt_from">Trip type:</label></td>
			<td class="col-md-2"><select name="tripType" required>
			<option value="round-trip">Round Trip</option>
			<option value="one-way">One-Way</option>
			<option value="multi-city">Multi-City</option>
			</select></td>
			<td class="col-md-2"><label for="txt_from">Passenger:</label></td>
			<td class="col-md-1"><select name="passanger" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			</select></td>
			<td class="col-md-3"><label for="txt_from">Flight Class:</label></td>
			<td class="col-md-3"><select name="flightClass" required>
			<option value="economy">Economy</option>
			<option value="premiumEconomy">Premium Economy</option>
			<option value="business">Business</option>
			<option value="firstClass">First Class</option>
			</select></td>		    
		    </tr>
		    
			<tr>
			<td colspan="2" class="col-md-2"><label for="txt_from">From:</label></td>
		    <td colspan="4" class="col-md-8"><input type="text" name="txt_from" class="form-control" required id="txt_from" placeholder="Enter place from"></td>
		    </tr>
		    
		    <tr>
			<td colspan="2" class="col-md-2"><label for="txt_to">To:</label></td>
		    <td colspan="4" class="col-md-8"><input type="text" name="txt_to" class="form-control" required id="txt_to" placeholder="Enter place to"></td>
		    </tr>

			<tr>
			<td colspan="2" class="col-md-2"><label for="txt_date">Date:</label></td>
		    <td colspan="4" class="col-md-8">
		    <input class="controls input-append date form_date form-control" name="txt_Udate" size="16" type="text" value="" data-date-format="dd MM yyyy" data-link-field="dtp_input1">
            <input type="hidden" name="txt_Udate" id="dtp_input1" value="" />
		    </tr>

			<tr>
			<td class="col-md-8" colspan="6" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Show Route Recommendation"><br>
			</td>
			</tr>

			</table>
			</div>
			</form> 			
			</div>
            </div>

            <div class="row">
                <div class="features">
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#feature-->


    <footer id="footer" class="midnight-blue">

    </footer><!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>