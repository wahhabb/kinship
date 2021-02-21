<?php
 require 'includes/head.php';
 $sql = "SELECT * from ACTIONGROUP;";
 $result = $conn->query($sql);

 echo "<p>Found " . $result->num_rows . " organizations.</p>";

 if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "<h2>Organization: " . $row["Name"] . "</h2><ul>" .
    "<li><b>Description:</b> " . $row["Description"] . "</li>" .
    "<li><b>Website:</b> " . $row["Website"] . "</li>" .
    "<li><b>Mission:</b> " . $row["MissionStatement"] . "</li>" . 
    "<li><b>Resources Needed:</b> " . $row["ResourcesNeeded"] . "</li>" . 
    "<li><b>Type of Organization:</b> " . $row["OrgType"] . "</li>" . 
    "<li><b>Type of Organization:</b> " . $row["OrgType"] . "</li>" . 
    "<li><b>Contact Person:</b> " . $row["ContactPerson"] .
      "<ul>" . 
      "<li><b>Email:</b> " . $row["ContactEmail"] . "</li>" . 
      "<li><b>Phone:</b> " . $row["ContactPhone"] . "</li>" . 
     "</ul></li>" . 
     "<li><b>Address:</b> " . $row["Address1"] . "</li>" . 
     ($row["Address2"] ? "<li> " . $row["Address2"] . "</li>" : "") . 
     "<li><b>City:</b> " . $row["City"] . " <b>State/Province:</b> " . $row["StateProvince"] . 
     " <b>Postal Code:</b> " . $row["PostalCode"] . " <b>Country:</b> " . $row["Country"] . "</li>" . 
     "</ul>";
  }
} else {
  echo "0 results";
}
$conn->close();
echo "End of table";
require 'includes/foot.php';
?>

