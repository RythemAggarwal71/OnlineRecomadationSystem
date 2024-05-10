<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="javascript">
function val1()
{
	
	if(form1.card.value==""&&)
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body background="images\world2.gif">
<form name="form1" onsubmit="return val1()" action="Pay"  method="post">
<div align="center">
<pre>

<font size=4 face="calibri">
Bank Name            :  <select style="width:150px" name="bank">
  			  <option value= "Bank Of Maharashtra">Bank Of Maharashtra</option>
			  <option value= "Axis Bank">Axis Bank</option>
			  <option value= "ICICI">ICICI</option>
			  <option value= "HDFC">HDFC</option>
			  <option value= "IDBI">IDBI</option>
			  <option value= "Bank Of India">Bank Of India</option>
			  <option value= "State Bank Of India">State Bank Of India</option>
			  <option value= "Reserve Bank Of India">Reserve Bank Of India</option>
			  </select><br>
			  
     Credit Card Number   :  <input type="text" name ="card" maxlength="12"><br>

Pin Number           :  <input type="password" name ="pin"><br>

<input type="submit" value="Confirm"> <input type="reset" value=" Reset " width=20> 
</font>
</pre>
</div>
</form>
</body>
</html>