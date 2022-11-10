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

$sql = "SELECT Customer_name, Phone, ROUND(Customer_price*(1-Discount)*(1+Tax), 2) 
AS Amount_Payed FROM Orders AS O,
Products_Contained AS PC, Product AS P,  Exclusive_Products AS EP, Member AS M 
WHERE O.Transaction_ID = PC.TID AND PC.PrName = P.Pname AND P.Pname = EP.Pname 
AND EP.MID = M.Membership_ID AND PC.Prname = 'Choker Necklace' AND Size = 14";
$result = mysqli_query($conn, $sql);

echo "<br><center> Below are the Customer and their information to contact for the choker necklace recalll. </center><br>";
echo "<center><table border='1'>
<tr>
<th>Customer name</th>
<th>Phone Number</th>
<th>Amount Payed</th>
</tr>";
if($result)
{	
	while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
	{
		echo "<tr>";
		echo "<td>" . $row['Customer_name'] . "</td>";
		echo "<td>" . $row['Phone'] . "</td>";
		echo "<td>" . $row['Amount_Payed'] . "</td>";
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