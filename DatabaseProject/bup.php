</style></head>
<head>
<h1><center> Welcome to JEMS INC </center> </h1></head>
<hr><b><center>FIND THE BEST DEALS FOR ALL YOUR JEWERLY NEEDS</center></b><hr>
<center> <p><b> Joseph Nasr, Eddie Rayo, Moses Merugus, Shadi Elkhatib</center>
</b>

<?php
$hostName = "localhost";
$userName = "root";
$password = "";
$dbName = "JEMS";

$conn=mysqli_connect($hostName, $userName, $password)
or die("Unable to connect to host $hostName");

mysqli_select_db($conn, $dbName) or die("Unable to select database $dbName");

$sql = "CREATE TABLE Customer_BUP LIKE Customer";


echo "<center> This Script drops any backup tables in the database and saves a new one with current database records. </center><br>";

?>


<button onclick="goBack()">Go Back</button>

<script>
function goBack() {
    window.history.back();
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