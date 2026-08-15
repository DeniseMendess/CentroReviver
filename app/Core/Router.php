<?php

namespace App\Core;

use App\Controllers\ErrorController;

class Router
{
  private $controlador = 'HomeController';
  private $metodo = 'index';
  private $parametros =  [];


  public function __construct()
  {
    try {
      $url = $this->url();

      // Controlador
      if (isset($url[0]) && !empty($url[0])) {
        $controller = ucfirst($url[0]) . 'Controller';

        if (class_exists("App\\Controllers\\{$controller}")) {
          $this->controlador = $controller;
          unset($url[0]);
        } else {
          $this->error404();
        }
      }

      $classe = "App\\Controllers\\{$this->controlador}";
      $this->controlador = new $classe;


      // Método
      if (isset($url[1]) && !empty($url[1])) {
        if (method_exists($this->controlador, $url[1])) {
          $this->metodo = $url[1];
          unset($url[1]);
        } else {
          $this->error404();
        }
      }


      // Parâmetros
      $this->parametros = array_values($url);

      call_user_func_array(
        [$this->controlador, $this->metodo],
        $this->parametros
      );
    } catch (\Throwable $e) {
      $this->error500();
    }
  }


  private function url(): array
  {
    $url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);

    if (!$url) return [];

    return explode('/', trim($url, '/'));
  }


  // Erro 500
  private function error404()
  {
    (new ErrorController())->error404();
    exit;
  }


  // Erro 500
  private function error500()
  {
    (new ErrorController())->error500();
    exit;
  }
}
