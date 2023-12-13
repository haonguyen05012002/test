<?php

require_once 'dbconnection.php';

class BookDAL {
    /**
     * Get all books from the database
     *
     * @return array[] List of books
     */
    public function getAllBooks() {
        $dbConnection = new DBConnection();
        $conn = $dbConnection->getConnection();
        $query = 'SELECT id_sach, tieu_de FROM sach';
        $bookList = array();
        $result = $conn->query($query);
        while ($row = $result->fetch_assoc()) {
            $bookList[] = $row;
        }
        return $bookList;
    }

    /**
     * Insert a book into the database
     *
     * @param integer $id_sach Book ID
     * @param string $tieu_de Title of the book
     * @return true/false Result of the SQL query execution
     */
    public function insertBook($id_sach, $tieu_de) {
        $dbConnection = new DBConnection();
        $conn = $dbConnection->getConnection();
        $query = 'INSERT INTO sach (id_sach, tieu_de) VALUES (?, ?)';
        $stmt = $conn->prepare($query);
        $stmt->bind_param("is", $id_sach, $tieu_de);
        return $stmt->execute();
    }

    /**
     * Insert multiple books into the database
     *
     * @param string $data JSON string containing information of books to be added
     * @return int Number of successfully added rows
     */
    public function insertSomeBooks($data) {
        $result = 0;
        $dbConnection = new DBConnection();
        $conn = $dbConnection->getConnection();
        $query = 'INSERT INTO sach (id_sach, tieu_de) VALUES (?, ?)';
        $arrBooks = json_decode($data, TRUE);

        foreach ($arrBooks as $book) {
            $stmt = $conn->prepare($query);
            $stmt->bind_param("is", $book["id_sach"], $book["tieu_de"]);
            if ($stmt->execute()) $result++;
        }
        return $result;
    }

    /**
     * Delete a book from the database
     *
     * @param integer $id_sach Book ID
     * @return true/false Result of the SQL query execution
     */
    public function deleteBook($id_sach) {
        $dbConnection = new DBConnection();
        $conn = $dbConnection->getConnection();
        $query = 'DELETE FROM sach WHERE id_sach = ?';
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $id_sach);
        return $stmt->execute();
    }

    /**
     * Update a book in the database
     *
     * @param integer $id_sach Book ID
     * @param string $tieu_de Title of the book
     * @return true/false Result of the SQL query execution
     */
    public function updateBook($id_sach, $tieu_de) {
        $dbConnection = new DBConnection();
        $conn = $dbConnection->getConnection();
        $query = 'UPDATE sach SET tieu_de = ? WHERE id_sach = ?';
        $stmt = $conn->prepare($query);
        $stmt->bind_param("si", $tieu_de, $id_sach);
        return $stmt->execute();
    }
}
