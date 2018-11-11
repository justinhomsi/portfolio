<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_GET['submitListAllRooms']))
	{
		$query = "SELECT * FROM rooms ORDER BY room_num";
		
		$result = $db->query($query);
		
		echo '<p align="center">Current Rooms</p>';
		
		echo '<table align="center" style="width: 280px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		
		while ($row = $result->fetch_assoc())
		{
			echo '<td>'.$row['room_num'].' - '.' <a href="view.php?room_num='.$row['room_num'].'">View Details/Bookings</tr>';
		}
	}
?>