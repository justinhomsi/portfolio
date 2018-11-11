<?php
	include 'databaseConnect.php';
	include 'BackLogout.php';
?>
<html>
<head>
	<title>Staff Registration Page</title>
</head>
<body>
	<h1>Welcome to the Staff Account Registration Form</h1>
	<h3>Please fill out the form below</h3>
	<form name="staffRegistrationForm" method="post" action="registerStaff.php">
		<table style="width 500px; border: 2px solid grey;" cellspacing="10" cellpadding="10">
		<tr>
			<td>Username:</td>
			<td>
				<input name="staffUsername" type="text" style="width: 100px;" maxlength="20"></td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td>
				<input name="staffFirstName" type="text" style="width: 100px;"></td>
		</tr>
		<tr>
			<td>Surname:</td>
			<td>
				<input name="staffSurname" type="text" style="width: 100px;"></td>
		</tr>
		<tr>
			<td>Telephone Extension:</td>
			<td>
				<input name="staffExtension" type="text" style="width: 32px;"></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td>
				<input name="staffPassword" type="password" style="width: 100px;"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" name="submitStaffRegistration" value="Register"></td>
		</tr>
		</table>
	</form>
</body>
<?php
	if(isset($_POST['submitStaffRegistration']))
	{
		//create variables for the data submitted
		$username = $_POST['staffUsername'];
		$firstname = $_POST['staffFirstName'];
		$surname = $_POST['staffSurname'];
		$extension = $_POST['staffExtension'];
		$password = $_POST['staffPassword'];
		
		$errorMessage = "";
		
		if (empty($username) || empty($firstname) || empty($surname) || empty($extension) || empty($password))
		{
			$errorMessage = 'Please fill out all required fields';
		}
		
		$username_query = "SELECT username FROM staff WHERE username = '".$username."'";
		$username_results = $db->query($username_query);
		
		if ($username_results->num_rows > 0)
		{
			$errorMessage = 'That username already exists, please try again';
		}
		
		elseif (!is_numeric($extension) || strlen($extension) != 4)
		{
			$errorMessage = 'Telephone extension must be a four digit number';
		}
		
		elseif (strlen($password) < 5)
		{
			$errorMessage = 'Password must be at least 5 characters in length';
		}
		
		if ($errorMessage != '')
		{
			echo 'Error: '.$errorMessage.' <a href="javascript: history.back();">Go Back</a>.';
			echo '</body></html>';
			exit;
		}
		else
		{
			$query = "INSERT INTO staff VALUES ('".$username."', '".$firstname."', '".$surname."', '".$extension."', '".$password."')";
			
			$result = $db->query($query);
			
			if ($result)
			{
				echo '<p>Details successfully inserted</p>';
				$ipAddress = $_SERVER['REMOTE_ADDR'];
				$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$username." created an account')";
				$logResults = $db->query($logQuery);
			}
			else
			{
				echo '<p>Error inserting details. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}	
	}
?>
</html>