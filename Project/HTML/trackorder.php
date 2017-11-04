<html>
<head>
	<title>Tracking your Orders</title>
	<link rel="stylesheet" href="../CSS/topbar.css">
	<?php include 'session.php'; ?>
</head>
<body>
	<?php include 'topbar.php'; ?>
	<?php  
		$b = $_SESSION['orderid'];
		$conn = new mysqli("localhost", "root", "", "Boxitdb") or die("Error connecting to database");
		$sql = "SELECT fromcity,tocity FROM ORDERADDR WHERE orderid='$b'";
		$result = $conn->query($sql) or die("Error connecting to the Order table.");
		$row = $result->fetch_assoc();
		
		$sql = "SELECT pickupdt,method FROM ORDERTB WHERE orderid='$b'";
		$result1 = $conn->query($sql) or die("Error connecting to the Order table.");
		$row1 = $result1->fetch_assoc();

		$fromcity = $row['fromcity'];
		$tocity = $row['tocity'];
		
		$sql = "SELECT xcoord, ycoord FROM CITY WHERE name='$fromcity'";
		$fromcitycoord = ($conn->query($sql))->fetch_assoc();

		$sql = "SELECT xcoord, ycoord FROM CITY WHERE name='$tocity'";
		$tocitycoord = ($conn->query($sql))->fetch_assoc();
	?>

	<img src="../images/worldmap.jpg" alt="The World Map">

	
	<form style="display: none;">
		<input type="text" readonly name="fromcityx" id="fromcityx" value="<?php echo $fromcitycoord['xcoord'];?>">
		<input type="text" readonly name="fromcityy" id="fromcityy" value="<?php echo $fromcitycoord['ycoord'];?>">
		<input type="text" readonly name="tocityx" id="tocityx" value="<?php echo $tocitycoord['xcoord'];?>">
		<input type="text" readonly name="tocityy" id="tocityy" value="<?php echo $tocitycoord['ycoord'];?>">
		<input type="text" readonly name="method" id="method" value="<?php echo $row1['method'];?>">
		<input type="text" readonly name="pickupdt" id="pickupdt" value="<?php echo $row1['pickupdt'];?>">
	</form>


	<script>
		var fromcityx = document.getElementById('fromcityx').value;
		var fromcityy = document.getElementById('fromcityy').value;
		var tocityx = document.getElementById('tocityx').value;
		var tocityy = document.getElementById('tocityy').value;
		var	method = document.getElementById('method').value;
		var	pickupdt = document.getElementById('pickupdt').value;


	</script>
	<?php include 'footer.php'; ?>
</body>
</html>