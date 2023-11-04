<!--@author Matteo Pretto -->
<?php
//entry.php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");
?>
<!doctype html>
<html lang="en">
<head>
    <title>Assegnazione</title>
    <?php require("Include/head.php"); ?>
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
            // var c = confirm ('prova');
            //  var iddocente = document.getElementById("id_docente").value;
            var r = confirm('Sei sicuro di voler questa attività?');
            if (r == true) {
                document.getElementById("hidden_elimina").value = 1;
             
            }
        }
    </script>

</head>
<body>
<?php
if (isset($_POST["Elimina"])) {
 /*   $id = $_POST["id"];
    setcookie("id",$id);
    $sql = "";
    $elimina = $_POST["hidden_elimina"];
    if ($id != -1) {
        $sql = "delete from classe where id= ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        //print($stmt->error);
     //header  ("location:classi.php");*/
     $id_assegnazione=$_GET["id_assegnazione"];
     $id_hidden=$_POST["hidden_elimina"];
    
     if($id_hidden==1){
         $sqlPersona="select id_alunno from assegnazione where id=?";
         $stmt = $conn->prepare($sqlPersona);
         $stmt->bind_param("i",$id_assegnazione );
         $stmt->execute();
         $result = $stmt->get_result();
         if($result->num_rows > 0){
             $row=$result->fetch_assoc();
            $idPersona=$row["id_alunno"];
         }
         $sql_elimina="delete from assegnazione where id=?";
         $stmt_elimina = $conn->prepare($sql_elimina);
         $stmt_elimina->bind_param("i", $id_assegnazione);
         $stmt_elimina->execute();
         $_SESSION["elimina"]=0;
         
   
        
         header("location:report-attivita.php?id=$idPersona");
     }

    }

?>
  <script>
    function ricava_select(){
      var slct1 = document.getElementById("slct1");
      return slct1;
    }

    function ricavagiorno(){
        var dtinizio = document.getElementById("datainizio").value.split("-");
        console.log(dtinizio);
        var dtfine = document.getElementById("datafine").value.split("-");
        dtinizio = new Date(dtinizio[0], dtinizio[1], dtinizio[2]).getTime();
        dtfine = new Date(dtfine[0], dtfine[1], dtfine[2]).getTime();
        console.log(dtinizio + " " + dtfine + " ");
            if (dtfine < dtinizio){
                alert("Data finale prima di quella iniziale !?");
                document.getElementById("datafine").value = null;
            }
        
    }
  </script>
<?php
if (isset($_POST["salva"])) {
    //manca!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    if (isset($_GET["id_assegnazione"])) {
        $id_assegnazione = $_GET["id_assegnazione"];
    } else {
        $id_assegnazione = -1;
        //echo "wtf?";
    }
        if(( $_POST["Datainizio"]!='')&&( $_POST["Datafine"]!='')){
        $sql = "update assegnazione set";
        $sql .= "  id_azienda=?";
        $sql .= ", id_docente_tutor=?";
        $sql .= ", tutor=?";
        $sql .= ", Commento=?";
        $sql .= ", data_inizio=?";
        $sql .= ", data_fine=?";
        $sql .= " where id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssssi",$_POST["slct1"],  $_POST["slct2"],  $_POST["slct3"],  $_POST["commento"],  $_POST["Datainizio"],  $_POST["Datafine"], $id_assegnazione);
        $stmt->execute();
        print_r($conn->error);
        print_r($_POST["slct1"]);
        print_r($_POST["slct2"]);
        print_r($_POST["slct3"]);
        $result = $stmt->get_result();
        }
        else
            echo '<script>alert("Inserire sia data di inizio che data di fine")</script>';
    } 
    
function generaDettaglioVisualizzazione($result, $connessione, $id, $id_assegnazione)
{
  //  echo $id;
    //echo "2";
  //  echo $id_assegnazione;
   // $sql='select persona.nome, persona.cognome from persona join assegnazione on assegnazione.id_alunno = persona.id; '
    $sql="select * from assegnazione where id_alunno=".$id." and id=".$id_assegnazione;
    $result4= $connessione->query($sql);

    $commento = "";
    $data_inizio = "";
    $data_fine = "";
    $id_azienda = "";
    $id_docente_tutor="";   
    $tutor="";
    $id_assegnazione='';
    $nome="";
    $name="";
    $cognome="";
    $nome1="";
    $cognome1="";

    if ($result4->num_rows > 0) {
        $row = $result4->fetch_assoc();
        $commento = htmlspecialchars($row["Commento"]);
        $id_assegnazione=$row["id"];
        $data_inizio = htmlspecialchars($row["data_inizio"]);
        $data_fine = htmlspecialchars($row["data_fine"]);
        $id_azienda = htmlspecialchars($row["id_azienda"]);
        $id_docente_tutor = htmlspecialchars($row["id_docente_tutor"]);
        $tutor = htmlspecialchars($row["tutor"]);


    $sql2 = "select denominazione_azienda from azienda where id=".$id_azienda;
    $result2 = $connessione->query($sql2);


    if ($result2->num_rows > 0) {
        $row = $result2->fetch_assoc();
        $nome = htmlspecialchars($row["denominazione_azienda"]);
    }

    $sql3 = "select nome, cognome from persona where id=".$id_docente_tutor;
    $result3 = $connessione->query($sql3);


    if ($result3->num_rows > 0) {
        $row = $result3->fetch_assoc();
        $name = htmlspecialchars($row["nome"]);
        $cognome=htmlspecialchars($row["cognome"]);
    }

  /*  $sql4 = "select nome, cognome from persona where id=".$id_azienda_tutor;
    $result5 = $connessione->query($sql4);
 

    if ($result5->num_rows > 0) {
        $row = $result5->fetch_assoc();
        $nome1 = htmlspecialchars($row["nome"]);
        $cognome1=htmlspecialchars($row["cognome"]);

    }*/
}
    echo '
            <div class="justify-content-center">
            <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="calendar"class="align-baseline"></span> Data</p>
              <div class="mb-3 row">
              
              <label class="col-sm-3 col-md-auto col-form-label">Data inizio</label>
              <div class="col-sm-3 col-md-3">
              <input type="date"  readonly class="form-control" name="Datainizio" value="'.$data_inizio.'">
              </div></label>

              <label class="col-sm-3 col-md-1 col-form-label">Data fine</label>
              <div class="col-sm-3 col-md-3">
              <input type="date"  readonly class="form-control" name="Datafine" value="'.$data_fine.'">
              </div></label>
              </div>
             
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="edit-3"class="align-baseline"></span> Commento</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Commento</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" readonly class="form-control" name="commento" value="'.$commento.'" size="30">
              </div></div>
             
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="briefcase"class="align-baseline"></span> Aziende</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Azienda</label>
              <div class="col-sm-3 col-md-2">
              <input type="text" readonly class="form-control" name="nomeazienda" value="'.$nome.'">
            </div></div>

         <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Docenti</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Docente</label>
              <div class="col-sm-3 col-md-2">
              <input type="text" readonly class="form-control" name="nomedoc" value="'.$name, $cognome.'">
              </div></div>
         
         <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="users"class="align-baseline"></span> Tutor aziendali</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-auto col-form-label">Tutor aziendale</label>
              <div class="col-sm-3 col-md-2">
              <input type="text" readonly class="form-control" name="tutoraz" value="'.$tutor.'">
              </div>
              </div>
              
            </br>
            </br>
            </br>
            </br>';

}

function generaDettaglioModifica($result, $connessione, $id_assegnazione)
{
    
    $sql="select * from assegnazione where id=".$id_assegnazione;
    $result4= $connessione->query($sql);
   

    $commento = "";
    $data_inizio = "";
    $data_fine = "";
    $id_azienda = "";
    $id_docente_tutor="";   
    $tutor="";
    $id_assegnazione='';
    $nome="";
    $name="";
    $cognome="";
    $nome1="";
    $cognome1="";

    if ($result4->num_rows > 0) {
        $row = $result4->fetch_assoc();
        $commento = htmlspecialchars($row["Commento"]);
        $id_assegnazione=$row["id"];
        $data_inizio = htmlspecialchars($row["data_inizio"]);
        $data_fine = htmlspecialchars($row["data_fine"]);
        $id_azienda = htmlspecialchars($row["id_azienda"]);
        $id_docente_tutor = htmlspecialchars($row["id_docente_tutor"]);
        $tutor = htmlspecialchars($row["tutor"]);


    $sql2 = "select * from azienda where id=".$id_azienda;
    $result2 = $connessione->query($sql2);

    $sql3 = "select nome, cognome from persona where id=".$id_docente_tutor;
    $result3 = $connessione->query($sql3);


    if ($result3->num_rows > 0) {
        $row = $result3->fetch_assoc();
        $name = htmlspecialchars($row["nome"]);
        $cognome=htmlspecialchars($row["cognome"]);
    }

   /* $sql4 = "select nome, cognome from persona where id=".$id_azienda_tutor;
    $result5 = $connessione->query($sql4);
 

    if ($result5->num_rows > 0) {
        $row = $result5->fetch_assoc();
        $nome1 = htmlspecialchars($row["nome"]);
        $cognome1=htmlspecialchars($row["cognome"]);

    }*/

    $sql8 = "select * from azienda";
    $result8 = $connessione->query($sql8);
    $var = "Elenco aziende";

    $sql9 = "SELECT DISTINCT * FROM `persona` join persona_ruolo on persona.id = persona_ruolo.idpersona where idruolo = 2";
    $result9 = $connessione->query($sql9);
    $var1 = "Elenco docenti";

    $sql10 = "SELECT DISTINCT * FROM `persona` join persona_ruolo on persona.id = persona_ruolo.idpersona where idruolo = 5";
    $result10 = $connessione->query($sql10);
    $var2 = "Elenco tutor aziendali";


    echo '
            <div class="justify-content-center">
            <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="calendar"class="align-baseline"></span> Data</p>
              <div class="mb-3 row">
              
              <label class="col-sm-3 col-md-auto col-form-label">Data inizio</label>
              <div class="col-sm-3 col-md-3">
              <input type="date"  id="datainizio" onchange="ricavagiorno()"  class="form-control" name="Datainizio" value="'.$data_inizio.'">
              </div></label>

              <label class="col-sm-3 col-md-1 col-form-label">Data fine</label>
              <div class="col-sm-3 col-md-3">
              <input type="date"  id="datafine" onchange="ricavagiorno()" class="form-control" name="Datafine" value="'.$data_fine.'">
              </div></label>
              </div>
             
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="edit-3"class="align-baseline"></span> Commento</p>
              <div class="mb-3 row">
              <input type="text" class="form-control" name="commento" value="'.$commento.'" size="30">
              </div>
             
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="briefcase"class="align-baseline"></span> Aziende</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Azienda</label>
              <select style="width:20%;" id="slct1" name="slct1" class="form-select">';
               if ($result2->num_rows > 0) {
           while ($row = $result2->fetch_assoc()) {
            echo '<option value="' . $row["id"] . '">
                ' . htmlspecialchars($row["denominazione_azienda"]) . '
                ' . htmlspecialchars($row["locazione"]) . '
                </option>';
        }
    }
    echo '</select>
         </div>
         <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Docenti</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Docente</label>
              <select style="width:20%;" id="slct2" name="slct2" class="form-select">';
          if ($result9->num_rows > 0) {
           while ($row = $result9->fetch_assoc()) {
            echo '<option value="' . $row["id"] . '">
                ' . htmlspecialchars($row["nome"]) . '
                ' . htmlspecialchars($row["cognome"]) . '
                </option>';
        }
    }
    echo '</select>
         </div>
         <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="users" class="align-baseline"></span> Tutor aziendali</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-auto col-form-label">Tutor aziendale</label>
              <input type="text" class="form-control" maxlength="120" name="slct3" value="'.$tutor.'">
         </div>
         </div>
            </br>
            </br>
            </br>
            </br>';
}
}
?>
<?php require("Include/navbar.php"); ?>

<div class="container-fluid">
    <div class="row">
        <?php require("Include/menu.php"); ?>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <nav class="navbar">
                <?php
                if (isset($_GET["id_assegnazione"])) {
                    $id_assegnazione = $_GET["id_assegnazione"];
                    $id_alunno="";
                    $sql1="select id_alunno from assegnazione where id =".$id_assegnazione;
                    $result1 = $conn->query($sql1);
                    if ($result1->num_rows > 0) {
                        $row = $result1->fetch_assoc();
                        $id_alunno = htmlspecialchars($row["id_alunno"]); 
                    }
                    
                    $id_assegnazione=$_GET["id_assegnazione"];
                    $sql="select * from assegnazione where id=".$id_assegnazione;
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $dataInizio=$row["data_inizio"];
                        $dataFine=$row["data_fine"];
                    }

                     $sql = 'Select nome, cognome from persona where id =' .$id_alunno;
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $nriga = 0;
                        $row = $result->fetch_assoc();
                        //echo'<span data-feather="arrow-left"></span></a>';
                        echo '
      <nav class="navbar">
        <div class="container-fluid">
        <p class="h2 mb-3">PCTO: ' . htmlspecialchars($row["nome"]) . ' ' . htmlspecialchars($row["cognome"]) . ' dal '.$dataInizio.' al '.$dataFine.'</p>
        </div>
      </nav>
      ';
                    } else {
                        echo '<h1 class="h2 mb-3">Attenzione: Alunno inesistente</h1>';
                    }

                } else {
                    echo '<h1 class="h2 mb-3">Inserisci nuova assegnazione</h1>';
                }
                ?>

            </nav>
            <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="hidden_elimina" id="hidden_elimina" value="0"/>
                <input type="hidden" name="id" value="<?php echo ($_GET['id_assegnazione']); ?>"/>
                <?php
                if (isset($_GET["id_assegnazione"])) {                                                  
                    $id_assegnazione = $_GET["id_assegnazione"];
                    $id_alunno="";
                    //echo $id_assegnazione;
                    
                    $sql1="select id_alunno from assegnazione where id =".$id_assegnazione;
                    $result1 = $conn->query($sql1);
                    if ($result1->num_rows > 0) {
                        $row = $result1->fetch_assoc();
                        $id_alunno = htmlspecialchars($row["id_alunno"]); 
                    }


                    if (!isset($_POST["modifica"])) {
                        ?>
                        <div class="mb-4 clearfix">
                            <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group me-2" role="group" aria-label="First group">
                                  <?php echo'  <button type="button" onclick="location.href=\'report-attivita.php?id=' . $id_alunno . '\'" name="indietro" value=""
                                            class="btn btn-secondary">'?>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                  d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="btn-group me-2" role="group" aria-label="Second group">
                                    <input type="submit" name="modifica" value="Modifica" class="btn btn-secondary"  onclick="location.href=\'assegnazione.php?id=-1'\">
                                </div>
                            </div>
                           <!-- <input type="submit" onclick="mostraAlert()" name="elimina" value="Elimina Classe"
                                   class="btn btn-danger float-end"> -->
                        </div>
                        <?php
                        generaDettaglioVisualizzazione($result1, $conn, $id_alunno, $id_assegnazione);


                    }
                    if (isset($_POST["modifica"])) {
                        echo '<div class="mb-4 clearfix">';
                        echo '<input type="button" onclick="location.href=\'assegnazione.php?id_assegnazione=' . $id_assegnazione . '\'" name="annullamodifiche" value="Annulla Modifiche" class="btn btn-secondary float-start">';
                        ?> &nbsp; <?php
                        echo '<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end col-mb-2"> &nbsp;';
                        ?> &nbsp; <?php
                        echo ' <input type="submit" onclick="mostraAlert()"  class=" btn btn-danger float-end" name="Elimina" value="ELIMINA"  >&nbsp;'; 
                        echo '</div>';

                        generaDettaglioModifica($result, $conn, $id_assegnazione);

                    }
                } else {  

                    $sql = 'Select * from persona where id =-1';
                    $result = $conn->query($sql);
                    echo '<div class="mb-4 clearfix">';
                    echo '<input type="button" onclick="location.href=\'assegnazione.php?id=' . $id_assegnazione . '\'" name="annullamodifiche" value="Annulla" class="btn btn-secondary float-start">';
                    echo '<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
                   
                    echo '</div>';
                    generaDettaglioModifica($result, $conn, $id_alunno);

                }

                ?>

                <form>
        </main>

    </div>
</div>
<?php require("Include/footer.php"); ?>
</body>
</html>