<?php
session_start();
include 'databaseConnect.php';

if(!isset($_SESSION['staffUsername']) || $_SESSION['staffUsername'] == '')
{
	header('Location: index.php');
	exit;
}

include 'BackLogout.php';

if(isset($_GET['submitSearch']) && $_GET['searchTerm'] != '')
{
	$searchTerm = '%'.$_GET['searchTerm'].'%';
	$query = "SELECT * FROM rooms WHERE room_num LIKE '".$searchTerm."'";
	$result = $db->query($query);
	
	echo '<h3 align="center">Search results for "'.$_GET['searchTerm'].'"<br><br></h3>';
	echo '<table align="center" style="width: 180px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
	
	if($result->num_rows == 0 || $searchTerm == '') 
	{
		echo '<td>No matching results</td>';
	}
		
	else
	{
		while($row = $result->fetch_assoc()) 
		{
			echo '<td>'.$row['room_num'].' - '.' <a href="view.php?room_num='.$row['room_num'].'">View/Book</tr>';
		}
	}
	
		
}

elseif(isset($_GET['submitSearch']) && ($_GET['searchTerm'] == ''))
{
	echo '<br>Please enter a search term or use the list all rooms button.<br>';
}	
	
elseif(isset($_GET['submitListAll']))
{
	$query = "SELECT * FROM rooms ORDER BY room_num";
		
	$result = $db->query($query);
	
	echo '<h3 align="center">Current Rooms</h3>';
	echo '<table align="center" style="width: 180px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		
	while ($row = $result->fetch_assoc())
	{
		echo '<td>'.$row['room_num'].' - '.' <a href="view.php?room_num='.$row['room_num'].'">View/Book</tr>';
	}
}

elseif(isset($_GET['submitEquipmentSearch']))
{
	if(isset($_GET['whiteboard']))
	{
		$whiteboard = "Y";
	}
	else
	{
		$whiteboard = "N";
	}
	
	if(isset($_GET['projector']))
	{
		$projector = "Y";
	}
	else
	{
		$projector = "N";
	}
	
	if(isset($_GET['audioSystem']))
	{
		$audioSystem = "Y";
	}
	else
	{
		$audioSystem = "N";
	}
	
	if(isset($_GET['phone']))
	{
		$phone = "Y";
	}
	else
	{
		$phone = "N";
	}
	
	$query = "SELECT * FROM rooms WHERE whiteboard='".$whiteboard."' AND projector='".$projector."' AND audio_system='".$audioSystem."' AND telephone='".$phone."'";
	$results = $db->query($query);
	
	
	if($results->num_rows == 0)
	{
		echo '<p align="center">No matching rooms found</p>';
		exit;
	}
	else
	{
		echo '<h3 align="center">Rooms with matching equipment:</h3>';
		echo '<table align="center" style="width: 180px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
	
		while ($row = $results->fetch_assoc())
		{
			echo '<td>'.$row['room_num'].' - '.' <a href="view.php?room_num='.$row['room_num'].'">View/Book</tr>';
		}
	}
}
?>