<?php

namespace App\Core;

use PDO;
use PDOException;

class Database
{
  private static ?PDO $pdo = null;


  public static function connect()
  {
    if (self::$pdo === null) {
      $host = $_ENV['DB_HOST'];
      $db = $_ENV['DB_BANCO'];
      $usuario = $_ENV['DB_USUARIO'];
      $senha = $_ENV['DB_SENHA'];
      $porta = $_ENV['DB_PORTA'];

      $dsn = "mysql:host={$host};port={$porta};dbname={$db};charset=utf8mb4";

      try {
        self::$pdo = new PDO($dsn, $usuario, $senha);

        self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        self::$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
      } catch (PDOException $e) {
        die("Erro de conexão: " . $e->getMessage());
      }
    }
    return self::$pdo;
  }
}
