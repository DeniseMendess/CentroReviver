<?php

namespace App\Core;

class Controller
{
  // carregar o arquivo da model
  public function model(string $model)
  {
    $classe = "App\\Models\\{$model}";

    if (!class_exists($classe)) {
      throw new \Exception("Model '{$model}' não encontrado.");
    }

    return new $classe();
  }


  // carregar o arquivo view
  public function view(string $view, array $dados = [])
  {
    $arquivo = APP . "/Views/{$view}.php";

    if (!file_exists($arquivo)) {
      http_response_code(404);
      require APP . "/Views/errors/404.php";
      exit;
    }

    extract($dados);

    require $arquivo;
  }


  // carregar a view com layout
  public function renderLayout(string $view, array $dados = [])
  {
    $arquivo = APP . "/Views/{$view}.php";

    if (!file_exists($arquivo)) {
      http_response_code(404);
      $this->renderLayout('errors/404');
      exit;
    }

    extract($dados);
    ob_start();
    require $arquivo;
    $content = ob_get_clean();

    require APP . "/Views/layout/main.php";
  }


  // carregar a view sem layout
  public function renderView(string $view, array $dados = [])
  {
    $arquivo = APP . "/Views/{$view}.php";

    if (!file_exists($arquivo)) {
      http_response_code(404);
      require APP . "/Views/errors/404.php";
      exit;
    }

    extract($dados);

    require APP . "/Views/layout/partials/header.php";
    require $arquivo;
    require APP . "/Views/layout/partials/footer.php";
  }


  // css específico da página
  protected array $styles = [];

  // adicionando o css
  protected function addStyle(string $style)
  {
    if (!in_array($style, $this->styles, true)) {
      $this->styles[] = $style;
    }
  }


  // js específico da página
  protected array $scripts = [];

  // adicionando o js
  protected function addScript(string $script)
  {
    if (!in_array($script, $this->scripts, true)) {
      $this->scripts[] = $script;
    }
  }
}
