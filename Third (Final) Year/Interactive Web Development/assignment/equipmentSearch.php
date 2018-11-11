<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['staffUsername']) || $_SESSION['staffUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
?>
<html>
<head>
	<title>Staff Homepage</title>
</head>
<body>
	<h1 align="center">Staff Homepage</h1>
	<?php
		echo '<h4 align="center">Welcome, '.$_SESSION['name'].'</h4>';
	?>
	<form name="equipmentSearchForm" method="get" action="searchRooms.php">
		<table align="center" style="width: 300px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
			<tr>
				<td colspan="4" align="center"><strong>Room Equipment Search</strong></td>
			</tr>
			<tr>
				<td>Whiteboard:</td>
				<td>
					<input name="whiteboard" type="checkbox"/></td>
				<td>Projector:</td>
				<td>
					<input name="projector" type="checkbox"/></td>
			</tr>
			<tr>
				<td>Audio System:</td>
				<td>
					<input name="audioSystem" type="checkbox"/></td>
				<td>Telephone:</td>
				<td>
					<input name="phone" type="checkbox"/></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" name="submitEquipmentSearch" value="Search"/></td>
			</tr>
		</table>
	</form>
</body>
	
