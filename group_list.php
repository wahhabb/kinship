<?php
  $title = "Kinship Groups List";
 require 'includes/head.php';
 $sql = "SELECT * from KGroup;";
 $result = $conn->query($sql);

 $issueNames = [];
 $issueDescs = [];
 $sql2 = "SELECT * FROM Issue;";
 $result2 = $conn->query($sql2);
 while($row = $result2->fetch_assoc()) {
     array_push($issueNames, $row["Name"]);
     array_push($issueDescs, $row["Description"]);
 }
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
    "<li><b>Contact Person:</b> " . $row["ContactPerson"] .
      "<ul>" . 
      "<li><b>Email:</b> " . $row["ContactEmail"] . "</li>" . 
      "<li><b>Phone:</b> " . $row["ContactPhone"] . "</li>" . 
      "<li><b>Text OK?:</b> " . $row["TextOK"] . "</li>" . 
     "</ul></li>" . 
     "<li><b>Address:</b> " . $row["Address1"] . "</li>" . 
     ($row["Address2"] ? "<li> " . $row["Address2"] . "</li>" : "") . 
     "<li><b>City:</b> " . $row["City"] . " <b>State/Province:</b> " . $row["StateProvince"] . 
     " <b>Postal Code:</b> " . $row["PostalCode"] . " <b>Country:</b> " . $row["Country"] . "</li>" . 
     "<h3>Issue or Affinity</h3>" .
     '<li class="checkboxlist clearfix">';

     $checkedIssues = [];
     $sql3 = "Select IssueName from GroupIssue where GroupName = '" . $row["Name"] . "';";
     $result3 = $conn->query($sql3);
    // echo "!!!! " . $conn->error . '****<br>';
    // echo $result3->num_rows . '<br>';
      while($row3 = $result3->fetch_assoc()) {
          array_push($checkedIssues, $row3["IssueName"]);
      }
   $i = 0;
      foreach ($issueNames as $issueName) {
          echo '<div><input type="checkbox" id="iss_' . $issueName 
          . '" name="iss_' . $issueName 
          . '" value="iss_' . $issueName . '"';
          if (in_array($issueName, $checkedIssues)) {
            echo ' checked ';
          }
          echo '> <label class="cbox" for="iss_' .  $issueName 
          . '">' . $issueName .  "</label></div>";
      }
     echo "</li><br /></ul>";
    }
} else {
  echo "No entries found";
}
$conn->close();
echo "End of table";
require 'includes/foot.php';
?>

