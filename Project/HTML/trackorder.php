<html>
<head>
	<title>Tracking your Orders</title>
	<?php include 'session.php'; ?>
</head>
<body>
	<?php include 'topbar.php'; ?>
	<?php  
		$b = $_SESSION['orderid'];
		$conn = new mysqli("localhost", "root", "root", "Boxitdb") or die("Error connecting to database");
		$sql = "SELECT fromcity,tocity FROM ORDERADDR WHERE orderid='$b'";
		$result = $conn->query($sql) or die("Error connecting to the Order table.");
		$row = $result->fetch_assoc();
		
		$sql = "SELECT pickupdt,method FROM ORDERTB WHERE orderid='$b'";
		$result1 = $conn->query($sql) or die("Error connecting to the Order table.");
		$row1 = $result->fetch_assoc();




	?>
	<?php include 'footer.php'; ?>
</body>
</html>