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

$sql = "SELECT * FROM Supplier";
$result = mysqli_query($conn, $sql);

echo "<center> Below are all the Suppliers partnered with JEMS INC, along with their contact information. </center><br>";

echo "<center><table border='1'>
<tr>
<th>Supplier name</th>
<th>Address</th>
<th>Phone</th>
</tr>";
if($result)
{	
	while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
	{
		echo "<tr>";
		echo "<td>" . $row['SName'] . "</td>";
		echo "<td>" . $row['Address'] . "</td>";
		echo "<td>" . $row['PHONE'] . "</td>";
		echo "</tr>";
	}
	
}
echo "</table><br>";
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