<?php
// the dbconnection file
require_once 'dbebook.php';

class ebook{
	/**
	 * Lấy danh sách sinh viên
	 *
	 * @param none
	 * @return array[] Danh sách sinh viên
	 */
	public function getAll()
	{
		$dbebook = new DBebook();
		$conn = $dbebook->getebook();
		$query = 'SELECT *  FROM nguoidung';
		$list = array();
		$result = $conn->query($query);
		while ($row = $result->fetch_assoc())
		{
			$list[] = $row;
		}
		return $list;
	}
	
	/**
	 * Thêm 1 sinh viên vào CSDL
	 *
	 * @param integer masv	Mã sinh viên
	 * @param string tensv	Tên sinh viên
	 * @return true/false	Kết quả thực hiện câu sql
	 */
	function insert($ten, $matkhau)
	{
		$dbConnection = new DBebook();
		$conn = $dbConnection->getebook();
		$query = 'INSERT INTO nguoidung (ten_dangnhap, mat_khau, admin) VALUES(?, ?, ?)';
		$ad = 0;
		$stmt = $conn->prepare($query);
		$stmt->bind_param("ssi", $ten, $matkhau, $ad);
		return $stmt->execute();
	}
	
	
	/**
	 * Thêm nhiều sinh viên vào CSDL
	 *
	 * @param string data	Chuỗi JSON chứa thông tin của các sinh viên cần thêm
	 * @return int	Số dòng thêm thành công
	 */
	function insertsome($data)
	{
		$result = 0;
		$dbConnection = new DBebook();
		$conn = $dbConnection->getebook();
		$query = 'INSERT INTO nguoidung (ten_dangnhap,mat_khau) VALUES (?,?)';
		$arrebook = json_decode($data, TRUE);
		
		foreach ($arrebook as $ebook) {
			var_dump($ebook);
			$stmt = $conn->prepare($query);
			$stmt->bind_param("is", $ebook["ten_dangnhap"],  $ebook["mat_khau"]);
			if ($stmt->execute()) $result++;
		}
		return $result;
	}
	
	/**
	 * Xóa 1 sinh viên
	 *
	 * @param integer masv	Mã sinh viên
	 * @return true/false	Kết quả thực hiện câu sql
	 */
	function delete($ten)
	{
		$dbebook = new DBebook();
		$conn = $dbebook->getebook();
		$query = 'DELETE FROM nguoidung WHERE ten_dangnhap = ?';
		$stmt = $conn->prepare($query);
		$stmt->bind_param("is", $ten);
		return $stmt->execute();
	}
	
	/**
	 * Cập nhật 1 sinh viên
	 *
	 * @param integer masv	Mã sinh viên
	 * @param string tensv	Tên sinh viên
	 * @return true/false	Kết quả thực hiện câu sql
	 */
	function update( $email,$matkhau,$ten)
	{
		$dbConnection = new DBebook();
		$conn = $dbConnection->getebook();
		$query = 'UPDATE nguoidung SET email = ?,mat_khau=? WHERE ten_dangnhap = ?';
		$stmt = $conn->prepare($query);
		$stmt->bind_param("is", $email, $matkhau,$ten);
		return $stmt->execute();
	}


	function dangnhap($ten, $matkhau)
	{
		$dbConnection = new DBebook();
		$conn = $dbConnection->getebook();
	
		if ($conn->connect_error) {
			return $conn->connect_error;
		}
	
		$query = 'SELECT * FROM nguoidung WHERE ten_dangnhap=? AND mat_khau=?';
		$stmt = $conn->prepare($query);
	
		if (!$stmt) {
			return "Lỗi câu truy vấn: " . $conn->error;
		}
	
		$stmt->bind_param('ss', $ten, $matkhau);
		$stmt->execute();
	
		if ($stmt->error) {
			return "Lỗi thực hiện câu truy vấn: " . $stmt->error;
		}
	
		$result = $stmt->get_result();
	
		if ($result->num_rows > 0) {
			// Đăng nhập thành công, có dữ liệu trả về
			return true;
		} else {
			// Đăng nhập thất bại, không có dữ liệu trả về
			return false;
		}
	}
	


}