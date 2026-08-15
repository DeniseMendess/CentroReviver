</div>

<!-- ---------- bootstrap ---------- -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script src="<?= URL ?>/assets/libs/bootstrap/bootstrap.bundle.min.js"></script>
<!-- ---------- sweetalert2 ---------- -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<!-- script especifico da página -->
<?php foreach ($this->scripts as $script): ?>
  <script src="<?= URL ?>/assets/js/pages/<?= $script ?>.js"></script>
<?php endforeach; ?>

</body>

</html>