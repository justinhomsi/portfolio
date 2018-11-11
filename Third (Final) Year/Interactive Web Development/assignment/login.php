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
	
	if(isset($_POST['staffUsername']))
	{
		include 'databaseConnect.php';
		
		$query = "SELECT * FROM staff WHERE username ='".$_POST['staffUsername']."' AND password='".$_POST['staffPassword']."'";
		
		$results = $db->query($query);
		
		if($results->num_rows == 0)
		{
			echo 'Login failed, please try again.';
		}
		else
		{
			$user = $results->fetch_assoc();
			$firstname = $user['first_name'];
			$surname = $user['surname'];
			
			$_SESSION['staffUsername'] = $user['username'];
			$_SESSION['name'] = $firstname.' '.$surname;
			
			$ipAddress = $_SERVER['REMOTE_ADDR'];
			$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['staffUsername']." logged in')";
			$logResults = $db->query($logQuery);
			header('Location: staff.php');
			exit;
		}
	}
	
	if(isset($_POST['adminUsername']))
	{
		include 'databaseConnect.php';
		
		$query = "SELECT * FROM admin WHERE username ='".$_POST['adminUsername']."' AND password='".$_POST['adminPassword']."'";
		
		$results = $db->query($query);
		
		if($results->num_rows == 0)
		{
			echo 'Login failed, please try again.';
		}
		else
		{
			$user = $results->fetch_assoc();
			
			$_SESSION['adminUsername'] = $user['username'];
			$ipAddress = $_SERVER['REMOTE_ADDR'];
			$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['adminUsername']." logged in')";
			$logResults = $db->query($logQuery);
			header('Location: admin.php');
			exit;
		}
	}
?>