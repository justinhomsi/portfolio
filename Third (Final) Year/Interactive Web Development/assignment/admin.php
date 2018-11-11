<?php
	session_start();
	include 'databaseConnect.php';
	
	if(!isset($_SESSION['adminUsername']) || $_SESSION['adminUsername'] == '')
	{
		header('Location: index.php');
		exit;
	}
	
	include 'BackLogout.php';
?>
<html>
<head>
	<title>Admin Homepage</title>
</head>
<body>
	<h1 align="center">Admin Homepage</h1>
	<?php
		echo '<h4 align="center">Welcome, '.$_SESSION['adminUsername'].'</h4><br><br>';
	?>
	<center><table align="center" style="width: 500px; padding-left: 80px; border: 2px solid darkblue;" cellspacing="10" cellpadding="1" bgcolor="lightblue"></center>
		<h3 align="center">Admin Options</h3>
		<form name="listRooms" method="get" action="listRooms.php">
			<tr>
				<td>
				<input style="margin: 5px 5px;" align="center" type="submit" name="submitListAllRooms" value="List All Rooms"></td>
		</form>
		<form name="listStaff" method="get" action="listStaff.php">
			<td>
			<input style="margin: 5px 5px;" type="submit" name="submitListAllStaff" value="List All Staff"></td>
			</tr>
		</form>
		<form name="manageRooms" method="get" action="manageRooms.php">
			<tr>
				<td>
				<input style="margin: 5px 5px;" type="submit" name="submitManageRooms" value="Manage Rooms"></td>
		</form>
		<form name="manageRoomTypes" method="get" action="manageRoomTypes.php">
			<td>
			<input style="margin: 5px 5px;" type="submit" name="submitManageRoomTypes" value="Manage Room Types"></td>
			</tr>
		</form>
		<form name="viewLogs" method="get" action="viewLogs.php">
			<tr>
				<td>
				<input style="margin: 5px 5px;" type="submit" name="submitViewLogs" value="View Logs"></td>
			</tr>
	</table>
</body>
</html>