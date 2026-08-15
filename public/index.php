<?php

session_start();

use App\Core\Router;
use Dotenv\Dotenv;

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../app/configuracao.php';

$dotenv = Dotenv::createUnsafeImmutable(dirname(__DIR__));
$dotenv->load();


new Router;
