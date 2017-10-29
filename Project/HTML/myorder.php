<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>My Orders</title>
	<head><?php include'session.php' ?></head>
</head>
<body>
	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
	<?php
	include'topbar.php';
	
	if (isset($_POST['track'])) {
		$_SESSION['orderid'] = $_POST["selorderid"];
		header("Location:trackorder.php");		
	}
	if (isset($_POST['cancel'])) {
		$_SESSION['orderid'] = $_POST["selorderid"];
		header("Location:cancelorder.php");		
	}

	$server = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "Boxitdb";
	$a=$_SESSION['uname'];
	$err='';
	
	$conn = new mysqli($server, $username, $password, $dbname) or die("Error Connecting to the server.");

	$q = "SELECT orderid,pickupdt FROM ORDERTB WHERE custname = '$a'";
	$result=$conn->query($q) or die("Error connecting to the Order table of database");
	if($result->num_rows == 0){
		$err = "No Orders have been placed by you";
	}
	else{
		echo("<table border='1px'><tr><th>Selected Order</th><th>Order Id</th><th>Pickup Date</th><th>From</th><th>To</th></tr>");
		while($row = $result->fetch_assoc())
		{	
			$b=$row['orderid'];
			$q1="SELECT fromcity,tocity FROM ORDERADDR WHERE orderid='$b'";
			$result1=$conn->query($q1) or die('Error connecting to the Orderaddr table of the database.');
			$row1=$result1->fetch_assoc();
			echo "<tr>";
			echo "<td> <input type='radio' name='selorderid' value='$b' /> </td>";
			echo "<td>".$row['orderid']."</td>";
			echo "<td>".$row['pickupdt']."</td>";
			echo "<td>".$row1['fromcity']."</td>";
			echo "<td>".$row1['tocity']."</td>";
			echo"</tr>";
		}
		echo "<tr>";	
		echo "<td colspan='2'> <input type='submit' value='Track' name='track'> </td>";
		echo "<td colspan='2'> <input type='submit' value='Cancel' name='cancel'> </td>";
		echo "</tr>";
		echo("</table>");
	}
	echo($err);

	$conn->close();
	?>
	</form>
</body>
</html>
