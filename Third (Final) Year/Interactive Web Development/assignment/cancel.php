<?php
	session_start();
	include 'databaseConnect.php';
	
	include 'BackLogout.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}

	
	if(isset($_GET['booking_id']))
	{
		
		$roomNumberQuery = "SELECT * FROM bookings WHERE booking_id='".$_GET['booking_id']."'";
		
		$roomNumberResults = $db->query($roomNumberQuery);
		
		$query = "DELETE FROM bookings WHERE booking_id='".$_GET['booking_id']."'";
	
		$results = $db->query($query);
		
		while($row = $roomNumberResults->fetch_assoc())
		{
			$ipAddress = $_SERVER['REMOTE_ADDR'];
			$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['adminUsername']." deleted a booking for ".$row['room_num']."')";
			$logResults = $db->query($logQuery);
		}
		
		echo '<br>Booking Cancelled Successfully<br><br>';
	}
	
	if(isset($_GET['room_num']))
	{
		$bookingQuery = "SELECT * FROM bookings WHERE room_num='".$_GET['room_num']."'";
		
		$bookingReults = $db->query($bookingQuery);
		
		if($bookingReults->num_rows > 0)
		{
			$deleteBookingQuery = "DELETE FROM bookings WHERE room_num='".$_GET['room_num']."'";
			
			$deleteBookingResults = $db->query($deleteBookingQuery);
			
			$query = "DELETE FROM rooms WHERE room_num='".$_GET['room_num']."'";
			
			$results = $db->query($query);
			
			$ipAddress = $_SERVER['REMOTE_ADDR'];
			$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['adminUsername']." deleted room ".$_GET['room_num']."')";
			$logResults = $db->query($logQuery);
			
			echo '<br>Room and its bookings successfully deleted<br><br>';
		}
		else
		{
			$query = "DELETE FROM rooms WHERE room_num='".$_GET['room_num']."'";
		
			$results = $db->query($query);
			
			$ipAddress = $_SERVER['REMOTE_ADDR'];
			$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['adminUsername']." deleted room ".$_GET['room_num']."')";
			$logResults = $db->query($logQuery);
		
			echo '<br>Room successfully deleted<br><br>';
		}
		

	}
	
	if(isset($_GET['room_type_id']))
	{
		$roomTypeQuery = "SELECT * FROM rooms WHERE room_type_id='".$_GET['room_type_id']."'";
		
		$roomTypeResults = $db->query($roomTypeQuery);
		
		if($roomTypeResults->num_rows > 0)
		{
			echo '<p>Room type cannot be deleted, it is in use by rooms</p>';
		}
		else
		{
			$query = "DELETE FROM room_types WHERE room_type_id='".$_GET['room_type_id']."'";
		
			$results = $db->query($query);
		
			echo '<br>Room type successfully deleted<br><br>';
		}

	}
?>