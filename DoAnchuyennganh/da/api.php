<?php

error_reporting(0);

require_once 'BookDAL.php';

$message = array();

$dal = new BookDAL();

switch ($_POST["action"]) {
    case 'getall':
        $message = $dal->getAllBooks();
        break;

    case 'insert':
        $id_sach = $_POST["id_sach"];
        $tieu_de = $_POST["tieu_de"];
        $result = $dal->insertBook($id_sach, $tieu_de);
        $message = ["message" => json_encode($result)];
        break;

    case 'insertsome':
        $data = $_POST["data"];
        $result = $dal->insertSomeBooks($data);
        $message = ["message" => json_encode($result)];
        break;

    case 'delete':
        $id_sach = $_POST["id_sach"];
        $result = $dal->deleteBook($id_sach);
        $message = ["message" => json_encode($result)];
        break;

    case 'update':
        $id_sach = $_POST["id_sach"];
        $tieu_de = $_POST["tieu_de"];
        $result = $dal->updateBook($id_sach, $tieu_de);
        $message = ["message" => json_encode($result)];
        break;

    default:
        $message = ["message" => "Unknown method " . $_POST["action"]];
        break;
}

header('Content-type: application/json; charset=utf-8');

ob_clean();

echo json_encode($message);
