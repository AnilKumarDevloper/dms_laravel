<?php
try{ 
$servername = "dmsserverdb.mysql.database.azure.com";
$username = "dms_main_db";
$password = "Ddt@0909";
$dbname = "dms_final_db";
echo "Hello World! fdf";
// // Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}else{
  $sql = "SELECT * FROM users";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "id: " . $row["id"]. " - Name: " . $row["name"]. "<br>";
    }
  } else {
    echo "0 results";
  }
  $conn->close();
  echo "Connected successfully to the database";
}
}catch(Exception $e){
    echo "Error: " . $e->getMessage();
}
?>
