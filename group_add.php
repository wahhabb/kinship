<?php

// This function will run within each post array including multi-dimensional arrays
function ExtendedAddslash(&$params){
    foreach($params as &$var){
        // check if $var is an array. If yes, it will start another ExtendedAddslash() function to loop to each key inside.
        is_array($var) ? ExtendedAddslash($var) : $var=addslashes($var);
    }
}
function Deblank($str) {
    return str_replace(" ", "^^", $str);
}
function Reblank($str) {
    return str_replace("^^", " ", $str);
}

$title = "Enter a Kinship Group";
require 'includes/head.php';

$issueNames = [];
$issueDescs = [];
$sql2 = "SELECT * FROM Issue;";
$result = $conn->query($sql2);
while($row = $result->fetch_assoc()) {
    array_push($issueNames, $row["Name"]);
    array_push($issueDescs, $row["Description"]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Initialize ExtendedAddslash() function for every $_POST variable
    ExtendedAddslash($_POST);

    // The request is using the POST method
    $pName = $_POST['pName'];
    $pDescription = $_POST['pDescription'];
    $pWebsite = $_POST['pWebsite'];
    $pMissionStatement = $_POST['pMissionStatement'];
    $pResourcesNeeded = $_POST['pResourcesNeeded'];
    $pOrgType = $_POST['pOrgType'];
    $pContactPerson = $_POST['pContactPerson'];
    $pContactEmail = $_POST['pContactEmail'];
    $pContactPhone = $_POST['pContactPhone'];
    $pTextOK = $_POST['pTextOK'];
    $pAddress1 = $_POST['pAddress1'];
    $pAddress2 = $_POST['Apddress2'];
    $pCity = $_POST['pCity'];
    $pStateProvince = $_POST['pStateProvince'];
    $pPostalCode = $_POST['pPostalCode'];
    $pCountry = $_POST['pCountry'];
    
    $sql =
        "INSERT INTO `KGroup` (`Name`, `Description`, Website, MissionStatement,
        ResourcesNeeded, OrgType, ContactPerson, ContactEmail, ContactPhone,
        TextOK, Address1, Address2, City, StateProvince, PostalCode, Country)
        VALUES ('$pName', '$pDescription', '$pWebsite', '$pMissionStatement', 
        '$pResourcesNeeded', '$pOrgType', '$pContactPerson', '$pContactEmail', '$pContactPhone', 
        '$pTextOK', '$pAddress1', '$pAddress2', '$pCity', '$pStateProvince', '$pPostalCode', '$pCountry');";

        // echo $sql; // for testing
    
    if (! $conn->query($sql))
        echo("Got an Error!! --" . $conn->error);
    else {
        // print_r([$_POST['pName'], $_POST['iss_Air'], isset( $_POST['iss_' . $issueNames[0]])]);
        foreach ($issueNames as $issueName) {
            if ( $_POST[Deblank($issueName)] ) {
                $sql2 = "INSERT INTO GroupIssue (`GroupName`, `IssueName`) VALUES (" .
                "'" . $pName . "', " . "'" . $issueName . "');";
                if (! $conn->query($sql2))
                    echo("Got an Error!! --" . $conn->error);
            }
        }
        echo "<p><b>SUCCESS! </b>Entry for " . $pName . " successfully added.</p><p></p>";
    }
}    

?>

<h2>Kinship Wheels - Action Groups</h2>
<p>If you have formed a new wheel that is based on location or affinity/cause, or if 
    you have an organization or social action group you are already working with - please 
    fill out this form so that we can add it to our collaborative database</p>

<form action="group_add.php" method="post" id="add_group">
<p>Fields marked with an asterisk <span style="color:red;">*</span> are required.</p>
<ul>
<li>
    <label for="pname">Organization Name: <span>*</span></label>
    <input type="text" name="pName" name="pName" required />
</li>
<p>Please give the name of your wheel or action group</p>
<li>
    <label for="pDescription">Description: <span>*</span></label>
    <input type="text" name="pDescription" name="pDescription" required />
</li>
<li>
    <label for="pWebsite">Website: <span>*</span></label>
    <input type="text" name="pWebsite" name="pWebsite" required />
</li>
<li>
    <label for="pMissionStatement">Mission Statement: <span>*</span></label>
    <textarea id="pMissionStatement" name="pMissionStatement" ></textarea>
</li>
<li>
    <label for="pResourcesNeeded">Resources Needed or Requested: <span>*</span></label>
    <textarea type="text" id="pResourcesNeeded" name="pResourcesNeeded" ></textarea>
</li>
<p>What does your organization need &mdash; e.g. people with certain expertise,
    volunteers, funding, tools, furniture, etc.</p>
<li>
    <label for="pOrgType">Organization Type: <span>*</span></label>
    <select id="pOrgType"  name="pOrgType" >
        <option value="">--Please choose an option--</option>
        <option value="Local">Local</option>
        <option value="State-Province">State or Province</option>
        <option value="Regional">Regional</option>
        <option value="National">National</option>
        <option value="International">International</option>
    </select>
</li>
<li>
    <label for="pContactPerson">Contact Person: </label>
    <input type="text" name="pContactPerson" name="pContactPerson" />
</li>
<li>
    <label for="pContactEmail">Contact Email: </label>
    <input type="email" id="pContactEmail" name="pContactEmail" />
</li>
<li>
    <label for="pContactPhone">Contact Phone: </label>
    <input type="tel" id="pContactPhone" name="pContactPhone" />
</li>
<li>
    <label for="pTextOK">Text OK?: <span>*</span></label>
    <select id="pTextOK" name="pTextOK">
        <option value="">--Please choose an option--</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
        <option value="Hybrid (online and in person)">Hybrid (online and in person)</option>
    </select>
</li>
<li>
    <label for="pAddress1">Address: <span>*</span></label>
    <input type="text" name="pAddress1" required />
</li>
<li>
    <label for="pAddress2">Address Line 2: </label>
    <input type="text" name="pAddress2" />
</li>
<li>
    <label for="pCity">City: <span>*</span></label>
    <input type="text" name="pCity" required />
</li>
<li>
    <label for="pStateProvince">State or Province: <span>*</span></label>
    <input type="text" name="pStateProvince" required />
</li>
<li>
    <label for="pPostalCode">Postal Code: <span>*</span></label>
    <input type="text" name="pPostalCode" required />
</li>
<li>
    <label for="pCountry">Country: <span>*</span></label>
    <input type="text" name="pCountry" required />
</li>
<h3>Issue or Affinity</h3>
<li class="checkboxlist clearfix">
    <?php 
        $i = 0;
        foreach ($issueNames as $issueName) {
            echo '<div><input type="checkbox" id="' . $issueName 
            . '" name="' . Deblank($issueName)
            . '" value="' . $issueName 
            . '"> <label class="cbox" for="' .  $issueName 
            . '">' . $issueName .  "</label></div>";
        }
    ?>
</li>
<br />
<li class="form-button">
    <input type="submit" />
</li>
</ul>
</form>


<?php
require 'includes/foot.php';
?>