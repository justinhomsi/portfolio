<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';


	if(isset($_GET['submitViewLogs']))
	{
		$query = "SELECT * FROM logs ORDER BY log_time DESC";
		
		$result = $db->query($query);
		
		echo '<p align="center">Logs</p>';
		
		echo '<table align="center" style="width: 500px; border: 2px solid grey; margin: 10px auto;" cellspacing="10" cellpadding="10" bgcolor="lightblue">';
		
		while ($row = $result->fetch_assoc())
		{
			
			echo '<td>'.$row['log_time'].' '.$row['log_ip'].' '.$row['log_details'].'</tr>';
		}
	}
?>