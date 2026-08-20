<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- ---------- favicon ---------- -->
  <link rel="shortcut icon" href="<?= URL ?>/assets/img/favicon.ico">
  <!-- ---------- bootstrap ---------- -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- ---------- remixicon ---------- -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.9.1/fonts/remixicon.min.css">
  <!-- ---------- estilos da página ---------- -->
  <link rel="stylesheet" href="<?= URL ?>/assets/css/global.css">
  <!-- ---------- css específico ---------- -->
  <?php foreach ($this->styles as $style): ?>
    <link rel="stylesheet" href="<?= URL ?>/assets/css/pages/<?= $style ?>.css">
  <?php endforeach; ?>
  <title><?= APP_NOME ?></title>
</head>

<body>