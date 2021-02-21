<?php
require 'includes/head.php';

// This function will run within each post array including multi-dimensional arrays
function ExtendedAddslash(&$params){
    foreach($params as &$var){
        // check if $var is an array. If yes, it will start another ExtendedAddslash() function to loop to each key inside.
        is_array($var) ? ExtendedAddslash($var) : $var=addslashes($var);
    }
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
        "INSERT INTO `ACTIONGROUP` (`Name`, `Description`, Website, MissionStatement,
        ResourcesNeeded, OrgType, ContactPerson, ContactEmail, ContactPhone,
        TextOK, Address1, Address2, City, StateProvince, PostalCode, Country)
        VALUES ('$pName', '$pDescription', '$pWebsite', '$pMissionStatement', 
        '$pResourcesNeeded', '$pOrgType', '$pContactPerson', '$pContactEmail', '$pContactPhone', 
        '$pTextOK', '$pAddress1', '$pAddress2', '$pCity', '$pStateProvince', '$pPostalCode', '$pCountry');";

        // echo $sql; // for testing
    
    if (! $conn->query($sql))
        echo("Got an Error!! --" . $conn->error);
    else
        echo "<p><b>SUCCESS! </b>Entry for " . $pName . " successfully added.</p><p></p>";
}    

?>

<form action="group_add.php" method="post">
<p>Fields marked with an asterisk <span style="color:red;">*</span> are required.</p>
<ul>
<li>
    <label for="pname">Organization Name: <span>*</span></label>
    <input type="text" name="pName" name="pName" required />
</li>
<li>
    <label for="pname">Description: <span>*</span></label>
    <input type="text" name="pDescription" name="pDescription" required />
</li>
<li>
    <label for="pname">Website: <span>*</span></label>
    <input type="text" name="pWebsite" name="pWebsite" required />
</li>
<li>
    <label for="pname">Mission Statement: <span>*</span></label>
    <textarea id="pMissionStatement" name="pMissionStatement" ></textarea>
</li>
<li>
    <label for="pname">Resources Needed: <span>*</span></label>
    <textarea type="text" id="pResourcesNeeded" name="pResourcesNeeded" ></textarea>
</li>
<li>
    <label for="pname">Organization Type: <span>*</span></label>
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
    <label for="pname">Contact Person: </label>
    <input type="text" name="pContactPerson" name="pContactPerson" />
</li>
<li>
    <label for="pname">Contact Email: </label>
    <input type="email" id="pContactEmail" name="pContactEmail" />
</li>
<li>
    <label for="pname">Contact Phone: </label>
    <input type="tel" id="pContactPhone" name="pContactPhone" />
</li>
<li>
    <label for="pname">Text OK?: <span>*</span></label>
    <select id="pTextOK" name="pTextOK">
        <option value="">--se choose an option--</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
        <option value="Hybrid (online and in person)>Hybrid (online and in person)"</option>
    </select>
</li>
<li>
    <label for="pname">Address: <span>*</span></label>
    <input type="text" name="pAddress1" required />
</li>
<li>
    <label for="pname">Address Line 2: </label>
    <input type="text" name="pAddress2" />
</li>
<li>
    <label for="pname">City: <span>*</span></label>
    <input type="text" name="pCity" required />
</li>
<li>
    <label for="pname">State or Province: <span>*</span></label>
    <input type="text" name="pStateProvince" required />
</li>
<li>
    <label for="pname">Postal Code: <span>*</span></label>
    <input type="text" name="pPostalCode" required />
</li>
<li>
    <label for="pname">Country: <span>*</span></label>
    <input type="text" name="pCountry" required />
</li>
<li class="form-button">
    <input type="submit" />
</li>
</ul>
</form>


<?php
require 'includes/foot.php';
?>