<?php

namespace App\Helpers;

class Auth
{
  /* -------------------- Verifica se usuário está logado -------------------- */
  public static function Logado()
  {
    return !empty($_SESSION['usuario']);
  }


  /* -------------------- Retorna todos os dados do usuário -------------------- */
  public static function usuario()
  {
    if (!self::Logado()) {
      return null;
    }

    return $_SESSION['usuario'] ?? null;
  }


  /* -------------------- Retorna o ID do usuário -------------------- */
  public static function id()
  {
    return $_SESSION['usuario']['id'] ?? null;
  }


  /* -------------------- Retorna o Nome do usuário -------------------- */
  public static function nome(): ?string
  {
    return $_SESSION['usuario']['nome'] ?? null;
  }


  /* -------------------- Retorna o Email do usuário -------------------- */
  public static function email(): ?string
  {
    return $_SESSION['usuario']['email'] ?? null;
  }


  /* -------------------- Retorna o Cargo do usuário -------------------- */
  public static function cargo(): ?string
  {
    return $_SESSION['usuario']['cargo'] ?? null;
  }


  /* -------------------- Retorna o Tipo/ID do usuário -------------------- */
  public static function tipoUsuario(): ?int
  {
    return $_SESSION['usuario']['tipoUsuario'] ?? null;
  }


  /* -------------------- Retorna as Permissões do usuário -------------------- */
  public static function permissoes(): array
  {
    return $_SESSION['usuario']['permissoes'] ?? [];
  }


  /* -------------------- Verifica se usuário pussui determinada permissão -------------------- */
  public static function can(string $permissao)
  {
    if (!self::Logado()) {
      return false;
    }

    return in_array(
      $permissao,
      self::permissoes(),
      true
    );
  }


  /* -------------------- Exige o usuário estar logado -------------------- */
  public static function requireLogin()
  {
    if (!self::Logado()) {
      $_SESSION['erro'] = 'Faça login para continuar';

      header("Location: /login/entrar");
      exit;
    }
  }


  /* -------------------- Exige o usuário estar logado e ter determinada permissão -------------------- */
  public static function requirePermission(string $permissao)
  {
    self::requireLogin();

    if (!self::can($permissao)) {
      header("Location: /errors/403");
      exit;
    }
  }


  /* -------------------- Desloga, encerra a sessão do usuário -------------------- */
  public static function logout()
  {
    $_SESSION = [];

    if (ini_get('session.use_cookies')) {
      $params = session_get_cookie_params();

      setcookie(
        session_name(),
        '',
        time() - 42000,
        $params['path'],
        $params['domain'],
        $params['secure'],
        $params['httponly']
      );
    }
    session_destroy();
  }
}
