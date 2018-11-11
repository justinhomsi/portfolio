<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_GET['submitManageRoomTypes']))
	{
		echo '<table align="center" style="width: 400px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		echo '<p align="center">Add New Room Type</p>';
		?>
		<form name="addNewRoomType" method="post" action="addRoomType.php">
		<tr>
			<td>Name:</td>
			<td>
				<input name="roomTypeName" type="text" style="width: 200px;"/>
				<input style="width: 100px;" type="submit" name="submitNewRoomType" value="Submit"/></td>
		</tr>
		</table>
	<?php
		echo '<table align="center" style="width: 400px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		echo '<p align="center">Current Room Types</p>';
		
		$query = "SELECT * FROM room_types ORDER BY room_type_id";
		
		$results = $db->query($query);
		
		while ($row = $results->fetch_assoc())
		{
			echo '<td>'.$row['room_type_name'].' - '. '<a href="edit.php?room_type_id='.$row['room_type_id'].'">Edit'.' - '. '<a href="cancel.php?room_type_id='.$row['room_type_id'].'" onclick="return confirm(\'Are you sure you want to delete this room type?\');">Delete</tr>';
		}
	}