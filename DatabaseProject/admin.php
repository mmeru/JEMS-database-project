</style></head>
<head>
<h1><center> Welcome to JEMS INC </center> </h1></head>
<hr><b><center>FIND THE BEST DEALS OF ALL YOUR JEWERLY NEEDS</center></b><hr>
<center> <p><b> Joseph Nasr, Eddie Rayo, Moses Merugus, Shadi Elkhatib </center>
</b>

<?php
echo "<center> Admins can choose to backup or restore their database if required. </center><br>";

?>

<button onclick="window.location.href='homepage.php'">Go Back</button>
<button onclick="backUpDB()">Back Up Database</button>
<button onclick="restoreDB()">Restore Database</button>

<script>
function backUpDB()
{
	// this will output a back up file called JEMS_BUP.sql which will be then used to restore if needed
	<?php
	$hostName = "localhost";
	$userName = "root";
	$password = "";
	$dbName = "JEMS";

	define("BACKUP_PATH", "C:/xampp/htdocs");
	$date_string   = date("Ymd");
	$cmd = "C:\\xampp\\mysql\\bin\\mysqldump -u root JEMS > JEMS_BUP.sql";
	exec($cmd);
?>
}

function restoreDB() 
{
	<?php
		$hostName = "localhost";
		$userName = "root";
		$password = "";
		$dbName = "JEMS";

		define("BACKUP_PATH", "C:/xampp/htdocs");
		$date_string   = date("Ymd");
		$cmd = "C:\\xampp\\mysql\\bin\\mysql -u root JEMS < JEMS_BUP.sql";
		exec($cmd);
	?>
}
</script>

<html>
<head>
<body bgcolor="76C7FF">
<hr>

</fieldset>
</div>
</body>
</html>