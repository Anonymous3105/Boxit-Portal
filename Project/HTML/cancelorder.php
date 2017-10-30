<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cancellation</title>
<?php 
	$msg = "";
	include'session.php';
	$orderid = $_SESSION['orderid'];
	$conn = new mysqli("localhost","root","","Boxitdb") or die('Error connecting to DB');
	$q = "SELECT pickupdt FROM ordertb WHERE orderid='$orderid'";
	$result = $conn->query($q);
	$row = $result->fetch_assoc();
	$q1 = "SELECT NOW() as NOW";
	$result1 = $conn->query($q1);
	$row1 = $result1->fetch_assoc();
	if($row1['NOW'] > $row['pickupdt']){
		$msg = "Sorry Shipping has been initiated cannot cancel";
	}
	else{
		$q2 = "DELETE FROM ordertb WHERE orderid='$orderid'";
		$q3 = "DELETE FROM orderaddr WHERE orderid='$orderid'";
		$conn->query($q3);
		$conn->query($q2);
		$msg = "Cancellation successful";
		sleep(5);
		header("Location:homepage.php");
	}
	$conn->close();
 ?>
</head>
<body>
	<?php include'topbar.php'; ?>
	<b><?php echo "$msg"; ?></b>
</body>
</html>