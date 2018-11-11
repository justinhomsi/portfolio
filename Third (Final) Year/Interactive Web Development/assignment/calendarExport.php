<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['staffUsername']) || $_SESSION['staffUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	header('Content-Type: text/calendar; charset=utf-8');
	header('Content-Disposition: attachment; filename= upcoming_bookings.ics');
	
	echo "BEGIN:VCALENDAR\r\nVERSION:2.0\r\nPRODID:-//ECU//CSG2431 Assignment 2//EN\r\nBEGIN:VTIMEZONE\r\nTZID:Perth\r\nBEGIN:STANDARD\r\nDTSTART:16010101T000000\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n";
	
	$query = "SELECT * FROM bookings WHERE username = '".$_SESSION['staffUsername']."' ORDER BY start_time";
	
	$results = $db->query($query);
	
	$today = date("Y-m-d H:i:s");
	
	$timestamp = date('Ymd\THis\Z');
	
	while ($row = $results->fetch_assoc())
	{
		if($row['end_time'] > $today)
		{
			echo "BEGIN:VEVENT\r\nSUMMARY:Booking for ".$_SESSION['name']."\r\nLOCATION:".$row['room_num']."\r\nDTSTART:".date('Ymd\THis\Z', strtotime($row['start_time']))."\r\nDTEND:".date('Ymd\THis\Z', strtotime($row['end_time']))."\r\nDTSTAMP:".$timestamp."\r\nUID:".md5(uniqid(mt_rand(), true))."\r\nEND:VEVENT\r\n";
		}
		
	}
	
	echo "END:VCALENDAR\r\n";
	

	
	
?>

