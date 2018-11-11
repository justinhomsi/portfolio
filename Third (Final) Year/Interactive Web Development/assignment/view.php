<?php
	session_start();
	include 'databaseConnect.php';
	
	include 'BackLogout.php';
	
	if(isset($_SESSION['adminUsername']) && $_SESSION['adminUsername'] != '')
	{
		if(isset($_GET['username']))
		{
			$query = "SELECT * FROM staff WHERE username='".$_GET['username']."'";
		
			$results = $db->query($query);
		
			$name = $results->fetch_assoc();
		
			$results = $db->query($query);
		
			if($results->num_rows == 0)
			{
				echo 'No results found';
			}
		
			else
			{
				echo '<h3 align="center">Details of '.$name['first_name'].' '.$name['surname'].'<br><br>';
				while ($row = $results->fetch_assoc())
				{
					echo 'Extension: '.$row['extension'].'<br>';
					echo 'Username: '.$row['username'].'<br><br><br>';
				}
			}
		}

	
		if(isset($_GET['username']))
		{
			$query = "SELECT * FROM bookings WHERE username='".$_GET['username']."'";
		
			$results = $db->query($query);
		
			$today = date("Y-m-d H:i:s");
		
		
			echo 'Upcoming bookings for '.$name['first_name'].' '.$name['surname'].'<br><br>';
		
			if($results->num_rows == 0)
			{
				echo 'No bookings found';
			}
		
			else
			{
				echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
				while ($row = $results->fetch_assoc())
				{
					if($row['end_time'] > $today)
					{
						echo '<tr>'.'<td>';
						echo $row['start_time']." - ".$row['end_time'].", Room ".$row['room_num'].' -'.' <a href="cancel.php?booking_id='.$row['booking_id'].'" onclick="return confirm(\'Are you sure you want to cancel this booking?\');">Cancel';
						echo '</td>'.'</tr>';
					}
				}
			}
		}

	
		if(isset($_GET['room_num']))
		{
			$query = "SELECT * FROM rooms WHERE room_num ='".$_GET['room_num']."'";
		
			$results = $db->query($query);
		
			echo '<p align="center">Details of '.$_GET['room_num'].'</p>';
		
			echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		
			while ($row = $results->fetch_assoc())
			{
				echo '<td><p align="left">Capacity: '.$row['capacity'].'</p></td></tr>';
				
				$roomTypeQuery = "SELECT room_type_name FROM room_types WHERE room_type_id ='".$row['room_type_id']."'";
				$roomTypeResults = $db->query($roomTypeQuery);
			
				while ($row = $roomTypeResults->fetch_assoc())
				{
					echo '<td><p align="left">Room type: '.$row['room_type_name'].'</p></td></tr>';
				}
				
				$equipmentQuery = "SELECT * FROM rooms WHERE room_num ='".$_GET['room_num']."'";
				$equipmentResults = $db->query($equipmentQuery);
				
				while ($row = $equipmentResults->fetch_assoc())
				{
					if($row['whiteboard'] == "Y")
					{
						echo '<td><p align="left">Whiteboard: Yes</p></td>';
					}
					else
					{
						echo '<td><p align="left">Whiteboard: No</p></td>';
					}
					
					if($row['projector'] == "Y")
					{
						echo '<td><p align="left">Projector: Yes</p></td></tr>';
					}
					else
					{
						echo '<td><p align="left">Projector: No</p></td></tr>';
					}
					
					if($row['audio_system'] == "Y")
					{
						echo '<td><p align="left">Audio System: Yes</p></td>';
					}
					else
					{
						echo '<td><p align="left">Audio System: No</p></td>';
					}
					
					if($row['telephone'] == "Y")
					{
						echo '<td><p align="left">Telephone: Yes</p></td></tr>';
					}
					else
					{
						echo '<td><p align="left">Telephone: No</p></td></tr>';
					}
				}
			}
			
			echo '</table>';
			
			$bookingQuery = "SELECT * FROM bookings WHERE room_num='".$_GET['room_num']."'";
			
			$bookingResults = $db->query($bookingQuery);
			
			$today = date("Y-m-d H:i:s");
			
			echo '<p align="center">Upcoming Bookings</p>';
			echo '<table align="center" style="width: 500px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
			while ($row = $bookingResults->fetch_assoc())
			{
				if($row['end_time'] > $today)
				{
					echo '<td>'.$row['start_time']." - ".$row['end_time'].", Room ".$row['room_num'].' - '.'<a href="cancel.php?booking_id='.$row['booking_id'].'" onclick="return confirm(\'Are you sure you want to cancel this booking?\');">Cancel</tr>';
				}
			}
		}
		exit;
	}
	
	if(isset($_SESSION['staffUsername']) && $_SESSION['staffUsername'] != '')
	{
		if(isset($_GET['room_num']))
		{
			$query = "SELECT * FROM rooms WHERE room_num ='".$_GET['room_num']."'";
		
			$results = $db->query($query);
		
			echo '<p align="center">Details of '.$_GET['room_num'].'</p>';
		
			echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		
			while ($row = $results->fetch_assoc())
			{
				echo '<td><p align="left">Capacity: '.$row['capacity'].'</p></td></tr>';
			
				$roomTypeQuery = "SELECT room_type_name FROM room_types WHERE room_type_id ='".$row['room_type_id']."'";
				$roomTypeResults = $db->query($roomTypeQuery);
			
				while ($row = $roomTypeResults->fetch_assoc())
				{
					echo '<td><p align="left">Room type: '.$row['room_type_name'].'</p></td></tr>';
				}
				
				$equipmentQuery = "SELECT * FROM rooms WHERE room_num ='".$_GET['room_num']."'";
				$equipmentResults = $db->query($equipmentQuery);
				
				while ($row = $equipmentResults->fetch_assoc())
				{
					if($row['whiteboard'] == "Y")
					{
						echo '<td><p align="left">Whiteboard: Yes</p></td>';
					}
					else
					{
						echo '<td><p align="left">Whiteboard: No</p></td>';
					}
					
					if($row['projector'] == "Y")
					{
						echo '<td><p align="left">Projector: Yes</p></td></tr>';
					}
					else
					{
						echo '<td><p align="left">Projector: No</p></td></tr>';
					}
					
					if($row['audio_system'] == "Y")
					{
						echo '<td><p align="left">Audio System: Yes</p></td>';
					}
					else
					{
						echo '<td><p align="left">Audio System: No</p></td>';
					}
					
					if($row['telephone'] == "Y")
					{
						echo '<td><p align="left">Telephone: Yes</p></td></tr>';
					}
					else
					{
						echo '<td><p align="left">Telephone: No</p></td></tr>';
					}
				}
			}
		}
	
	
		?>
		<body>
		<form name="newBookingForm" method="post" action="createBooking.php">
			<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
				<?php
					echo '<p align="center">New Booking for '.$_GET['room_num'].'</p>';
				?>
				<tr>
					<td>Start:</td>
					<td>
						<input name="startDate" type="datetime-local" style="width: 200px;"/></td>
				</tr>
				<tr>
					<td>End:</td>
					<td>
						<input name="endDate" type="datetime-local" style="width: 200px;"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="submitBooking" value="Submit"></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="room_num" id="room_num_id" value="<?php echo $_GET['room_num'] ?>"/></td>
				</tr>
			</table>
		</form>
	</body>

	<?php
		echo '<table align="center" style="width: 500px; border: 2px solid grey; padding-left: 10px;" cellspacing="10" cellpadding="1" bgcolor="lightblue">';
		echo '<p align="center">Current Bookings for '.$_GET['room_num'].'</p>';
		
		$query = "SELECT * FROM bookings WHERE room_num ='".$_GET['room_num']."'";
		
		$results = $db->query($query);
		
		while ($row = $results -> fetch_assoc())
		{
			$nameQuery = "SELECT first_name, surname FROM staff WHERE username ='".$row['username']."'";
			$nameResults = $db->query($nameQuery);
			
			while ($name = $nameResults -> fetch_assoc())
			{
				echo '<td>'.$row['start_time'].' - '.$row['end_time'].', '.$name['first_name'].' '.$name['surname'].'</tr>';
			}
		}
		echo '</table>';
	}
	else
	{
		header('Location: index.php');
		exit;
	}
?>