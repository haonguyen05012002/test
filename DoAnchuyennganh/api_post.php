<?php
// Turn off all error reporting
error_reporting(0);

// the sinhviendal file
require_once 'sinhviendal.php';

// message to return
$message = array();

$dal = new ebook();

switch($_POST["action"])
{
	case 'getall':
		$message = $dal->getAll();
		break;
	
	case 'insert':
		$ten = $_POST["ten_nguoidung"];
		$matkhau = $_POST["mat_khau"];
		$result = $dal->insert($ten, $matkhau);
		$message = ["message" => json_encode($result)];
		break;
		
	case 'insertsome':
		$data = $_POST["data"];
		$result = $dal->insertsome($data);
		$message = ["message" => json_encode($result)];
		break;
	
	case 'delete':
		$ten = $_POST["ten_dangnhap"];
		$result = $dal->delete($ten);
		$message = ["message" => json_encode($result)];
		break;
	
	case 'update':
		$ten = $_POST["ten_dangnhap"];
		$matkhau = $_POST["mat_khau"];
		$email=$_POST["email"];
		$result = $dal->update($ten,$email, $matkhau);
		$message = ["message" => json_encode($result)];
		break;

	default:
		$message = ["message" => "Unknown method " . $_POST["action"]];
		break;
}

//The JSON message
header('Content-type: application/json; charset=utf-8');

//Clean (erase) the output buffer
ob_clean();

echo json_encode($message);

