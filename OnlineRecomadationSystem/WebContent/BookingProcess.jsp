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
    
    <link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
<!--/head-->



</head>

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
		
		</nav><!--/nav-->      
                    </div>
                   
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                
                <div class="collapse navbar-collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="TravellingSystem.jsp">TravellingHome</a></li>
                       	<li ><a href="LongRouteReservation.jsp">Long Route Reservation</a></li>
                       	<li ><a href="LocalRouteReservation.jsp?txt_from=null&txt_to=null">Local Route Reservation</a></li>
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
                <h2>Booking System</h2>
                
                <%
                String uname=(String)session.getAttribute("name");
                int idd=Integer.parseInt(request.getParameter("txt_rdid"));
    			String sys=request.getParameter("txt_sys");
    			
    			Dbconn db=new Dbconn();
    			Connection con=db.conn();
    			Statement st=con.createStatement();
    			ResultSet rs=st.executeQuery("select * from "+sys+" where Id='"+idd+"'");
    					
    			if(rs.next())
    			{
    				%>
                
                <div class="col-md-6 col-md-offset-3">
				<form role="form" action="Book" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered">
			<tr>
			<td class="col-md-2"><label for="txt_Uname">User:</label></td>
			<td class="col-md-6"><input type="text" class="form-control" name="txt_uname" a id="txt_uname" value="<%=uname%>" required> </td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uname">address:</label></td>
			<td class="col-md-6"><input type="text" class="form-control" name="txt_uadd" id="txt_uadd" required> </td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uname">gender:</label></td>
			<td class="col-md-6"><input type="radio" name="txt_ugen" id="txt_uname" value="Male" required> Male <input type="radio" name="txt_ugen" id="txt_uname" value="Female">Female</td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uname">contact:</label></td>
			<td class="col-md-6"><input type="text" class="form-control" name="txt_umob" pattern="[0-9]{10}" required id="txt_umob"> </td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uemail">Email:</label></td>
			<td class="col-md-6"><input type="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"name="txt_Uemail" required> </td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uemail">From:</label></td>
			<td class="col-md-6"><input type="hidden" name="txt_Ufrm" value="<%=rs.getString(2)%>"><input type="text" disabled="disabled" class="form-control" value="<%=rs.getString(2)%>"> </td>
			</tr>
			<tr>
			<td class="col-md-2"><label for="txt_Uemail">To:</label></td>
			<td class="col-md-6"><input type="hidden"  name="txt_Uto" value="<%=rs.getString(3)%>"> <input type="text" class="form-control" disabled="disabled" value="<%=rs.getString(3)%>"> </td>
			</tr>

			<tr>
			<td class="col-md-2"><label for="txt_Uemail">traveling date:</label></td>
			<td class="col-md-6">
			<input id="checkDateNow" class="form-control" onchange="checkDOB()" name="txt_Udate" size="16" type="date" value="" data-date-format="dd MM yyyy" data-link-field="dtp_input1" required>
            <input type="hidden" name="txt_Udate" id="dtp_input1" value="" />
			</td>
			</tr>
			
			<tr>
			<td class="col-md-2"><label for="txt_Uemail">Enter Seat:</label></td>
			<td class="col-md-6"><input type="number" class="form-control" name="txt_USeat" id="txt_USeat" required> </td>
			</tr>
			
			<tr>
			<td class="col-md-2"><label for="txt_Uemail">Amount per Seat:</label></td>
			<td class="col-md-6"><input type="number" disabled="disabled" class="form-control" id="txt_Uamt" value="<%=rs.getDouble(8)%>"> <input type="hidden" name="txt_Uamt" class="form-control" id="txt_Uamt" value="<%=rs.getDouble(8)%>"> </td>
			</tr>
			
			<tr>
			<td class="col-md-6" colspan="2" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Book Tcket"><br>
			</td>
			</tr>
			
			</table>
			</div>
			</form>
                </div>
                <%
    			}
                %>
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
    $('#date').datepicker({ 
	    startDate: "now()" 
	});
	
</script>
</body>
</html>