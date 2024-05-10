<%@page import="java.sql.Connection"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Socio Rank Algo for Recommendation System</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
</head>

<body>

<div class="super_container">
	
	<!-- Header -->

	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="phone">Socio Rank Algo for Recommendation System</div>
						<div class="user_box ml-auto">
							<div class="user_box_login user_box_link"><a href="Login.jsp">login</a></div>
							<div class="user_box_login user_box_link"><a href="NewRegistration.jsp">register</a></div>
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="index.jsp"><img src="images/logo.png" alt="">travelix</a></div>
						</div>
						
						<div class="content_search ml-lg-0 ml-auto">
							<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
								<g>
									<g>
										<g>
											<path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
											s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
											C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
											M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
											c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
										</g>
									</g>
									<g>
										<g>
											<path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
											c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
											C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
										</g>
									</g>
								</g>
							</svg>
						</div>

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>

	<!-- Home -->

	<div class="home">
		
		<!-- Home Slider -->

		<div class="home_slider_container">
			
			<div class="owl-carousel owl-theme home_slider">

				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							
						</div>
					</div>
				</div>

			</div>
			

			</div>
		</div>		
	</div>

	<!-- Intro -->
	
	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="intro_title text-center">We have the best Bus Recommendation based on previous searches</h2>
				</div>
			</div>

			<%
			Connection con=Dbconn.conn();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from longbusroute order by timeStamp desc limit 1");
			String from="";;
			String to="";
			while(rs.next())
			{
			from=rs.getString("src");
			to=rs.getString("dest");
			}

			Statement st2=con.createStatement();
				ResultSet rs2=st2.executeQuery("select * from longbusroute where src='"+from+"' and dest='"+to+"' order by price asc");				
				%>
				<h4> <label style="color: red;">From:</label> <%=from %>  &nbsp&nbsp&nbsp&nbsp <label style="color: red;">to:</label> <%=to %> </h4>
				<div class="col-md-10 col-md-offset-1">
				
			<div class="form-group">
			<table class="table table-responsive table-bordered" style="margin-left: 10%">
			<thead class="thead-light">
			<tr>
			<th class="col-md-2">From</th>
			<th class="col-md-2">To</th>
			<th class="col-md-3">Points</th>
			<th class="col-md-1">Distance</th>
			<th class="col-md-1">Time</th>
			<th class="col-md-1">Rate</th>
			</tr>
			</thead>
			<tbody>
			<%
			int i=0;
			while(rs2.next())
			{
				i++;
				if(i==0){
				
			%>
			<tr class="table-success">
			<td class="col-md-2"><%=rs2.getString(2) %></td>
			<td class="col-md-2"><%=rs2.getString(3) %></td>
			<td class="col-md-3"><%=rs2.getString(4) %></td>
			<td class="col-md-1"><%=rs2.getString(6) %></td>
			<td class="col-md-1"><%=rs2.getString(7) %></td>
			<td class="col-md-1"><%=rs2.getDouble(8) %></td>
			</tr>
			<%
				}
			else
			{
				%>
				<tr>
				<td class="col-md-2"><%=rs2.getString(2) %></td>
				<td class="col-md-2"><%=rs2.getString(3) %></td>
				<td class="col-md-3"><%=rs2.getString(4) %></td>
				<td class="col-md-1"><%=rs2.getString(6) %></td>
				<td class="col-md-1"><%=rs2.getString(7) %></td>
				<td class="col-md-1"><%=rs2.getDouble(8) %></td>
				</tr>
				<%
			}
			}
			%>
			</tbody>
			</table>
			</div>
			
		</div>
		
		<br><br>
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="intro_title text-center">We have the best Train Recommendation based on previous searches</h2>
				</div>
			</div>

<%
			Statement st3=con.createStatement();
			ResultSet rs3=st3.executeQuery("select * from longbusroute order by timeStamp desc limit 1");
			String from1="";;
			String to1="";
			while(rs3.next())
			{
			from1=rs3.getString("src");
			to1=rs3.getString("dest");
			}

			Statement st4=con.createStatement();
				ResultSet rs4=st4.executeQuery("select * from longtrainroute where src='"+from1+"' and dest='"+to1+"' order by price asc");				
				%>
				<h4> <label style="color: red;">From:</label> <%=from1 %>  &nbsp&nbsp&nbsp&nbsp <label style="color: red;">to:</label> <%=to1 %> </h4>
				<div class="col-md-10 col-md-offset-1">
				
			<div class="form-group">
			<table class="table table-responsive table-bordered" style="margin-left: 10%">
			<thead class="thead-light">
			<tr>
			<th class="col-md-2">From</th>
			<th class="col-md-2">To</th>
			<th class="col-md-3">Points</th>
			<th class="col-md-1">Distance</th>
			<th class="col-md-1">Time</th>
			<th class="col-md-1">Rate</th>
			</tr>
			</thead>
			<tbody>
			<%
			i=0;
			while(rs4.next())
			{
				i++;
				if(i==0){
				
			%>
			<tr class="table-success">
			<td class="col-md-2"><%=rs4.getString(2) %></td>
			<td class="col-md-2"><%=rs4.getString(3) %></td>
			<td class="col-md-3"><%=rs4.getString(4) %></td>
			<td class="col-md-1"><%=rs4.getString(6) %></td>
			<td class="col-md-1"><%=rs4.getString(7) %></td>
			<td class="col-md-1"><%=rs4.getDouble(8) %></td>
			</tr>
			<%
				}
			else
			{
				%>
				<tr>
				<td class="col-md-2"><%=rs4.getString(2) %></td>
				<td class="col-md-2"><%=rs4.getString(3) %></td>
				<td class="col-md-3"><%=rs4.getString(4) %></td>
				<td class="col-md-1"><%=rs4.getString(6) %></td>
				<td class="col-md-1"><%=rs4.getString(7) %></td>
				<td class="col-md-1"><%=rs4.getDouble(8) %></td>
				</tr>
				<%
			}
			}
			%>
			</tbody>
			</table>
			</div>			
		</div>
		
		</div>
		<br><br>
		
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="intro_title text-center">We have the best Flight Recommendation based on previous searches</h2>
				</div>
			
			</div>
<%
			Statement st5=con.createStatement();
			ResultSet rs5=st5.executeQuery("select * from longbusroute order by timeStamp desc limit 1");
			String from2="";;
			String to2="";
			while(rs5.next())
			{
			from2=rs5.getString("src");
			to2=rs5.getString("dest");
			}

			Statement st6=con.createStatement();
				ResultSet rs6=st6.executeQuery("select * from longplaneroute where src='"+from2+"' and dest='"+to2+"' order by price asc");				
				%>
				<h4> <label style="color: red;">From:</label> <%=from2 %>  &nbsp&nbsp&nbsp&nbsp <label style="color: red;">to:</label> <%=to2 %> </h4>
				<div class="col-md-10 col-md-offset-1">
				
			<div class="form-group">
			<table class="table table-responsive table-bordered" style="margin-left: 10%">
			<thead class="thead-light">
			<tr>
			<th class="col-md-2">From</th>
			<th class="col-md-2">To</th>
			<th class="col-md-3">Points</th>
			<th class="col-md-1">Distance</th>
			<th class="col-md-1">Time</th>
			<th class="col-md-1">Rate</th>
			</tr>
			</thead>
			<tbody>			
			<%
		i=0;
			while(rs6.next())
			{
				i++;
				if(i==0){
				
			%>
			<tr class="table-success">
			<td class="col-md-2"><%=rs6.getString(2) %></td>
			<td class="col-md-2"><%=rs6.getString(3) %></td>
			<td class="col-md-3"><%=rs6.getString(4) %></td>
			<td class="col-md-1"><%=rs6.getString(6) %></td>
			<td class="col-md-1"><%=rs6.getString(7) %></td>
			<td class="col-md-1"><%=rs6.getDouble(8) %></td>
			</tr>
			<%
				}
			else
			{
				%>
				<tr>
				<td class="col-md-2"><%=rs6.getString(2) %></td>
				<td class="col-md-2"><%=rs6.getString(3) %></td>
				<td class="col-md-3"><%=rs6.getString(4) %></td>
				<td class="col-md-1"><%=rs6.getString(6) %></td>
				<td class="col-md-1"><%=rs6.getString(7) %></td>
				<td class="col-md-1"><%=rs6.getDouble(8) %></td>
				</tr>
				<%
			}
			}
			%>
			</tbody>
			</table>
			</div>
		</div>
		</div>
</div>
</div>
<br><br>
<div>

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 order-lg-1 order-2  ">
					<div class="copyright_content d-flex flex-row align-items-center">
						<div><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>