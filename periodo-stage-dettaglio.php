<?php  
   //entry.php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");  
  
   ?>  
<!doctype html>
<html lang="en">
  <head>
  <title>Docenti - dettaglio</title>
  <?php require("Include/head.php");?>
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
  <!-- Custom styles for this template -->
      <link href="dashboard/dashboard.css" rel="stylesheet">

<script>
    function mostraAlert() {
        document.getElementById("hidden_elimina").value = 0;
        var idel = document.getElementById("periodo");
        console.log(idel);
        var nome = document.getElementById("nomeperiodo").value;
        var r = confirm('Sei sicuro di voler ELIMINARE il periodo '+nome.toUpperCase()+'?');
        if (r == true) {
            document.getElementById("hidden_elimina").value = 1;
        }
    }
</script>
    
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
      $sql = "update periodo_stage set";
      $sql .= " nome=?";
      $sql .= ", data_inizio=?";
      $sql .= ", data_fine=?";
      $sql .= " where id=?";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("sssi", $_POST["nome"], $_POST["data_inizio"], $_POST["data_fine"],  $id);
      $stmt->execute();
      $result = $stmt->get_result();
    }else {
      //altrimenti inserisco nuovo persona
      // $sql = "INSERT into persona(datanascita, codicefiscale, residenza, indirizzo, cognome, nome, cellulare, telefono, cap, email, sesso) values(?,?,?,?,?,?,?,?,?,?,?)";
      $sql= "INSERT INTO `periodo_stage` (`nome`, `data_inizio`, `data_fine`) VALUES (?,?,?);";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("sss", $_POST["nome"], $_POST["data_inizio"], $_POST["data_fine"]);
      $stmt->execute();
      
      $last_id = $conn->insert_id;
      header("location:periodo-stage-dettaglio.php?id=".$last_id); 
    }
  }
        function generaDettaglioVisualizzazione($result){
          $nomeperiodo = "";
          $datainizio = "";
          $datafine = "";
          
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $nomeperiodo = htmlspecialchars($row["nome"]);
                
                $date = new DateTime($row["data_inizio"]);
                $datainizio = $date->format('Y-m-d');
                $date = new DateTime($row["data_fine"]);
                $datafine = $date->format('Y-m-d');
                
            } 
            echo '
            <div class="justify-content-center">
            <p class="fs-5"><span data-feather="calendar"class="align-baseline"></span> Dettagli periodo</p>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Nome</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="text" readonly id="nomeperiodo" class="form-control" name="nome" value="'. $nomeperiodo .'">
                  </div>
              </div>

              <div class="mb-3 row">
                  <label class="col-sm-3 col-md-1 col-form-label">Data Inizio</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="date" readonly class="form-control" name="data_inizio" value="'. $datainizio .'">
                  </div>
                  <label class="col-sm-3 col-md-1 col-form-label">Data Fine</label>
                  <div class="col-sm-3 col-md-3">
                      <input type="date" readonly class="form-control" name="data_fine" value="'. $datafine .'">
                  </div>
              </div>

            </br>
            </br>
            </br>
            </br>'
            
                        ;
            }
        function generaDettaglioModifica($result){
          $nomeperiodo = "";
          $datainizio = "";
          $datafine = "";

          if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
                $nomeperiodo = htmlspecialchars($row["nome"]);
                $date = new DateTime($row["data_inizio"]);
                $datainizio = $date->format('Y-m-d');
                $date = new DateTime($row["data_fine"]);
                $datafine = $date->format('Y-m-d');
          }
          echo'
          <div class="justify-content-center">
          <p class="fs-5"><span data-feather="calendar"class="align-baseline"></span> Dettagli periodo</p>
            <div class="mb-3 row">
                <label class="col-md-1 col-sm-3 col-form-label">Nome</label>
                <div class="col-sm-3 col-md-3">
                    <input type="text" id="nomeperiodo" class="form-control" name="nome" value="'. $nomeperiodo .'">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-3 col-md-1 col-form-label">Data Inizio</label>
                <div class="col-sm-3 col-md-3">
                    <input type="date" class="form-control" name="data_inizio" value="'. $datainizio .'">
                </div>
                <label class="col-sm-3 col-md-1 col-form-label">Data Fine</label>
                <div class="col-sm-3 col-md-3">
                    <input type="date" class="form-control" name="data_fine" value="'. $datafine .'">
                </div>
            </div>

          </br>
          </br>
          </br>
          </br>';
        }
    ?>
<?php require("Include/navbar.php");?>

<div class="container-fluid">
  <div class="row">
    <?php require("Include/menu.php");?>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
    <?php 
    if(isset($_GET["id"])){
      $id = $_GET["id"];
    
      $sql = 'Select nome from periodo_stage where id ='.$_GET["id"];
      $result = $conn->query($sql);
      if ($result->num_rows > 0) {
        $nriga = 0;
        $row = $result->fetch_assoc();
      //echo'<span data-feather="arrow-left"></span></a>';
      echo'
      <nav class="navbar">
        <div class="container-fluid">
        <p class="h2 mb-3"> Dettaglio del periodo '.htmlspecialchars($row["nome"]).'</p>
        </div>
      </nav>
      '; 
      }else{
        echo '<h1 class="h2 mb-3">Attenzione: Periodo inesistente</h1>';  
      }
      
    }else{
      echo '<h1 class="h2 mb-3">Aggiungi nuovo Periodo</h1>';  
    }
    ?>
        
    </nav>
    <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="hidden_elimina" id="hidden_elimina" value="0" />
    <?php
    if(isset($_GET["id"])){
      $id = $_GET["id"];
    
      $sql = 'Select nome, data_inizio, data_fine from periodo_stage where id ='.$_GET["id"];
      $result = $conn->query($sql);
      if(!isset($_POST["modifica"])){
          ?>  
            <div class="mb-4 clearfix">
                <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                  <div class="btn-group me-2" role="group" aria-label="First group">
                          <button type="button" onclick="location.href='periodo-stage.php'" name="indietro" value="" class="btn btn-secondary">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                          </svg>
                          </button>
                  </div>
                  <div class="btn-group me-2" role="group" aria-label="Second group">
                        <input type="submit" name="modifica" value="Modifica" class="btn btn-secondary">
                  </div>
              </div>
                <input type="submit" onclick="mostraAlert()" name="elimina" value="Elimina Periodo" class="btn btn-danger float-end">
            </div>
          <?php
        generaDettaglioVisualizzazione($result);
        
        
      }if(isset($_POST["modifica"])){
        echo'<div class="mb-4 clearfix">';
          echo'<input type="button" onclick="location.href=\'periodo-stage-dettaglio.php?id='.$id.'\'" name="annullamodifiche" value="Annulla Modifiche" class="btn btn-secondary float-start">';
          echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';

        generaDettaglioModifica($result);
        
      }
    }else{
      $sql = 'Select * from periodo_stage where id =-1';
      $result = $conn->query($sql);
        echo'<div class="mb-4 clearfix">';
        echo'<input type="button" onclick="location.href=\'periodo-stage.php\'" name="annullamodifiche" value="Annulla" class="btn btn-secondary float-start">';
        echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';
        generaDettaglioModifica($result);
        
      
    }
    
    ?>
    
    <form>
    </main>
    
  </div>
</div>
<?php require("Include/footer.php");?>
  </body>
</html>
