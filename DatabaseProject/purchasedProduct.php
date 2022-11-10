</style></head>
<head>
<h1><center> Welcome to JEMS INC </center> </h1></head>
<hr><b><center>FIND THE BEST DEALS FOR ALL YOUR JEWERLY NEEDS</center></b><hr>
<center> <p><b> Joseph Nasr, Eddie Rayo, Moses Merugus, Shadi Elkhatib </center>
</b>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <th colspan="2"><img class = "one" src="img/rubynecklace.png" width="700" height="430" /></th>
  </tr>
</table>
<?php
$hostName = "localhost";
$userName = "root";
$password = "";
$dbName = "JEMS";

$conn=mysqli_connect($hostName, $userName, $password)
or die("Unable to connect to host $hostName");

mysqli_select_db($conn, $dbName) or die("Unable to select database $dbName");

$sql = "SELECT Name FROM Customer AS C, Member AS M, Makes_Order AS MO, Products_Contained AS PC WHERE C.Customer_ID = M.CID AND C.Customer_ID = MO.CID AND MO.TID = PC.TID AND PC.PrName = 'NoSparkle Ruby Necklace'; ";
$result = mysqli_query($conn, $sql);

echo "<br><center> Below are the customers who have purchased the NoSparkle Ruby Necklace. </center><br>";

echo "<center><table border='1'>
<tr>
<th>Customer name</th>
</tr>";
if($result)
{	
	while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
	{
		echo "<tr>";
		echo "<td>" . $row['Name'] . "</td>";
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