<?php 
require_once "class_autoloader.php";

if (isset($_POST["submit"])) {
  $username = $_POST["username"];
  $pwd = $_POST["pwd"];
  $repeatPwd = $_POST["repeat_pwd"];
  $email = $_POST["email"];
  $Authcode=$_POST["Authcode"];
  $mobile = $_POST['mobile'];
  $myzip = $_POST['myZip'] == '' ? NULL : $_POST['myZip'];
  $address = $_POST['address'] == '' ? NULL : $_POST['address'];

  $signup = new SignupContr($username, $pwd, $repeatPwd, $email, $Authcode);

  // Running error handlers and user signup 
  $signup->createUser();

  $conn = new Dbhandler();
  $sql = "SELECT MemberID FROM Members WHERE Username = '$username';";
  $result = $conn->conn()->query($sql) or die("<p>*MemberID error, please try again!</p>");
  
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      $memberID = $row['MemberID'];
      // Rest of your code here
    }
  } else {
    // Handle case when no rows are returned
    echo "<p>No MemberID found for the given username.</p>";
  }
  

  $insertsql = "INSERT INTO addbook (MemberID,setdefault,Username,mobile,myzip,address) VALUES ('" . $memberID . "','1','" . $username . "','" . $mobile . "','" . $myzip . "','" . $address . "')";
  $Result = $conn->conn()->query($insertsql) or die("<p>*AddBook error, please try again!</p>");


   //寄出認證信
   $Url = "http://localhost/akco/auth.php?Username=" . $username . "&Authcode=" . $Authcode;

   $mail = new PHPMailer(); //建立新物件
   $mail->SMTPOptions = array(
     'ssl' => array(
       'verify_peer' => false,
       'verify_peer_name' => false,
       'allow_self_signed' => true
     )
   );
   $mail->IsSMTP(); //設定使用SMTP方式寄信
   $mail->SMTPAuth = true; //設定SMTP需要驗證
   $mail->SMTPSecure = "ssl"; // Gmail的SMTP主機需要使用SSL連線
   $mail->Host = "smtp.gmail.com"; //Gamil的SMTP主機
   $mail->Port = 465;  //Gamil的SMTP主機的埠號(Gmail為465)。
   $mail->CharSet = "utf-8"; //郵件編碼

   $mail->Username = "txh12358@gmail.com"; //Gamil帳號
   $mail->Password = ""; //Gmail密碼  因上傳先砍掉

   $mail->From = "AKCOPracticeFullStackTech@gmail.com"; //寄件者信箱 一定要@XXX.com信箱格式
   $mail->FromName = "AK CO. Practice Full Stack Tech客服"; //寄件者姓名

   $mail->Subject = "AK CO. Practice Full Stack Tech歡迎您";  //郵件標題
   $mail->Body = $username . "你好!<br>"
     . "歡迎你在AK CO. Practice Full Stack Tech註冊<br>"
     . "若你沒有註冊請忽略這封認證信件<br>"
     . "<a href=" . $Url . ">"
     . "點一下這裡認證你的帳號 </a>";
   $mail->IsHTML(true); //郵件內容為html ( true || false)
   $mail->AddAddress($email);
   if (!$mail->Send()) {
     echo "發送錯誤: " . $mail->ErrorInfo;
   }
  header("location: ../index.php?error=none");
}

else
{
  header("location: ../signup.php");
  exit();
}