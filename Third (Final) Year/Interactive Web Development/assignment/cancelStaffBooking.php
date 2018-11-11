<?php
session_start();
include 'databaseConnect.php';

if(!isset($_SESSION['staffUsername']) || $_SESSION['staffUsername'] == '')
{
	header('Location: index.php');
	exit;
}

if(isset($_GET['booking_id']))
{
	$query = "DELETE FROM bookings WHERE username='".$_SESSION['staffUsername']."' AND booking_id='".$_GET['booking_id']."'";
	
	$results = $db->query($query);
	
	echo 'Booking Cancelled Successfully<br><br>';
	echo '<a href="javascript: history.back();">Back</a>';
}