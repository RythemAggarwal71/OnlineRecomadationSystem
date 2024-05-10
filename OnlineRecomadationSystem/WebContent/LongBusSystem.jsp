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
                       	<li class="active"><a href="LongRouteReservation.jsp">Long Route Reservation</a></li>
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
                <h2>Long Bus Reservation</h2>
			<div class="col-md-6 col-md-offset-3">
			<%
			Dbconn db=new Dbconn();
    		Connection con=db.conn();
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select * from longbusroute group by src");
    		Statement st1=con.createStatement();
    		ResultSet rs1=st1.executeQuery("select * from longbusroute group by dest");
			
			%>
			<form role="form" action="LongBusSystem.jsp" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered">

			<tr>
			<td class="col-md-2"><label for="txt_Uname">From:</label></td>
		    <td class="col-md-6"><select name="txt_from" id="txt_from" class="form-control">
		    <option value="">---select City---</option>
		    <%
		    while(rs.next())
		    {
		    %>
		    <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
		    <%
		    }
		    %>
		    </select></td>
		    </tr>
		    
		    <tr>
			<td class="col-md-2"><label for="txt_Uname">To:</label></td>
		    <td class="col-md-6"><select name="txt_to" id="txt_to" class="form-control">
		    <option value="">---select City---</option>
		    <%
		    while(rs1.next())
		    {
		    %>
		    <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
		    <%
		    }
		    %>
		    </select></td>
		    </tr>
		    
			<tr>
			<td class="col-md-6" colspan="2" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Show Route Recommendation"><br>
			</td>
			</tr>

			</table>
			</div>
			</form> 			
			</div>	

			<%

			String from=request.getParameter("txt_from").toString(),to=request.getParameter("txt_to").toString();
			
			System.out.print("from===>"+from);
 			if(!from.contains("null") && !to.contains("null"))
			{
				System.out.print("welcome");
				
				Statement st2=con.createStatement();
				ResultSet rs2=st2.executeQuery("select * from longbusroute where src='"+from+"' and dest='"+to+"'");				
				%>
				<br><br><br><br><br><br><br><br><br><br><br>
				<h4> <label style="color: red;">From:</label> <%=from %>  &nbsp&nbsp&nbsp&nbsp <label style="color: red;">to:</label> <%=to %> </h4>
				<div class="col-md-10 col-md-offset-1">
				<form role="form" action="BookingProcess.jsp" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered">
			<tr>
			<td class="col-md-1">Select(Route No)</td>
			<td class="col-md-2">From</td>
			<td class="col-md-2">To</td>
			<td class="col-md-3">Points</td>
			<td class="col-md-1">Distance</td>
			<td class="col-md-1">Time</td>
			<td class="col-md-1">Rate</td>
			</tr>
			
			<%
			while(rs2.next())
			{
			%>
			<tr>
			<td class="col-md-1"><input type="radio" name="txt_rdid" required value="<%=rs2.getInt(1)%>"><%=rs2.getString(5) %> </td>
			<td class="col-md-2"><%=rs2.getString(2) %></td>
			<td class="col-md-2"><%=rs2.getString(3) %></td>
			<td class="col-md-3"><%=rs2.getString(4) %></td>
			<td class="col-md-1"><%=rs2.getString(6) %></td>
			<td class="col-md-1"><%=rs2.getString(7) %></td>
			<td class="col-md-1"><%=rs2.getDouble(8) %></td>
			</tr>
			<%
			}
			%>
			<tr>
			<td><input type="hidden" value="longbusroute" name="txt_sys"> </td>
			</tr>
			<tr>
			<td class="col-md-6" colspan="7" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Book Ticket"><br>
			</td>
			</tr>
			</table>
			</div>
			</form>
			
			<img alt="Not avilable" src="images/longbus/<%=from.toLowerCase()+"to"+to.toLowerCase()%>.PNG" width="550;" height="350;"> 
			
			
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
</body>
</html>