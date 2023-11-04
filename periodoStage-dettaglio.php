<?php  
   //entry.php
   require_once("Include/funz_admin.inc");
   require("Include/db_connection.inc");
   ?>  
<!doctype html>
<html lang="en">
  <head>
  <link rel="icon" href="dashboard/imm/logo.png" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="5DII 2021/2022">
    <title>Dettaglio Docente</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    

    <!-- Bootstrap core CSS -->
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="dashboard/dashboard.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

<script>
    function mostraAlert() {
        document.getElementById("hidden_elimina").value = 0;
        var idel = document.getElementById("persona");
        console.log(idel);
        var nome = document.getElementById("nomepersona").value;
        var cognome = document.getElementById("cognomepersona").value;
        var r = confirm('Sei sicuro di voler ELIMINARE il docente '+nome.toUpperCase()+' '+cognome.toUpperCase()+'?');
        if (r == true) {
            document.getElementById("hidden_elimina").value = 1;
        }
    }
</script>
    <!-- Custom styles for this template -->
    <link href="dashboard/dashboard.css" rel="stylesheet">
  </head>
  <body>
  
    <?php
    if (isset($_POST["elimina"])) {
      $id=$_GET["id"];
      //echo $id;
      $sql = "";
      $elimina = $_POST["hidden_elimina"];

      if ($elimina && $id != -1) {
          $sql = "delete from persona_ruolo where idpersona= ?";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param("i", $id);
          $stmt->execute();
          
          $sql = "delete from persona where id= ?";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param("i", $id);
          $stmt->execute();

          header("location:docenti.php");  
      }
  }
  if(isset($_POST["salva"])){
    //salvo dati persona
    if(isset($_GET["id"])){
      $id = $_GET["id"];
    }else{
      $id=-1;
    }
    
  $sql = "";
  if ($id != -1) {
      //se id!= -1 allora aggiorni i dati
      $sql = "update persona set";
      $sql .= " datanascita=?";
      $sql .= ", codicefiscale=?";
      $sql .= ", residenza=?";
      $sql .= ", indirizzo=?";
      $sql .= ", cognome=?";
      $sql .= ", nome=?";
      $sql .= ", cellulare=?";
      $sql .= ", telefono=?";
      $sql .= ", cap=?";
      $sql .= ", email=?";
      $sql .= ", sesso=?";
      $sql .= " where id=?";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("sssssssssssi", $_POST["datanascita"], $_POST["codicefiscale"], $_POST["residenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"], $_POST["cellulare"], $_POST["telefono"], $_POST["cap"], $_POST["email"], $_POST["sesso"],  $id);
      $stmt->execute();
      $result = $stmt->get_result();
    }else {
      //altrimenti inserisco nuovo persona
      // $sql = "INSERT into persona(datanascita, codicefiscale, residenza, indirizzo, cognome, nome, cellulare, telefono, cap, email, sesso) values(?,?,?,?,?,?,?,?,?,?,?)";
      $sql= "INSERT INTO `persona` (`datanascita`, `codicefiscale`, `residenza`, `indirizzo`, `cognome`, `nome`, `cellulare`, `telefono`, `cap`, `email`, `sesso`) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("sssssssssss", $_POST["datanascita"], $_POST["codicefiscale"], $_POST["residenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"], $_POST["cellulare"], $_POST["telefono"], $_POST["cap"], $_POST["email"], $_POST["sesso"]);
      $stmt->execute();
      $last_id = $conn->insert_id;
      $sql="INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES ('3', '".$last_id."');";
      $result = $conn->query($sql);
      header("location:docenti-dettaglio.php?id=".$last_id); 
    }
  }
        function generaDettaglioVisualizzazione($result){
          $nome = "";
          $cognome = "";
          $datanascita = "";
          $codicefiscale = "";
          $indirizzo = "";
          $residenza = "";
          $cellulare = "";
          $telefono = "";
          $email = "";
          $sesso = "";
          $cap = "";
          
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $nome = htmlspecialchars($row["nome"]);
                $cognome = htmlspecialchars($row["cognome"]);
                $datanascita = htmlspecialchars($row["datanascita"]);
                $codicefiscale = htmlspecialchars($row["codicefiscale"]);
                $indirizzo = htmlspecialchars($row["indirizzo"]);
                $residenza = htmlspecialchars($row["residenza"]);
                $cellulare = htmlspecialchars($row["cellulare"]);
                $telefono = htmlspecialchars($row["telefono"]);
                $email = htmlspecialchars($row["email"]);
                $sesso = htmlspecialchars($row["sesso"]);
                $cap = htmlspecialchars($row["cap"]);
            } 
            echo '
            <div class="justify-content-center">
            <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Dati anagrafici</p>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Nome</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly id="nomepersona" class="form-control" name="nome" value="'. $nome .'">
                  </div>
                  <label class="col-sm-3 col-md-1  col-form-label">Cognome</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly id="cognomepersona" class="form-control" name="cognome" value="'. $cognome .'">
                  </div>
              </div>

              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Data Nascita</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="date" readonly class="form-control" name="datanascita" value="'. $datanascita .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Codice Fiscale</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="codicefiscale" value="'. $codicefiscale .'">
                  </div>
              </div>

              <div class=" mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Sesso</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="sesso" value="'. $sesso .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label"></label>
                  <div class="col-sm-3 col-md-3">
                    
                  </div>
              </div>
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="phone"class="align-baseline"></span> Contatti</p>
              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Cellulare</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="cellulare" value="'. $cellulare .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Telefono</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="telefono" value="'. $telefono .'">
                  </div>
              </div>

              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Email</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="email" value="'. $email .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label"></label>
                  <div class="col-sm-3 col-md-3">
                    
                  </div>
              </div>
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="home"class="align-baseline"></span> Residenza</p>
              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Città</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="residenza" value="'. $residenza .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Indirizzo</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly class="form-control" name="indirizzo" value="'. $indirizzo .'">
                  </div>
              </div>
              <div class="mb-3 row">
                    <label class="col-sm-3 col-md-1 col-form-label">Cap</label>
                    <div class="col-sm-3 col-md-3">
                        <input type="text" readonly class="form-control" name="cap" value="'. $cap .'">
                    </div>
                    <label class="col-sm-3 col-md-1 col-form-label"></label>
                    <div class="col-sm-3 col-md-3">
                    </div>
              </div>
            </br>
            </br>
            </br>
            </br>'
            
                        ;
            }
        function generaDettaglioModifica($result){
          $nome = "";
          $cognome = "";
          $datanascita = "";
          $codicefiscale = "";
          $indirizzo = "";
          $residenza = "";
          $cellulare = "";
          $telefono = "";
          $email = "";
          $sesso = "";
          $cap = "";

          if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $nome = htmlspecialchars($row["nome"]);
            $cognome = htmlspecialchars($row["cognome"]);
            $datanascita = htmlspecialchars($row["datanascita"]);
            $codicefiscale = htmlspecialchars($row["codicefiscale"]);
            $indirizzo = htmlspecialchars($row["indirizzo"]);
            $residenza = htmlspecialchars($row["residenza"]);
            $cellulare = htmlspecialchars($row["cellulare"]);
            $telefono = htmlspecialchars($row["telefono"]);
            $email = htmlspecialchars($row["email"]);
            $sesso = htmlspecialchars($row["sesso"]);
            $cap = htmlspecialchars($row["cap"]);
          }
          echo '
            <div class="justify-content-center">
            <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Dati anagrafici</p>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Nome</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="80" required id="nomepersona" class="form-control" name="nome" value="'. $nome .'">
                  </div>
                  <label class="col-sm-3 col-md-1  col-form-label">Cognome</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="80" required id="cognomepersona" class="form-control" name="cognome" value="'. $cognome .'">
                  </div>
              </div>

              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Data Nascita</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="date" class="form-control" name="datanascita" value="'. $datanascita .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Codice Fiscale</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="16" class="form-control text-uppercase" name="codicefiscale" value="'. $codicefiscale .'">
                  </div>
              </div>

              <div class=" mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Sesso</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="1" class="form-control" name="sesso" value="'. $sesso .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label"></label>
                  <div class="col-sm-3 col-md-3">
                    
                  </div>
              </div>
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="phone"class="align-baseline"></span> Contatti</p>
              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Cellulare</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="13" class="form-control" name="cellulare" value="'. $cellulare .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Telefono</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="20" class="form-control" name="telefono" value="'. $telefono .'">
                  </div>
              </div>

              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Email</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="100" class="form-control" name="email" value="'. $email .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label"></label>
                  <div class="col-sm-3 col-md-3">
                    
                  </div>
              </div>
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="home"class="align-baseline"></span> Residenza</p>
              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Città</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="100" required class="form-control" name="residenza" value="'. $residenza .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Indirizzo</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" maxlength="100" class="form-control" name="indirizzo" value="'. $indirizzo .'">
                  </div>
              </div>
              <div class="mb-3 row">
                    <label class="col-sm-3 col-md-1 col-form-label">Cap</label>
                    <div class="col-sm-3 col-md-3">
                        <input type="text" maxlength="5" class="form-control" name="cap" value="'. $cap .'">
                    </div>
                    <label class="col-sm-3 col-md-1 col-form-label"></label>
                    <div class="col-sm-3 col-md-3">
                    </div>
              </div>
            </br>
            </br>
            </br>
            </br>';
        }
    ?>
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">

  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="index.php"><img src="dashboard/imm/logo.png" width="10%" height="10%"> ITIS Max Planck</a>
  
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Cerca" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="logout.php">Disconnettiti</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="index.php">
              <span data-feather="home"></span>
              Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="aziende.php">
              <span data-feather="briefcase"></span>
              Aziende
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page"href="docenti.php">
              <span data-feather="user"></span>
              Docenti
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="segretario.php">
              <span data-feather="calendar"></span>
              Segretari
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="studenti.php">
              <span data-feather="users"></span>
              Studenti
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="report.php">
              <span data-feather="file"></span>
              Report
			 </a>
          </li>
        </ul>

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
      </div>
    </nav>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
    <?php 
    if(isset($_GET["id"])){
      $id = $_GET["id"];
    
      $sql = 'Select nome, cognome from persona where id ='.$_GET["id"];
      $result = $conn->query($sql);
      if ($result->num_rows > 0) {
        $nriga = 0;
        $row = $result->fetch_assoc();
      //echo'<span data-feather="arrow-left"></span></a>';
      echo'
      <nav class="navbar">
        <div class="container-fluid">
        <p class="h2 mb-3"> Dettaglio del docente '.htmlspecialchars($row["nome"]).' '. htmlspecialchars($row["cognome"]).'</p>
        </div>
      </nav>
      '; 
      }else{
        echo '<h1 class="h2 mb-3">Attenzione: Docente inesistente</h1>';  
      }
      
    }else{
      echo '<h1 class="h2 mb-3">Aggiungi nuovo docente</h1>';  
    }
    ?>
        
    </nav>
    <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="hidden_elimina" id="hidden_elimina" value="0" />
    <?php
    if(isset($_GET["id"])){
      $id = $_GET["id"];
    
      $sql = 'Select * from persona where id ='.$_GET["id"];
      $result = $conn->query($sql);
      if(!isset($_POST["modifica"])){
          ?>  
            <div class="mb-4 clearfix">
                <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                  <div class="btn-group me-2" role="group" aria-label="First group">
                          <button type="button" onclick="location.href='docenti.php'" name="indietro" value="" class="btn btn-secondary">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                          </svg>
                          </button>
                  </div>
                  <div class="btn-group me-2" role="group" aria-label="Second group">
                        <input type="submit" name="modifica" value="Modifica" class="btn btn-secondary">
                  </div>
              </div>
                <input type="submit" onclick="mostraAlert()" name="elimina" value="Elimina Docente" class="btn btn-danger float-end">
            </div>
          <?php
        generaDettaglioVisualizzazione($result);
        
        
      }if(isset($_POST["modifica"])){
        echo'<div class="mb-4 clearfix">';
          echo'<input type="button" onclick="location.href=\'docenti-dettaglio.php?id='.$id.'\'" name="annullamodifiche" value="Annulla Modifiche" class="btn btn-secondary float-start">';
          echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';

        generaDettaglioModifica($result);
        
      }
    }else{
      $sql = 'Select * from persona where id =-1';
      $result = $conn->query($sql);
        echo'<div class="mb-4 clearfix">';
        echo'<input type="button" onclick="location.href=\'docenti.php\'" name="annullamodifiche" value="Annulla" class="btn btn-secondary float-start">';
        echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';
        generaDettaglioModifica($result);
        
      
    }
    
    ?>
    
    <form>
    </main>
    
  </div>
</div>


    <script src="assets/dist/js/bootstrap.bundle.min.js"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard/dashboard.js"></script>
  </body>
</html>
