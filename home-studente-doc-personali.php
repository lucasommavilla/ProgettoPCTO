<?php
//entry.php  
require("Include/db_connection.inc");
session_start();
if (!isset($_SESSION["username"])) {
  header("location:login.php?action=login");
}

?>
<!doctype html>
<html lang="en">

<head>
  <title>Reports</title>
  <?php require("Include/head-studente.php"); ?>
</head>

<body>

  <?php require("Include/navbar-studente.php"); ?>

  <div class="container-fluid">
    <div class="row">
      <?php require("Include/menu-studente.php"); ?>

      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <?php
        $nomeAzienda = "";
        $sql = 'select denominazione_azienda from azienda where id=' . $_SESSION["aziendaSelezionata"] . '';
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
          $row = $result->fetch_assoc();
          $nomeAzienda = htmlspecialchars($row["denominazione_azienda"]);
        }
        ?>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">Azienda <?php echo $nomeAzienda; ?> - Documenti</h1>
        </div>
        <p class="fs-5"><span data-feather="briefcase" class="align-baseline"></span> Da portare in azienda</p>
        <div class="row justify-content-start">
          <div class="col-auto mb-2">
            <button type="button" onclick="location.href='word/attestato.php'" name="indietro" value="" class="btn btn-outline-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 20 20">
                <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z" />
                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
              </svg>
              Attestato Frequenza
            </button>
          </div>
        </div>
        <div class="row justify-content-start">
          <div class="col-auto mb-2">
            <button type="button" onclick="location.href='word/firmaPresenze.php'" name="indietro" value="" class="btn btn-outline-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 20 20">
                <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z" />
                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
              </svg>
              Firma Presenze
            </button>
          </div>
        </div>
        <div class="row justify-content-start">
          <hr class="mt-2 mb-3" />
          <p class="fs-5"><span data-feather="home" class="align-baseline"></span> Da conservare a casa</p>
          <div class="col-auto mb-2">
            <button type="button" onclick="location.href='word/fascicoloPersonale.php'" name="indietro" value="" class="btn btn-outline-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 20 20">
                <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z" />
                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
              </svg>
              Fascicolo Personale
            </button>
          </div>
        </div>
        <div class="row justify-content-start">
          <div class="col-auto mb-2">
            <button type="button" onclick="location.href='word/progettoFormativo.php'" name="indietro" value="" class="btn btn-outline-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 20 20">
                <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z" />
                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
              </svg>
              Progetto Formativo
            </button>
          </div>
        </div>

        
        <div class="row justify-content-start">
          <hr class="mt-2 mb-3" />
          <p class="fs-5"><span data-feather="clipboard" class="align-baseline"></span> Da compilare finito il PCTO</p>
          <div class="col-auto mb-2">
            <button type="button" onclick="location.href='word/schedaValutazione.php?doc=precompilati'" name="indietro" value="" class="btn btn-outline-primary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 20 20">
                <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z" />
                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
              </svg>
              Scheda di Valutazione
            </button>
          </div>
        </div>



      </main>
    </div>
  </div>
  <?php require("Include/footer.php"); ?>
</body>

</html>