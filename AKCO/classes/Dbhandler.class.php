<?php
class Dbhandler
{
  private $host;
  private $user;
  private $pass;
  private $db;
  public $conn;

  public function __construct()
  {
    $this->connect();
  }

  private function connect()
  {
    
    $this->host = "127.0.0.1";
    $this->user = "root";
    $this->pass = "12345678";
    $this->db = "akco";

    // connect to db
    $this->conn = new mysqli($this->host, $this->user, $this->pass, $this->db);

    /* check connection */
    if (!$this->conn) {
      die("Connection failed: " . mysqli_connect_error());
    }

    return $this->conn;
  }

  public function conn()
  {
    // connect to db
    $this->conn = new mysqli("127.0.0.1", "root", "12345678", "akco");
    return $this->conn;

    /* check connection */
    if (!$this->conn)
      die("Connection failed: " . mysqli_connect_error());
  }
}
