<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['staffUsername']) || $_SESSION['staffUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
	
	if(isset($_POST['submitBooking']))
	{
		$errorMessage = '';
		
		if(!isset($_POST['startDate']) || $_POST['startDate'] == '')
		{
			echo 'Error: Please enter a start date and try again.'.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
			
		}
		
		if(!isset($_POST['endDate']) || $_POST['endDate'] == '')
		{
			echo 'Error: Please enter an end date and try again.'.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
		}
		
		$room_num = $_POST['room_num'];
		$startDate = strtotime($_POST['startDate']);
		$endDate = strtotime($_POST['endDate']);
		
		$startDateYear = date('Y', $startDate);
		$startDateMonth = date('m', $startDate);
		$startDateDay = date('d', $startDate);
		
		$endDateYear = date('Y', $endDate);
		$endDateMonth = date('m', $endDate);
		$endDateDay = date('d', $endDate);
		
		$today = date("Y-m-d H:i:s");
		
		
		
		
		if(!checkdate($startDateMonth, $startDateDay, $startDateYear))
		{
			$errorMessage = 'Invalid start time, please try again<br>';
		}
		
		if(!checkdate($endDateMonth, $endDateDay, $endDateYear))
		{
			$errorMessage = 'Invalid end time, please try again<br>';
		}
		
		if(!$startDate > $today)
		{
			$errorMessage = 'Invalid start time, cannot be before current date and time<br>';
		}
		
		if(!$endDate > $startDate)
		{
			$errorMessage = 'Invalid end time, must be after the start time<br>';
		}
		
		$startDate = date("Y-m-d H:i:s", strtotime($_POST['startDate']));
		$endDate = date("Y-m-d H:i:s", strtotime($_POST['endDate']));
		$overlapQuery = "SELECT * FROM bookings WHERE room_num = '".$_POST['room_num']."' AND '".$startDate."' < end_time AND '".$endDate."' > start_time";
		$overlapResults = $db->query($overlapQuery);
		
		
		if($overlapResults->num_rows > 0)
		{
			$errorMessage = 'Unable to create booking, booking times overlap with an existing booking<br>';
		}
		
		$numberOfBookingsQuery = "SELECT * FROM bookings WHERE username='".$_SESSION['staffUsername']."' AND start_time > '".$today."'";
		$numberOfBookingsResult = $db->query($numberOfBookingsQuery);
		
		if($numberOfBookingsResult->num_rows >= 2)
		{
			$errorMessage = "Unable to create booking, you can only have up to two upcoming bookings";
		}
		
		if ($errorMessage != '')
		{
			echo 'Error: '.$errorMessage.' <a href="javascript: history.back();">Go Back</a>.';
			exit;
		}
		else
		{
			$query = "INSERT INTO bookings VALUES (booking_id, '".$_SESSION['staffUsername']."', '".$_POST['room_num']."', '".$startDate."', '".$endDate."')";
			
			$result = $db->query($query);
			
			if($result)
			{
				echo '<p>Booking successfully created</p>';
				$ipAddress = $_SERVER['REMOTE_ADDR'];
				$logQuery = "INSERT INTO logs VALUES (log_id, '".date("Y-m-d H:i:s")."', '".$ipAddress."', '".$_SESSION['staffUsername']." created a booking for'".$_POST['room_num']."')";
				$logResults = $db->query($logQuery);
			}
			else
			{
				echo '<p>Error creating booking. Error message:</p>';
				echo '<p>'.$db->error.'</p>';
			}
		}
	}