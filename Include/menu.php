<?php $pagina = substr($_SERVER["SCRIPT_FILENAME"], strrpos($_SERVER["SCRIPT_FILENAME"], '/') +1);?> 
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="index.php") echo'active';?>" href="index.php">
              <span data-feather="home"></span>
              Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="aziende.php"||$pagina=="aziende-dettaglio.php") echo'active';?>" href="aziende.php">
              <span data-feather="briefcase"></span>
              Aziende
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="classi.php" || $pagina=="classi-dettaglio.php") echo'active';?>" href="classi.php">
              <span data-feather="list"></span>
              Classi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="docenti.php"||$pagina=="docenti-dettaglio.php") echo'active';?>" aria-current="page" href="docenti.php">
              <span data-feather="user"></span>
              Docenti
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="segretario.php"||$pagina=="segretario-dettaglio.php") echo'active';?>" href="segretario.php">
              <span data-feather="inbox"></span>
              Segretari
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="studenti.php"||$pagina=="studenti-dettaglio.php" || $pagina=="report-attivita.php") echo'active';?>" href="studenti.php?classe=4AII&anno=2021/2022">
              <span data-feather="users"></span>
              Studenti
            </a>
          </li>
          <?php /*
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="report.php") echo'active';?>" href="report.php">
              <span data-feather="file"></span>
              Report
            </a>
          </li>
          */?>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="periodo-stage.php") echo'active';?>" href="periodo-stage.php">
              <span data-feather="calendar"></span>
              Periodi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?php if($pagina=="crediti.php") echo'active';?>" href="crediti.php">
              <span data-feather="award"></span>
             About us
            </a>
          </li>
        </ul>

        <?php /*
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Reports Preferiti</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Documentazione PCTO
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Fogli ore
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Compensi Tutor
            </a>
          </li>
		  <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Convenzioni Aziende
            </a>
          </li>
        </ul>
        */
        ?>
      </div>
    </nav>