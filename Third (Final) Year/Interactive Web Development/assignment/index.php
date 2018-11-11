<?php
	session_start();
	
	if(isset($_SESSION['staffUsername']) && $_SESSION['staffUsername'] != '')
	{
		header('Location: staff.php');
		exit;
	}
	
	if(isset($_SESSION['adminUsername']) && $_SESSION['adminUsername'] != '')
	{
		header('Location: admin.php');
		exit;
	}
?>
<html>
<head>
	<title>Room Booking System</title>
</head>

<body>
	<h1 align="center">Welcome to the Room Booking System</h1>
	<h3 align="center" style="padding-left: 100px;">Login below, or <a href="registerStaff.php">register a new account</a></h3>
	<form name="staffLoginForm" method="post" action="login.php">
		<table align="center" style="width: 250px; border: 2px; float: left; padding-right: 5px; margin: 0px 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue"> 
			<tr>
				<td colspan="2" align="center"><strong>Staff Login</strong></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td>
					<input name="staffUsername" type="text" style="width: 100px; " maxlength="20" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td>
					<input name="staffPassword" type="password" style="width: 100px;" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="padding-right: 15px;">
					<input type="submit" name="submitStaff" value="Log In" /></td>
			</tr>
		</table>
	</form>
	<form name="adminLoginForm" method="post" action="login.php">
		<table align="center" style="width: 250px; border: 2px; padding-left: 5px; margin: 0px 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
			<tr>
				<td colspan="2" align="center"><strong>Admin Login</strong></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td>
					<input name="adminUsername" type="text" style="width: 100px;" maxlength="20" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td>
					<input name="adminPassword" type="password" style="width: 100px;" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="padding-right: 15px;">
					<input type="submit" name="submitAdmin" value="Log In" /></td>
			</tr>
		</table>
	</form>
</body>