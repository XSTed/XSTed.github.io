<?php
require_once('session.php');
$conn = new Dbhandler();

if (isset($_GET['Username']) && $_GET['Username'] != "") {
    $State = "1";
    $username = $_GET['Username']; 
    $Authcode = $_GET['Authcode']; 

    $sql = "UPDATE members SET State = ? WHERE Username = ? AND Authcode = ?";
    $stmt = $conn->conn()->prepare($sql);

    if (!$stmt) {
        die("Error in preparing the SQL statement: " . $conn->conn()->error);
    }

    $stmt->bind_param("sss", $State, $username, $Authcode);
    $stmt->execute();

    $deleteGoTo = "index.php";
    if (isset($_SERVER['QUERY_STRING'])) {
        $deleteGoTo .= (strpos($deleteGoTo, '?')) ? "&" : "?";
        $deleteGoTo .= $_SERVER['QUERY_STRING'];
    }
    header(sprintf("Location: %s", $deleteGoTo));
}
?>