<?php
	// connect to database
	@ $db = new mysqli('localhost', 'root', '', 'assignment2');

	if (mysqli_connect_error())
	{
		echo 'Error connecting to database:<br />'.mysqli_connect_error();
		exit;
	}
?>