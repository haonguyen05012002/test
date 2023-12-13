<?php
// Turn off all error reporting
error_reporting(0);

// the sinhviendal file
require_once 'ebook.php';

// message to return
$message = array();

$dal = new ebook();

switch($_GET["action"])
{
	case 'getall':
		$message ="Y333333333333333Y";
		break;
	
	case 'insert':
		$ten = $_GET["ten_dangnhap"];
		$matkhau = $_GET["mat_khau"];
		$result = $dal->insert($ten, $matkhau);
		$message = ["message" => json_encode($result)];
		break;
		
	case 'insertsome':
		$data = $_GET["data"];
		$result = $dal->insertsome($data);
		$message = ["message" => json_encode($result)];
		break;
	
	case 'delete':
		$ten = $_GET["ten_dangnhap"];
		$result = $dal->delete($ten);
		$message = ["message" => json_encode($result)];
		break;
	
	case 'update':
		$ten = $_GET["ten_dangnhap"];
		$matkhau = $_GET["mat_khau"];
		$email=$_GET["email"];
		$result = $dal->update($ten, $email,$matkhau);
		$message = ["message" => json_encode($result)];
		break;
	case 'dangnhap':
		 $ten = $_GET["ten_dangnhap"];
		 $matkhau = $_GET["mat_khau"];
		$result = $dal->dangnhap("$ten","$matkhau");
		$message = ["message" => json_encode($result)];
		break;	

	default:
		$message = ["message" => "Unknown method " . $_GET["action"]];
		break;
}

//The JSON message
header('Content-type: application/json; charset=utf-8');

// //Clean (erase) the output buffer
ob_clean();
// var_dump($message);
echo json_encode($message);

