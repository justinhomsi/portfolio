<?php
	session_start();
	include 'databaseConnect.php';

	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_GET['room_num']))
	{
		?>
		<form name="editRoom" method="post" action="edit.php">
			<table align="center" style="width: 500px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
				<tr>
					<td colspan="3" align="center"><strong>Edit details of <?php echo $_GET['room_num'] ?></strong></td>
				</tr>
				<tr>
					<td>Capacity:</td>
					<td>
						<input name="capacity" type="text" style="width: 50px;" /></td>
				</tr>
				<tr>
					<td>Whiteboard:</td>
					<td>
						<?php
						$checkSetQuery = "SELECT * FROM rooms WHERE room_num='".$_GET['room_num']."'";
						$checkSetResults = $db->query($checkSetQuery);
						
						while($row = $checkSetResults->fetch_assoc())
						{
							if($row['whiteboard'] == "Y")
							{
								echo '<input name="whiteboard" type="checkbox" checked="true"/></td>';
							}
							else
							{
								echo '<input name="whiteboard" type="checkbox"/></td>';
							}
						}
						?>
					<td>Projector:</td>
					<td>
						<?php
						$checkSetQuery = "SELECT * FROM rooms WHERE room_num='".$_GET['room_num']."'";
						$checkSetResults = $db->query($checkSetQuery);
						while($row = $checkSetResults->fetch_assoc())
						{
							if($row['projector'] == "Y")
							{
								echo '<input name="projector" type="checkbox" checked="true"/></td>';
							}
							else
							{
								echo '<input name="projector" type="checkbox"/></td>';
							}
						}
						?>
				</tr>
				<tr>
					<td>Audio System:</td>
					<td>
						<?php
						$checkSetQuery = "SELECT * FROM rooms WHERE room_num='".$_GET['room_num']."'";
						$checkSetResults = $db->query($checkSetQuery);
						while($row = $checkSetResults->fetch_assoc())
						{
							if($row['audio_system'] == "Y")
							{
								echo '<input name="audioSystem" type="checkbox" checked="true"/></td>';
							}
							else
							{
								echo '<input name="audioSystem" type="checkbox"/></td>';
							}
						}
						?>
					<td>Phone:</td>
					<td>
						<?php
						$checkSetQuery = "SELECT * FROM rooms WHERE room_num='".$_GET['room_num']."'";
						$checkSetResults = $db->query($checkSetQuery);
						while($row = $checkSetResults->fetch_assoc())
						{
							if($row['telephone'] == "Y")
							{
								echo '<input name="phone" type="checkbox" checked="true"/></td>';
							}
							else
							{
								echo '<input name="phone" type="checkbox"/></td>';
							}
						}
						?>
				</tr>
				<tr>
					<td>Room type:</td>
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
				</tr>
				<tr>
					<td colspan="3" align="right">
						<input type="submit" name="submitEdit" value="Submit" /></td>
				</tr>
				<tr>
					<input type="hidden" name="room_number_hidden" id="room_num_id" value="<?php echo $_GET['room_num'] ?>"/></td>
			</table>
		</form>
	<?php
	}
	
	if(isset($_POST['submitEdit']))
	{
		$errorMessage = '';
		
		if(!is_numeric($_POST['capacity']))
		{
			$errorMessage = 'Capacity must be a number';
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
			
			
			$query = "UPDATE rooms SET capacity='".$_POST['capacity']."', room_type_id='".$_POST['roomType']."', whiteboard='".$whiteboard."', projector='".$projector."', audio_system='".$audioSystem."', telephone='".$phone."' WHERE room_num='".$_POST['room_number_hidden']."'";
			
			$results = $db->query($query);
			
			if($results)
			{
				echo '<p>Room details edited successfully</p>';
			}
			else
			{
				echo '<p>Error updating room details. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}
	}
	
	if(isset($_GET['room_type_id']))
	{
		$roomTypeNameQuery = "SELECT * FROM room_types WHERE room_type_id='".$_GET['room_type_id']."'";
		$roomTypeNameResults = $db->query($roomTypeNameQuery);
		
		while ($row = $roomTypeNameResults->fetch_assoc())
		{
			$roomTypeName = $row['room_type_name'];
		}
		?>
		<form name="editRoomType" method="post" action="edit.php">
			<table align="center" style="width: 500px; border: 2px solid grey" cellspacing="10" cellpadding="1" bgcolor="lightblue">
				<tr>
					<td colspan="2" align="center"><strong>Edit Details of <?php echo $roomTypeName ?></strong></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td>
						<input name="newTypeName" type="text" style="width: 200px;"/>
						<input style="width: 100px;" type="submit" name="submitNewTypeName" value="Submit"/></td>
				</tr>
				<tr>
					<input type="hidden" name="room_type_id_hidden" id="room_type_id" value="<?php echo $_GET['room_type_id'] ?>"/></td>
			</table>
		</form>
		<?php
	}
	
	if(isset($_POST['submitNewTypeName']))
	{
		$errorMessage = '';
		
		if(empty($_POST['newTypeName']))
		{
			$errorMessage = 'Please enter a name';
		}
		
		if($errorMessage != '')
		{
			echo 'Error: '.$errorMessage.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
		}
		else
		{
			$query = "UPDATE room_types SET room_type_name='".$_POST['newTypeName']."' WHERE room_type_id='".$_POST['room_type_id_hidden']."'";
			
			$results = $db->query($query);
			
			if($results)
			{
				echo '<p>Room type details edited successfully</p>';
			}
			else
			{
				echo '<p>Error updating room type details. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}
	}
?>