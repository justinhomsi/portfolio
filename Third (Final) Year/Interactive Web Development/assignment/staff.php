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
	<form name="roomSearchForm" method="get" action="searchRooms.php">
		<table align="center" style="width: 500px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
			<tr>
				<td colspan="2" align="center"><strong>Find Room or</strong> <a href="equipmentSearch.php"><strong>Search by equipment</strong></a></td>
			</tr>
			<tr>
				<td>Search Term:</td>
				<td>
					<input name="searchTerm" type="text" style="width: 190px;" /> <input style="margin:0px 10px;" type="submit" name="submitSearch" value="Search" /> <input type="submit" name="submitListAll" value="List All Rooms" /></td>
			</tr>
		</table>
	</form>
	<table align="center" style="width: 500px; border: 2px solid grey;" cellspacing="10" cellpadding="1" bgcolor="lightblue">
		<tr>
			<td colspan="2" align="center"><strong>Your Upcoming Bookings</strong></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<?php
				$query = "SELECT * FROM bookings WHERE username = '".$_SESSION['staffUsername']."' ORDER BY start_time";
				
				$results = $db->query($query);
				
				$today = date("Y-m-d H:i:s");
				
				$upcomingBookingsCount = 0;
				
				while ($row = $results->fetch_assoc())
				{
					if($row['end_time'] > $today)
					{
						echo '<td>'.$row['start_time']." - ".$row['end_time'].", Room ".$row['room_num'].' - '.'<a href="cancelStaffBooking.php?booking_id='.$row['booking_id'].'" onclick="return confirm(\'Are you sure you want to cancel this booking?\');">Cancel</tr>';
						$upcomingBookingsCount++;
					}
				}
				
				if($upcomingBookingsCount > 0)
				{
					?>
					<tr>
						<td colspan="2" align="center">
							<a href="calendarExport.php" align="center"><strong>Calendar Export</strong></a></td>
					</tr>
					<?php
				}
			?>

</body>
</html>