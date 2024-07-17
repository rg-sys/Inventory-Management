<?php
$dsn = "mysql:host=".DATABASE_HOST."; dbname=".DATABASE_NAME."";
$user = 'root';
$pass = 'root';

try {
	$pdo = new PDO($dsn,$user,$pass);
	$pdo->exec("set names utf8");
} catch (PDOException $e) {
	echo 'Connection error!' . $e->getMessage();
}

 ?>
