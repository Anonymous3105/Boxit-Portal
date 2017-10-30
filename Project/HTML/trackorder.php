<html>
<head>
	<title>Tracking your Orders</title>
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
		var method = document.getElementById('method').value;
		var pickupdt = document.getElementById('pickupdt').value;



	         var fposition =[parseFloat(fromcityx),parseFloat(fromcityy)];

		var tposition=[parseFloat(tocityx),parseFloat(tocityy)];
		var pos=[[fposition[0]-100,fposition[1]-20]];
		pos[6]=[tposition[0]-100,tposition[1]-20];
		for(var m=1;m<6 ;m++)
		{
			var n =6-m;
			var x=(m*parseFloat(tposition[0]-100)+n*parseFloat(fposition[0]-100))/6;
			var y=(m*parseFloat(tposition[1]-20)+n*parseFloat(fposition[1]-20))/6;
			pos[m]=[x,y];
		}
		document.write("<div><img src='../images/worldmap.jpg' alt='The World Map' style='position: absolute;left: 0 px;top:0 px' >");
		for(var m=1;m<7;m++)
		{
		document.write("<img src='../images/plane.jpeg' width='20px' style='position: relative;left:"+pos[m][0]+";top:"+pos[m][1]+";'>");

		}
		document.write("</div>");
	</script>
	
	<?php include 'footer.php'; ?>
</body>
</html>