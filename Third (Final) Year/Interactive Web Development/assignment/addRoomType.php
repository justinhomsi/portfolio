<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_POST['submitNewRoomType']))
	{
		$errorMessage = '';
		
		if(empty($_POST['roomTypeName']))
		{
			$errorMessage = 'Please enter a name for this room type';
		}
		
		if($errorMessage != '')
		{
			echo 'Error: '.$errorMessage.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
		}
		else
		{
			$query = "INSERT INTO room_types VALUES (room_type_id, '".$_POST['roomTypeName']."')";
			
			$results = $db->query($query);
			
			if($results)
			{
				echo '<p>Room type successfully added</p>';
			}
			else
			{
				echo '<p>Error adding room. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}
	}