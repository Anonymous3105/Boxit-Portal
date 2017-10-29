<?php 
	session_start();
	if(isset($_POST["logout"])){
		unset($_SESSION["uname"]);
		session_destroy();
		session_unset();
		header("Location:Login.php");
	}
 ?>

<html>
<head>
	<link rel="stylesheet" href="../CSS/topbar.css">
</head>
<body>
	<div id="topbardiv">
		<ul id="topbar">
			<li class="topitems"><a href="homepage.php">Home</a></li>
			<li class="topitems"><a href="placeorder.php">Place Order</a></li>
			<li class="topitems"><a href="myorder.php">Manage Orders</a></li>
			<li class="topitems"><a href="manageaccount.php">Manage Account</a></li>
			<li class="topitems" id="logout"><a href="logout.php">Logout</a></li>
			<li class="topitems" id="logas">Logged in as: <?php echo $_SESSION["uname"]; ?></li>
		</ul>
	</div>	
</body>
</html>