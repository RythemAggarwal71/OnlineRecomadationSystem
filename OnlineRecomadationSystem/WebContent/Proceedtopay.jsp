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
<!--/head-->

<script language="javascript">
function val1()
{
	
	if(form1.card.value=="")
	{
		alert("ENTER CREDIT CARD NUMBER");
		return false;
	}
	if(form1.card.value.length!=12)
	{
		alert("INVALID CREDIT CARD NUMBER");
		return false;
	}
	
	if(form1.pin.value=="")
	{
		alert("ENTER PIN");
		return false;
	}
	if(form1.pin.value.length!=4)
	{
		alert("INVALID PIN");
		return false;
	}
}
</script>
</head>
<body class="homepage">



 
    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>Proceed To pay</h2>
		<form name="form1" onsubmit="return val1()" action="Pay"  method="post">
<div align="center">
<pre>
 <%
                String uname=(String)session.getAttribute("name");
                Dbconn db=new Dbconn();
                Connection con=db.conn();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from bankinfo where User='"+uname+"'");
                
                %>
<font size=4 face="calibri">
Bank Name            :  <select style="width:150px" name="bank">
  			   <%
		    while(rs.next())
            {
            
		    %>
		    <option value= "<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
			
			  </select><br>
			  
     Account Number   :  <input type="text" name ="card" value=<%=rs.getString(3) %>>maxlength="12"><br>
<%
            }
			%>
Pin Number           :  <input type="password" name ="pin"><br>

<input type="submit" value="Confirm"> <input type="reset" value=" Reset " width=20> 
</font>
</pre>
</div>
</form>	
            </div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div class="row">
                <div class="features">
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#feature-->


    <footer id="footer" class="midnight-blue" >

    </footer><!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>