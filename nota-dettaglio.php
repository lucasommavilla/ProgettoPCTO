<?php  
   //entry.php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");  
   
   ?>  
<!doctype html>
<html lang="en">
  <head>
  <title>Nota - dettaglio</title>
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
        var r = confirm('Sei sicuro di voler ELIMINARE questa nota?');
        if (r == true) {
            document.getElementById("hidden_elimina").value = 1;
        }
    }

    function eliminaData(){
      document.getElementById('data').value="";
    }
</script>
    
  </head>
  <body>
  
        <?php
           $sql = 'SELECT denominazione_azienda FROM azienda WHERE id=?';
           $stmt = $conn->prepare($sql);
           $stmt->bind_param("i", $_GET['idazienda']);
           $stmt->execute();
           $result = $stmt->get_result();
           if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $nomeazienda = $row['denominazione_azienda'];
           }
        ?>

    <?php
    if (isset($_POST["tornanota"])) {
      header("location:nota.php?id=".$_GET['idazienda']);
    }
    if (isset($_POST["elimina"])) {
      $id=$_GET["idnota"];
      $sql = "";
      $elimina = $_POST["hidden_elimina"];

      if ($elimina && $id != -1) {
          $sql = "delete from nota where idnota= ?";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param("i", $id);
          $stmt->execute();
          header("location:nota.php?id=".$_GET['idazienda']);  
      }
  }
  if(isset($_POST["salva"])){
    //salvo dati persona
    if(isset($_GET["idnota"])){
      $id = $_GET["idnota"];
    }else{
      $id=-1;
    }
  $sql = "";
  if ($id != -1) {
      //se id!= -1 allora aggiorni i dati
      $titolo=$_POST["titolo"];
      $descrizione=$_POST["descrizione"];
      $scadenza=$_POST["scadenza"];
      $sql="update nota set titolo=?, descrizione=?, scadenza=? where idnota=?";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("sssi", $titolo, $descrizione, $scadenza, $id);
      $stmt->execute();
      $result = $stmt->get_result();
    }else {
      $idazienda=$_GET["idazienda"];
      $idpersona=$_SESSION['idpersonaloggata'];
      $titolo=$_POST["titolo"];
      $descrizione=$_POST["descrizione"];
      $scadenza=$_POST["scadenza"];
      $sql= "INSERT INTO `nota` (`idazienda`, `idpersona`, `titolo`, `descrizione`, `scadenza`) VALUES (?,?,?,?,?)";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("iisss", $idazienda, $idpersona, $titolo, $descrizione, $scadenza);
      $stmt->execute();
      $last_id = $conn->insert_id;
      header("location:nota-dettaglio.php?idnota=".$last_id."&idazienda=".$_GET['idazienda']); 
    }
  }
        function generaDettaglioVisualizzazione($result){
          $titolo = "";
          $descrizione = "";
          $data = "";
          $scadenza = "";
          
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $titolo = htmlspecialchars($row["titolo"]);
                $descrizione = htmlspecialchars($row["descrizione"]);
                $data = new Datetime(htmlspecialchars($row["data"]));
                $scadenza="Non specificata";
               $confronto="0000-00-00 00:00:00";
                if(isset($row["scadenza"])&&!empty($row["scadenza"])&&$confronto!=$row["scadenza"]) {
                 $scadenza=new Datetime(htmlspecialchars($row["scadenza"]));
                 $scadenza=date_format($scadenza,"d/m/Y H:i:s");
               }
               $data = date_format($data,"d/m/Y H:i:s");
            } 
            echo '
            <div class="justify-content-center">
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Panoramica</label>
                  <div class="col-sm-3 col-md-3">
                  <textarea style="resize: both;" readonly name="titolo" id="titolo" maxlength="200" cols="100" rows="3">'.$titolo.'</textarea>
                  </div>
              </div>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Descrizione</label>
                  <div class="col-sm-3 col-md-3">
                  <textarea style="resize: both;" readonly name="descrizione" id="descrizione" maxlength="2000" cols="100" rows="10">'.$descrizione.'</textarea>
                  </div>
              </div>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Data di inserimento</label>
                  <div class="col-sm-3 col-md-3">
                  <input type="datetime" readonly id="data" class="form-control" name="data" value="'. $data .'">
                  </div>
              </div>
              <div class="mb-3 row">
                  <label class="col-md-1 col-sm-3 col-form-label">Data di scadenza</label>
                  <div class="col-sm-3 col-md-3">
                    <input type="datetime" readonly class="form-control" name="scadenza" value="'. $scadenza .'">
                  </div>
              </div>
            </div>
            </br>
            </br>
            </br>
            </br>';
            }
        function generaDettaglioModifica($result){
          $titolo = "";
          $descrizione = "";
          $scad = "Non specificata";
          $stringaperdata="D";
          if(isset($result)) {
          if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $titolo = htmlspecialchars($row["titolo"]);
            $descrizione = htmlspecialchars($row["descrizione"]);
            $scadenza="Non specificata";
            $confronto="0000-00-00 00:00:00";
            if(isset($row["scadenza"])&&!empty($row["scadenza"])&&$confronto!=$row["scadenza"]) {
              $scad=new Datetime(htmlspecialchars($row["scadenza"]));
              $scad =date_format($scad, 'c');
              $scad = substr($scad, 0, -9);
            }
        }
        $stringaperdata="Nuova d";
      }
        echo '
        <div class="justify-content-center">
          <div class="mb-3 row">
              <label class="col-md-1 col-sm-3 col-form-label">Panoramica</label>
              <div class="col-sm-3 col-md-3">
                <textarea style="resize: both;" name="titolo" id="titolo" maxlength="200" cols="100" rows="3">'.$titolo.'</textarea>
              </div>
          </div>
          <div class="mb-3 row">
              <label class="col-md-1 col-sm-3 col-form-label">Descrizione*</label>
              <div class="col-sm-3 col-md-3">
                <textarea style="resize: both;" name="descrizione" required id="descrizione" maxlength="2000" cols="100" rows="10">'.$descrizione.'</textarea>
              </div>
          </div>
          <div class="mb-3 row">
          <label class="col-sm-3 col-md-1  col-form-label">'.$stringaperdata.'ata di scadenza</label>
            <div class="col-sm-3 col-md-3">
              <input type="datetime-local" id="data" class="form-control" name="scadenza" value="'.$scad.'">
            </div>
            <div class="col-sm-3 col-md-3">
          <input type="button" name="reset" id="reset" onclick="eliminaData()" value="Resetta data di scadenza" class="btn btn-secondary float-start">
          </div>
          </div>
          <div class="mb-3 row">
            <label>*Campi obbligatori</label>
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
    if(isset($_GET["idnota"])){
      $id = $_GET["idnota"];
      $sql = 'Select nome, cognome from nota, persona where persona.id=nota.idpersona AND idnota =?';
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("i", $_GET["idnota"]);
      $stmt->execute();
      $result = $stmt->get_result();
      if ($result->num_rows > 0) {
        $nriga = 0;
        $row = $result->fetch_assoc();
      echo'
      <nav class="navbar">
        <div class="container-fluid">
        <p class="h2 mb-3">Dettaglio della nota dell\'azienda '.$nomeazienda.' inserita da '.htmlspecialchars($row["nome"]).' '.htmlspecialchars($row["cognome"]).'</p>
        </div>
      </nav>
      '; 
      }else{
        echo '<h1 class="h2 mb-3">Attenzione: nota inesistente</h1>';  
      }
      
    }else{
           $sql = 'SELECT denominazione_azienda FROM azienda WHERE id=?';
           $stmt = $conn->prepare($sql);
           $stmt->bind_param("i", $_GET['idazienda']);
           $stmt->execute();
           $result = $stmt->get_result();
           if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $nomeazienda = $row['denominazione_azienda'];
           }
      echo '<h1 class="h2 mb-3">Aggiungi nuova nota per l\'azienda '.$nomeazienda.'</h1>';  
    }
    ?>
        
    </nav>
    <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="hidden_elimina" id="hidden_elimina" value="0" />
    <?php
    if(isset($_GET["idnota"])){
      $bottonemodifica='<input type="submit" name="modifica" value="Modifica" class="btn btn-secondary">';
      $bottoneelimina='<input type="submit" onclick="mostraAlert()" name="elimina" value="Elimina nota" class="btn btn-danger float-end">';
      $sql = 'SELECT persona.id FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? AND idnota=?';
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("ii", $_GET["idazienda"], $_GET["idnota"]);
      $stmt->execute();
      $result = $stmt->get_result();
      if(mysqli_num_rows($result) > 0) {
        $row=$result->fetch_assoc();
        if($row['id']!=$_SESSION['idpersonaloggata']) {
          $bottonemodifica="";
          $bottoneelimina="";
        }
      }
      $id = $_GET["idnota"];
      $sql = 'SELECT nota.idnota, persona.cognome, persona.nome, nota.titolo, nota.descrizione, nota.data, nota.scadenza FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? AND idnota=? ';
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("ii", $_GET["idazienda"], $_GET["idnota"]);
      $stmt->execute();
      $result = $stmt->get_result();
      if(!isset($_POST["modifica"])){
          ?>  
            <div class="mb-4 clearfix">
                <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                  <div class="btn-group me-2" role="group" aria-label="First group">
                    <input type="submit" name="tornanota" value="<-- Torna alle note dell'azienda" class="btn btn-secondary">
                  </div>
                  <div class="btn-group me-2" role="group" aria-label="Second group">
                    <?php echo $bottonemodifica; ?>
                  </div>
              </div>
              <?php echo $bottoneelimina; ?>
            </div>
          <?php
        generaDettaglioVisualizzazione($result);
        
        
      }if(isset($_POST["modifica"])){
        echo'<div class="mb-4 clearfix">';
          echo'<input type="button" onclick="location.href=\'nota-dettaglio.php?idnota='.$_GET['idnota'].'&idazienda='.$_GET['idazienda'].'\'" name="annullamodifiche" value="Annulla modifiche" class="btn btn-secondary float-start">';
          echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';

        generaDettaglioModifica($result);
        
      }
    }else{
      $sql = 'Select * from nota where id =-1';
      $result = $conn->query($sql);
        echo'<div class="mb-4 clearfix">';
        echo'<input type="button" onclick="location.href=\'nota.php?id='.$_GET['idazienda'].'\'" name="annullainsserimento" value="Annulla inserimento" class="btn btn-secondary float-start">';
        echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
        echo '</div>';
        generaDettaglioModifica(null);
        
      
    }
    
    ?>
    
    <form>
    </main>
    
  </div>
</div>
<?php require("Include/footer.php");?>
  </body>
</html>
