<?php
require("Include/db_connection.inc");  
?>


<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <button class="navbar-toggler  d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="home-studente.php"><img src="Images/iconaplanck.ico" width="10%" height="10%">  ITIS Max Planck</a>
  <form class="container-fluid justify-content-end" method="POST" action="">
    <a class="nav-link px-3" href="pagina-utente.php">
      <img src="Images/user.png" width="30">
    </a>
  </form>
</nav>