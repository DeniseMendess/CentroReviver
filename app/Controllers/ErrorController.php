<?php

namespace App\Controllers;

use App\Core\Controller;

class ErrorController extends Controller
{
  public function error403()
  {
    http_response_code(403);
    $this->renderView('errors/403');
  }


  public function error404()
  {
    $this->addStyle('404');

    http_response_code(404);
    $this->renderView('errors/404');
  }


  public function error500()
  {
    $this->addStyle('500');

    http_response_code(500);
    $this->renderView('errors/500');
  }
}
