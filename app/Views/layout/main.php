<?php
require_once __DIR__ . '/partials/header.php';
?>
<div class="wrapper">
  <div class="main">
    <?php require_once __DIR__ . '/partials/navbar.php'; ?>

    <main class="content px-3 py-4">
      <?= $content ?>
    </main>
  </div>


  <?php require_once __DIR__ . '/partials/footer.php'; ?>