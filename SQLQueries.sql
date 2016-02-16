<?php

$firstname = 'Sady';
$lastname  = 'Jones';


$query = sprintf("SELECT FirstName, LastName, PhoneNumber, EmailAddress, FROM Music_Fillin_Instrumentalists 
    WHERE firstname='%s' AND lastname='%s'",
    mysql_real_escape_string($firstname),
    mysql_real_escape_string($lastname));


$result = mysql_query($query);


if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}


mysql_free_result($result);



?>

<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "Music_Fillin_Instrumentalists";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id, firstname, lastname FROM PianoFillins";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
     // output data of each row
     while($row = $result->fetch_assoc()) {
         echo "<br> id: ". $row["id"]. " - Name: ". $row["firstname"]. " " . $row["lastname"] . "<br>";
     }
} else {
     echo "0 results";
}

$conn->close();
?>  

<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "MusicFillinInstrumentalists";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "UPDATE PianoFillins SET LastName='Doe' WHERE LastName=Jones";

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>

//found on w3schools