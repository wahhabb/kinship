<!doctype html>
<html lang="en" id="top-of-site">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title><?php echo $title ?></title>
<link rel="stylesheet" href="css/main.css">
<header>
<h1><?php echo $title ?></h1>
<nav role="navigation">
  <ul>
    <li><a href="#">Events</a></li>
    <li><a href="group_list.php">Groups</a>
      <ul class="dropdown">
        <li><a href="group_list.php">List Groups</a></li>
        <li><a href="group_add.php">Add a Group</a></li>
        <li><a href="#">Sub-3</a></li>
      </ul>
    </li>
    <li><a href="#">About Us</a></li>
  </ul>
</nav>
</header>
<main>
<?php
$servername = "162.241.218.208";
$username = "algyvwmy_ks_admi";
$password = "dONxfTuFkoru5pb2z1";
$dbname = "algyvwmy_kinship";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>
