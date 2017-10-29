<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>My Account</title>
	<?php 
	include'session.php';
	$a = $_SESSION['uname'];
	$conn = new mysqli("localhost","root","","boxitdb") or die("Error connecting to DB");
	$q = "SELECT * FROM user WHERE username='$a'";
	$result = $conn->query("$q") or die("Error executing query");
	$row=$result->fetch_assoc();
	$err="";
	if (isset($_POST['changepass'])){
		$q1="SELECT password FROM login WHERE username='$a'";
		$cpass = $_POST['cpass'];
		$npass = $_POST['npass'];
		$rpass = $_POST['rpass'];
		if($rpass != $npass)
			$err = "Please retype New password properly";
		$result1=$conn->query($q1) or die("Error getting current password");
		$row1=$result1->fetch_assoc();
		if($cpass==$row1['password']){
			if($err == ""){
				$q2="UPDATE `login` SET `password`= '$npass' WHERE username='$a'";
				$conn->query($q2);
			}
		}
		else{
			$err ="Invalid Current Password";
		}
	}
	$conn->close();
	?>
	<script type="text/javascript">
    function check(password) {
        var password_strength = document.getElementById("password_strength");
 
        //TextBox left blank.
        if (password.length == 0) {
            password_strength.innerHTML = "";
            return;
        }
 
        //Regular Expressions.
        var regex = new Array();
        regex.push("[A-Z]"); //Uppercase Alphabet.
        regex.push("[a-z]"); //Lowercase Alphabet.
        regex.push("[0-9]"); //Digit.
        regex.push("[$@$!%*#?&]"); //Special Character.
 
        var passed = 0;
 
        //Validate for each Regular Expression.
        for (var i = 0; i < regex.length; i++) {
            if (new RegExp(regex[i]).test(password)) {
                passed++;
            }
        }
 
        //Validate for length of Password.
        if (passed > 2 && password.length > 8) {
            passed++;
        }
 
        //Display status.
        var color = "";
        var strength = "";
        switch (passed) {
            case 0:
            case 1:
                strength = "Weak";
                color = "red";
                break;
            case 2:
                strength = "Good";
                color = "darkorange";
                break;
            case 3:
            case 4:
                strength = "Strong";
                color = "green";
                break;
            case 5:
                strength = "Very Strong";
                color = "darkgreen";
                break;
        }
        password_strength.innerHTML = strength;
        password_strength.style.color = color;
    }
</script>
</head>
<body>
	<?php
	include'topbar.php';
	echo"<table>
	<tr>
	<td>Name</td>
	<td>".$row['name']."</td>
	</tr>
	<tr>
	<td>Username</td>
	<td>".$row['username']."</td>
	</tr>
	<tr>
	<td>Email</td>
	<td>".$row['email']."</td>
	</tr>
	<tr>
	<td>Mobile Number</td>
	<td>".$row['mobno']."</td>
	</tr>
	<tr>
	<td>Permanent Address</td>
	<td>".$row['paddr']."</td>
	</tr>
	</table>";
	?>
	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method = 'post'>
		<?php 
		echo"
		<table>
		<tr>
		<th colspan='2'>Change Password</th>
		</tr>
		<tr>
		<td>Current Password</td>
		<td><input type='password' name='cpass' required></td>
		</tr>
		<tr>
		<td>New Password</td>
		<td><input type='password' name='npass' required onkeyup='check(this.value)'></td>
		<td id='password_strength'></td>
		</tr>
		<tr>
		<td>Retype New Password</td>
		<td><input type='password' name='rpass' required></td>
		</tr>
		<tr>
		<td>$err</td>
		</tr>
		<tr>
		<td colspan='2'><input type='submit' name ='changepass' value='Change'></td>
		</tr>
		</table>
		</form>";
		include"footer.php";
		?>
	</body>
	</html>