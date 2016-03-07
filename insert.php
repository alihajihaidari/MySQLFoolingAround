<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "root", "demo");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
// Escape user inputs for security
$FirstName = mysqli_real_escape_string($link, $_POST['FirstName']);
$LastName = mysqli_real_escape_string($link, $_POST['LastName']);
$PhoneNumber = mysqli_real_escape_string($link, $_POST['PhoneNumber']);
$EmailAddress = mysqli_real_escape_string($link, $_POST['EmailAddress']);
 
// attempt insert query execution
$sql = "INSERT INTO DrummerFillins (FirstName, LastName, PhoneNumber, EmailAddress) VALUES ('$FirstName', '$LastName', '$PhoneNumber', '$EmailAddress')";
if(mysqli_query($link, $sql)){
    echo "Records added successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
 
// close connection
mysqli_close($link);
?>