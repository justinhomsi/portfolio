<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_POST['submitNewRoom']))
	{
		$errorMessage = '';
		
		if(empty($_POST['roomNum']) || empty($_POST['roomCapacity']) || empty($_POST['roomType']))
		{
			$errorMessage = 'Please fill out all fields.';
		}
		
		if(!strlen($_POST['roomNum']) == 8)
		{
			$errorMessage = 'Room number must be 8 characters in length.';
		}
		
		if($errorMessage != '')
		{
			echo 'Error: '.$errorMessage.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
		}
		else
		{
			if(isset($_POST['whiteboard']))
			{
				$whiteboard = "Y";
			}
			else
			{
				$whiteboard = "N";
			}
			
			if(isset($_POST['projector']))
			{
				$projector = "Y";
			}
			else
			{
				$projector = "N";
			}
			
			if(isset($_POST['audioSystem']))
			{
				$audioSystem = "Y";
			}
			else
			{
				$audioSystem = "N";
			}
			
			if(isset($_POST['phone']))
			{
				$phone = "Y";
			}
			else
			{
				$phone = "N";
			}
			
			$query = "INSERT INTO rooms VALUES ('".$_POST['roomNum']."', '".$_POST['roomCapacity']."', '".$_POST['roomType']."', '".$whiteboard."', '".$projector."', '".$audioSystem."', '".$phone."')";
			
			$results = $db->query($query);
			
			if($results)
			{
				$ipAddress = $_SERVER['REMOTE_ADDR'];
				$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['adminUsername']." added room ".$_POST['roomNum']."')";
				$logResults = $db->query($logQuery);
				
				echo '<p>Room successfully added</p>';
			}
			else
			{
				echo '<p>Error adding room. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}
	}