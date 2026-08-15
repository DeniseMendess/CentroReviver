<?php

namespace App\Controllers;

use App\Core\Controller;

class HomeController extends Controller
{
  public function index()
  {
    $this->addStyle('home');
    $this->addScript('home');

    $this->renderView('home/index');
  }
}