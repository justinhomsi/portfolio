<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_GET['submitListAllStaff']))
	{
		$query = "SELECT * FROM staff ORDER BY surname";
		
		$results = $db->query($query);
		
		echo '<table align="center" style="width: 500px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		echo '<tr><td><p align="center">Staff Member List</p></tr>';
		while ($row = $results->fetch_assoc())
		{
			echo '<td>'.$row['first_name'].' '.$row['surname'].' - '.' <a href="view.php?username='.$row['username'].'">View Details/Bookings</tr>';
		}
	}
?>