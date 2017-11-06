<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>BOXiT-Contact Us</title>
	<link rel="stylesheet" href="../CSS/addons.css">
	<script>
		function ValidateEmail()
		{
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(document.contactform.email.value.match(mailformat))
			{
				return true;
			}
			else
			{
				window.alert("You have entered an invalid email address!");
				return false;
			}
		}
		function phonenumber()
		{
			var phonenum = /^\d{10}$/;
			if(document.contactform.phoneno.value.match(phonenum))
			{
				return true;
			}
			else
			{
				alert("Enter a valid phone number without country code");
				return false;
			}
		}
		function validate(form) {
			ValidateEmail();
			phonenumber();
		}

	</script>
</head>
<body style="background-color: white; color: black;">
	<fieldset align="center" style="background-color: purple;"><img src="../images/Boxitlogo.jpg" alt="Boxit Logo" width="200px"></fieldset>
	<table width="100%"><tr><td style="font-size: 25px; font-weight: bolder; font-family: Trebuchet MS; width: 100%;text-align: center; background-color: #5481c9; color: white;">Contact Us</td></tr></table>
	<p style="font-family: Helevetica;font-size: 18px; font-weight: lighter;" >Feel free to contact us.</p>

	<form action="contact.php" name="contactform" method="post" align="center">
		<center>
		<fieldset style="float: left; text-align: center; margin: 0 30%;">
			<legend>Contact Us:</legend>
			<table align="center" width="50%" cellspacing="4px">
				<tr bgcolor="white">
					<td><input type="text" name="name" placeholder ="Full name" style="border-color: black; width: 95%;" required="required" /></td>
					<td><input type="text" name="isdcode" value="+91" style="width:10%;border-color: black;" required="required"/>&nbsp;<input type="text" name="phoneno" placeholder ="Phone Number" style="border-color: black;width:80%;" required="required"/></td>
				</tr>
				<tr>
					<td ><input type="text" name="email" placeholder ="Email ID" style="border-color: black;width: 95%;" required="required" /></td>
					<td style="width: 300px;"><input type="text" name="subject" placeholder ="Subject" style="border-color: black;width:95%;" required="required"/></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="message" placeholder="Messages" rows="10%" cols="66%" style="border-color: black; border-width: 2px;" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="submit" value="-->" style="float: right;background-color:#b50087; color: white; font-weight: bolder; font-size: 20px;" onclick="validate(this.form)"></td>
				</tr>
			</table>
		</fieldset>
	</center>
	</form>
</body>
</html>
