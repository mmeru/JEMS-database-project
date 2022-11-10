</style></head>
<head>
<h1><center> Welcome to JEMS INC </center> </h1></head>
<hr><b><center>FIND THE BEST DEALS FOR ALL YOUR JEWERLY NEEDS</center></b><hr>
<center> <p><b> Joseph Nasr, Eddie Rayo, Moses Merugus, Shadi Elkhatib</center>
</b>
<body>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <th colspan="2"><img class = "one" src="img/chokernecklace.png" width="700" height="430" /></th>
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

$sql = "UPDATE Product SET Amount_in_Stock = 2 WHERE Pname = 'Platinum Bracelet';";
$result = mysqli_query($conn, $sql);


// then display procurement table
$sql = "Select * FROM Procurement;";
$result = mysqli_query($conn, $sql);

echo "<br><center> Below is the trigger when product is too low. </center><br>";
echo "<center><table border='1'>
<tr>
<th>Product</th>
<th>Product Manufacturer</th>
<th>Action</th>
<th>Quantity</th>
<th>Date Of Request</th>
</tr>";
if($result)
{	
	while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
	{
		echo "<tr>";
		echo "<td>" . $row['Product_Name'] . "</td>";
		echo "<td>" . $row['Product_Manufacturer'] . "</td>";
		echo "<td>" . $row['Action'] . "</td>";
		echo "<td>" . $row['Quantity'] . "</td>";
		echo "<td>" . $row['Date_of_Request'] . "</td>";
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