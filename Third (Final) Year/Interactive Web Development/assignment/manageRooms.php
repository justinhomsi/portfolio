<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_GET['submitManageRooms']))
	{
		echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		echo '<p align="center">Add New Room</p>';
		?>
		<form name="addRoom" method="post" action="addRoom.php">
		<tr>
			<td>Number:</td>
			<td>
				<input name="roomNum" type="text" style="width: 200px;"/></td>
			<td>Capacity:</td>
			<td>
				<input name="roomCapacity" type="text" style="width: 50px;"/></td>
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
			<td>Phone:</td>
			<td>
				<input name="phone" type="checkbox"/></td>
		</tr>
		<tr>
			<td>Type:</td>
			<td>
				<?php
				$roomTypeQuery = "SELECT * FROM room_types";
				$roomTypeResults = $db->query($roomTypeQuery);
				
				echo '<select name="roomType">';
				
				while ($row = $roomTypeResults->fetch_assoc())
				{
					echo '<option value="'.$row['room_type_id'].'">'.$row['room_type_name'].'</option>';
				}
				
				echo '</select>';
				?>
			</td>
			<td>
				<input type="submit" name="submitNewRoom" value="Submit"/></td>
		</tr>
		</table>
		</form>
		<?php
		
		$query = "SELECT * FROM rooms ORDER BY room_num";
		
		$results = $db->query($query);
		
		echo '<p align="center">Current Rooms</p>';
		echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		
		while ($row = $results->fetch_assoc())
		{
			echo '<td>'.$row['room_num'].' - '.' <a href="view.php?room_num='.$row['room_num'].'">View Details'.' - '.' <a href="edit.php?room_num='.$row['room_num'].'">Edit'.' - '.' <a href="cancel.php?room_num='.$row['room_num'].'" onclick="return confirm(\'Are you sure you want to delete this room?\');">Delete</tr>';
		}
	}
?>