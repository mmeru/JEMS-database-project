</style></head>
<head>
<h1><center> Welcome to JEMS INC </center> </h1></head>
<hr><b><center>FIND THE BEST DEALS FOR ALL YOUR JEWERLY NEEDS</center></b><hr>
<center> <p><b> Joseph Nasr, Eddie Rayo, Moses Merugus, Shadi Elkhatib </center>
</b>
<?php
$hostName = "localhost";
$userName = "root";
$password = "";
$dbName = "JEMS";

$conn=mysqli_connect($hostName, $userName, $password)
or die("Unable to connect to host $hostName");

mysqli_select_db($conn, $dbName) or die("Unable to select database $dbName");

# both sql queries will show the correct data. The one used is showing the data from the View
# $sql = "SELECT Pname, Manufacturer, SUM(Number_of_products) AS UNITS_SOLD FROM Product AS P, Products_contained AS PC 
# WHERE P.Pname = PC.PrName GROUP BY Pname HAVING SUM(Number_of_products) > 10;"; 

$sql = "SELECT * FROM Products_With_GT10_Sold;";
$result = mysqli_query($conn, $sql);

echo "<center> Manufacturers below have sold their product more than 10 times. </center><br>";

echo "<center><table border='1'>
<tr>
<th>Product Name</th>
<th>Manufacturer</th>
<th>Units Sold</th>
</tr>
</center>";
if($result)
{	
	while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
	{
		echo "<tr>";
		echo "<td>" . $row['Pname'] . "</td>";
		echo "<td>" . $row['Manufacturer'] . "</td>";
		echo "<td>" . $row['UNITS_SOLD'] . "</td>";
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