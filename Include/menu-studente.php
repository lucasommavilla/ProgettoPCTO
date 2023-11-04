<?php $pagina = substr($_SERVER["SCRIPT_FILENAME"], strrpos($_SERVER["SCRIPT_FILENAME"], '/') +1);?> 
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="home-studente.php") echo'active';?>" href="home-studente.php">
              <span data-feather="home"></span>
              Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="home-studente-doc-personali.php") echo'active';?>" href="home-studente-doc-personali.php">
              <span data-feather="file-text"></span>
              Documenti pre-compilati
            </a>
          </li>
          <?php
          /*
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="home-studente-doc-generali.php") echo'active';?>" aria-current="page" href="home-studente-doc-generali.php">
              <span data-feather="file"></span>
              Documentazione generale
            </a>
          </li>
          */
          ?>
        </ul>
      </div>
    </nav>