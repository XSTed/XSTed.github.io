<?php 

class Signup extends Dbhandler
{
  protected function setUser($username, $pwd, $email, $privilegeLevel = 0, $attempt = 3, $Authcode)
  {
    $sql = "INSERT INTO Members (Username, Password, Email, PrivilegeLevel, Attempt, RegisteredDate, Authcode) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $this->conn()->prepare($sql);

    $hashedPwd = password_hash($pwd, PASSWORD_DEFAULT);
    $stmt->bind_param("sssssss", $username, $hashedPwd, $email, $privilegeLevel, $attempt, $registerDate = date("Y-m-d"), $Authcode);

    if (!$stmt->execute()) {
      header("location: ../signup.php?error=stmtfailed");
      exit();
    }
    /*Warning: mysqli_stmt::execute() expects exactly 0 parameters, 1 given
      This warning occurs when you pass an array of parameters to the execute() method of 
      a prepared statement, but the statement does not expect any parameters.
      To fix this warning, you need to make sure that the number of parameters passed to the execute() method 
      matches the number of placeholders in your SQL statement.
      */
   
    // get member id
    $sql = "SELECT MemberID FROM Members where Username = '$username';";
    $result = $this->conn()->query($sql) or die("<p>*MemberID error, please try again!</p>");

    $row = $result->fetch_assoc();
    $memberID = $row["MemberID"];

    // create cart
    $sql = "INSERT INTO Orders(MemberID) VALUES ($memberID);";
    $this->conn()->query($sql) or die("<p>*Cart creation error, please try again!</p>");

    $stmt->close();


  }

  protected function checkUser($username, $email)
  {
    $sql = "SELECT Username FROM Members WHERE Username = ? 
      OR Email = ?;";
    $stmt = $this->conn()->stmt_init();

    if (!$stmt->prepare($sql)) {
      header("location: ../login.php?error=stmtfailed");
      exit();
    }

    $stmt->bind_param("ss", $username, $email);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) return $row;
    else return false;

    $stmt->close();
  }
}
