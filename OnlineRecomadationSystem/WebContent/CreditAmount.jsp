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
						<a class="navbar-brand " href="UserHome.jsp">Bank System</a>                
                </div>
		<a href="UserHome.jsp" style="margin-left: 60%;"><input type="button" class="btn btn-primary" value="Back"></a>
		</nav><!--/nav-->      
                    </div>
                   
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                
                <div class="collapse navbar-collapse ">
                    <ul class="nav navbar-nav">
                    	<li ><a href="BankSystem.jsp">Bank Home</a></li>
                        <li ><a href="AddAccount.jsp">Add Bank Account</a></li>
                       	<li class="active"><a href="CreditAmount.jsp">Credit Amount</a></li>
                       	<li ><a href="DebitAmount.jsp">Debit Amount</a></li>
                       	<li ><a href="ViewBalance.jsp?bank=null">View Balance</a></li>
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
                <h2>Credit Ammount</h2>
                <div class="col-md-6 col-md-offset-3">
                                <%
                String uname=(String)session.getAttribute("name");
                Dbconn db=new Dbconn();
                Connection con=db.conn();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from bankinfo where User='"+uname+"'");
                
                %>
			<form role="form" action="CreditAmount" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered">

			<tr>
			<td class="col-md-2"><label for="txt_Ubank">Select Bank:</label></td>
		    <td class="col-md-6"><select type="text" class="form-control" name="txt_Ubank"  required id="txt_Ubank" placeholder="Select Bank">
		    		    <%
		    while(rs.next())
            {
            
		    %>
		    <option value= "<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
			<%
            }
			%>
		    </select></td>
		    
		    </tr>
		    
		    <tr>
			<td class="col-md-2"><label for="txt_UAcc">Enter Amount:</label></td>
		    <td class="col-md-6"><input type="number" class="form-control" pattern="[0-9]{1,9}" name="txt_UAmt" required id="txt_UAmt" placeholder="Enter Amount"></td>
		    </tr>

			<tr>
			<td class="col-md-6" colspan="2" align="center" ><input type="submit" class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Add Ammount"></td>
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
</body>
</html>