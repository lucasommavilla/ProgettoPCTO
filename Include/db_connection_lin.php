<?php
$servername = "132.145.101.159";
$username = "pcto";
$password = "Ruize521";
$schema = "pcto";

// Create connection
$conn = new mysqli($servername, $username, $password, $schema);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>