<?php  
  require_once("Include/funz_admin.inc");
  require("Include/db_connection.inc");
 
   ?> 
<!doctype html>
<html lang="en">

  <head>
  <title>Studenti</title>
  <?php require("Include/head.php");?>

  </head>
  <body>
  <?php require("Include/navbar.php")?>

<div class="container-fluid">


  <div class="row">
    <?php require("Include/menu.php");?>
          <!-- <optgroup label="Quinte">
              <option data-tokens="quinte">A</option>
              <option>A</option>
              <option>A</option>
              <option>A</option>
              <option>A</option>
    </optgruop>
    <optgroup label="Quarte">
              <option>A</option>
              <option>A</option>
              <option data-tokens="quarta">A</option>
              <option>A</option>
              <option>A</option>
    </optgruop>
    <optgroup label="Terze">
    </optgruop>
    <optgroup label="Seconde">
    </optgruop>
    <optgroup label="Prime">
    </optgruop>-->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Studenti <?php 
        
        if(isset($_GET["classe"])){
                  $_SESSION["titolo"]="".$_GET["classe"];
         } /*if((isset($_GET['classe'])) && ($_SESSION["cerca"]==true)){
          $class=$_GET["classe"];
        }
        else $class="";
         if(isset($_SESSION["cerca"])){
         if($_SESSION["cerca"]==false){
             echo $_GET['classe'];
             }
            }else if(!isset($_POST["cerca"]))*/
            ?>
             </h1>
        
       <?php
       /*
       $anni = array("Primo", "Secondo", "Terzo", "Quarto", "Quinto");
       echo "<select id='sel1'>";
       foreach($anni as $anno){
        echo "<option value='$anno'> $anno </option>";
       }
       echo "</select>";
       */
       ?>
 
        <script>
    function mostra() {      
        var classe= document.getElementById('sel2').options[document.getElementById('sel2').selectedIndex].text;
        var anno= document.getElementById('sel1').options[document.getElementById('sel1').selectedIndex].text;
        window.location.href="studenti.php?classe="+classe+"&anno="+anno;
        console.log(classe);
        
    }

  </script>
      <?php
      if(isset($_POST["classe"])){
      $classe=$_GET["classe"];
      }
      date_default_timezone_set('UTC');
      $anno = date("Y");
      if(isset($_GET["anno"])){
        $anno=$_GET["anno"];
      }
      else{
        $anno="Anno";
      }

      echo "<div class='btn-group'>";
      echo"<select id='sel1' class='form-select' >";
      echo"<option value=''>Anno</option>";
      $sql="select distinct anno from classe"; 
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $result = $stmt->get_result();
              if($result->num_rows > 0){ 
                while ($row=$result->fetch_assoc()){
                 // if($anno!=$row["anno"])
                 if($anno==$row["anno"]){
                  echo '<option selected value="'.$row["anno"].'">';
                 }
                 else{
                  echo '<option value="'.$row["anno"].'">';
                 }

                  echo ''.$row["anno"];
                  echo "</option>";
                 
                }
              
              }
        echo"</select>";

              echo"<select style='width:117%;' id='sel2' class='form-select' onchange='mostra()'>";
              echo"<option value='-1'>".$_GET['classe']."</option>";
              $sql="select * from classe order by sezione ";
            $result = $conn->query($sql);
                  if($result->num_rows > 0){
              while($row=$result->fetch_assoc()){
                if($row["sezione"]!=$classe)
                echo '<option value="'.$row["anno"].'">';
                echo $row["sezione"];
                echo "</option>";
              }
            }
            echo "</select>";
            echo"</div>";
      ?>
      <script type="text/javascript">
        $("#sel2").prop("disabled", true);

  $( "#sel1" ).change(function() {
    var value = $(this).val();
      $("#sel2").prop("disabled", false);
      $("#sel2 > option").hide();
      $("#sel2 > option[value*='" + value +"']").show();
    
      
  });
      </script>
           <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    Options
                    <span class="navbar-toggler-icon" style="background-image: url('Images/option_icon.png');"></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Opzioni</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                          <li class="nav-item">
                                <b>Aggiungi uno studente</b>
                                  <div class="row justify-content-start">
                                    <form method="POST" action="studenti-dettaglio.php" enctype="multipart/form-data">
                                      <input type="Submit" class="btn btn-outline-secondary" name="submit" value="Aggiungi" />
                                    </form>
                                  </div>
                                  <br>
                            </li>
                            <li class="nav-item">
                                <b>Importa da file</b>
                                <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
                                    <div class="input-group">
                                        <input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <button class="btn btn-outline-secondary" name="btnfile" type="submit" id="inputGroupFileAddon04">Carica</button>
                                    </div>
                                </form>
                                <br>
                            </li>
                            <li class="nav-item">
                                <b>Esporta in csv</b>
                                <div class="row justify-content-start">
                                    <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
                                        <input type="Submit" class="btn btn-outline-dark" id="esporta" name="esporta" value="Esporta Database" />
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
        </div>
        <nav class="navbar">
                <div class="container-fluid">
                    <form class="d-flex" method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
                        <input class="form-control" name="testocerca" type="text" placeholder="Cerca uno studente" aria-label="Cerca">
                        <button class="btn btn-outline-secondary" type="submit" name="cerca">Cerca</button>
                    </form>
</nav>
      <div class="table-responsive">
      <?php
    
      if(isset($_GET["classe"])) {
       //   $_SESSION["classe"]=$_GET["classe"];
          $classe=$_GET["classe"];
          if(isset($_GET["anno"])){
          $anno=$_GET["anno"];
            $sql="select * from (persona join classe_studente on persona.id = classe_studente.idpersona) join classe on classe_studente.idclasse =  classe.id where classe.sezione ='$classe' and classe.anno='$anno' order by cognome asc limit 80";
          }
          else{
            $sql="select * from (persona join classe_studente on persona.id = classe_studente.idpersona) join classe on classe_studente.idclasse =  classe.id where classe.sezione ='$classe' order by cognome asc limit 80";
          }
      }
      else{
      //modifica
     // $classe=$_SESSION["classe"];
     
      $sql="select * from (persona join classe_studente on persona.id = classe_studente.idpersona) join classe on classe_studente.idclasse =  classe.id order by cognome, nome";
        }  
        
        if(!isset($_POST["cerca"])){
          $_SESSION["cerca"]=false;
          if(isset($_GET["classe"])){
          $_SESSION["titolo"]=$_GET["classe"];
          }
          $stmt = $conn->prepare($sql);
              $stmt->execute();
              $result = $stmt->get_result();
              if($result->num_rows > 0){
                echo "<br/>";
              /*  echo "<table align = 'center' class='table' border = '1'>";
                echo '<thead class="thead-dark">';
                echo '<th></th><th>Nome</th><th>Cognome</th><th>Data di nascita</th><th>Sesso</th><th>Mail</th></tr>';
                echo '</thead>';*/
                echo '<div class="col-md-12 justify-content-center">';
                if(isset($_GET["classe"])){
                echo '<h6><i>STAI VISUALIZZANDO: '.$_GET["classe"];
                }
                echo '</h6></i>';
                echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                    echo '<tr bgcolor="#252526">';
                    echo '<th style="width: 3.66%"></th>';
                    echo '<th style="width: 3.66%"></th>';
                    
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Cognome"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaAnno" value="Nome"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Data di Nascita"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Sesso"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="E-mail"/></th>';
                $output = 'Nome; Locazione; Rappresentante; Convenzione; Iva';
                $output.="\n";
                  while($row=$result->fetch_assoc()){
                    $output.='"'.$row['nome'].'";';
                    $output.='"'.$row['cognome'].'";';
                    $output.='"'.$row['datanascita'].'";';
                    $output.='"'.$row['sesso'].'";';
                    $output.='"'.$row['email'].'"';
                    $output.="\n";
                    echo '<tr id="'.$row['idpersona'].'">';
                    echo '<td><a href="studenti-dettaglio.php?id='.htmlspecialchars($row["idpersona"]).'"><span data-feather="edit"></span></a></td>';
                    echo '<td><a href="report-attivita.php?id='.htmlspecialchars($row["idpersona"]).'&flag=vero"><span data-feather="activity"></span></a></td>';
                    echo '<td style = "background-color:white;">'.$row["cognome"].'</td>';
                    echo '<td style = "background-color:white;">'.$row["nome"].'</td>';
                    echo '<td style = "background-color:white;">'.$row["datanascita"].'</td>';
                    echo '<td style = "background-color:white;">'.$row["sesso"].'</td>';
                    echo '<td style = "background-color:white;">'.$row["email"].'</td>';
                    echo '</tr>';
                  }
                  echo '</table>';
                //  $file = 'miofile.csv';
                //  $f = fopen('miofile.csv', 'w');
                //  fwrite($f,$output);
                //  fclose($f);
                }
                else{
                  
                  echo "<font size=4> :'( Sembra che non siano presenti alunni in questa classe. Controlla di aver selezionato l'anno di appartenenza corretto.</br> Altrimenti riprovare più tardi, oppure contattare la segreteria scolastica.";
                  echo  "</br></br><b>CONTATTI:</b></br></br>";
                  echo "TELEFONO CENTRALINO: 0422 6171 </br>E-MAIL: tvtf04000t@istruzione.it";
                  echo "</br></br>Per maggiori info visita il nostro <a href='https://maxplanck.edu.it'>sito web</a>. </font>";
                }
                echo '</div></div></div>';
              }
              else{
                $_SESSION["cerca"]=true;
                $_SESSION["titolo"]="";
                $keyword=$_POST["testocerca"];
                $sql = 'SELECT * FROM persona join persona_ruolo on id=idpersona and idruolo = 3 WHERE';
                $sql .= ' cognome like "%' . $keyword . '%"';
                $sql .= ' or nome like "%' . $keyword . '%"';
                //$sql .= ' or datanascita like "%' . $keyword . '%"';
                $sql .= ' or telefono like "%' . $keyword . '%"';
                $sql .= ' or codicefiscale like "%' . $keyword . '%"';
                $stmt = $conn->prepare($sql);
                $stmt->execute();
                $result = $stmt->get_result();
                if($result->num_rows > 0){
                  echo "<br/>";
                /*  echo "<table align = 'center' class='table' border = '1'>";
                  echo '<thead class="thead-dark">';
                  echo '<th></th><th>Nome</th><th>Cognome</th><th>Data di nascita</th><th>Sesso</th><th>Mail</th></tr>';
                  echo '</thead>';*/
                  echo '<div class="col-md-12 justify-content-center">';
                  echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                      echo '<tr bgcolor="#252526">';
                      echo '<th style="width: 3.66%"></th>';
                      echo '<th style="width: 3.66%"></th>';
                      
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Cognome"/></th>';
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaAnno" value="Nome"/></th>';
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaClasse" value="Classe"/></th>';
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Data di Nascita"/></th>';
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Sesso"/></th>';
                      //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
                      echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="E-mail"/></th>';


                      while($row=$result->fetch_assoc()){
                        $sql2= "select classe.sezione from classe, classe_studente where classe.id=classe_studente.idclasse and classe_studente.idpersona=".$row['idpersona'];
                        $stmt2 = $conn->prepare($sql2);
                        $stmt2->execute();
                        $result2 = $stmt2->get_result();
                        if($result2->num_rows > 0){
                         while( $row2=$result2->fetch_assoc())
                          $sezione=$row2["sezione"];

                        }
                        else 
                          $sezione='';
                        echo '<tr id="'.$row['idpersona'].'">';
                        echo '<td><a href="studenti-dettaglio.php?id='.htmlspecialchars($row["idpersona"]).'"><span data-feather="edit"></span></a></td>';
                        echo '<td><a href="report-attivita.php?id='.htmlspecialchars($row["idpersona"]).'&flag=vero"><span data-feather="activity"></span></a></td>';
                        echo '<td style = "background-color:white;">'.$row["cognome"].'</td>';
                        echo '<td style = "background-color:white;">'.$row["nome"].'</td>';
                        echo '<td style = "background-color:white;">'.$sezione.'</td>';
                        echo '<td style = "background-color:white;">'.$row["datanascita"].'</td>';
                        echo '<td style = "background-color:white;">'.$row["sesso"].'</td>';
                        echo '<td style = "background-color:white;">'.$row["email"].'</td>';
                        echo '</tr>';
                      }
                      echo '</table>';
              } 
              else{
                echo "<font size=4>La ricerca non ha prodotto alcun risultato</font>";
              }  
            }
                ?>
      </div>
        </div>
      </main>
  </div>
    </div>
</div>


   
<?php require("Include/footer.php");
?>
  </body>
</html>