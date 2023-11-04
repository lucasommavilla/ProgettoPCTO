<!--@author Matteo Pretto -->

<?php  
  require_once("Include/funz_admin.inc");
  require("Include/db_connection.inc");

if (!isset($_SESSION["username"])) {
    header("location:login.php?action=login");
}
?>
<!doctype html>
<html lang="en">
<head>
    <?php
    $id=$_GET["id"];
    $sql= "select * from persona where id=".$id;
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows>0){
        while($row=$result->fetch_assoc()){
            $nome=$row['nome'];
            $cognome=$row['cognome'];
        }
    }
    ?>
    <title>Nuova Assegnazione </title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    <?php require("Include/head.php"); ?>

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

        function mostra(){
                var data= document.getElementById('periodo').options[document.getElementById('periodo').selectedIndex].text;
                let data_inizio= data.substr( 0, 10);
                let data_fine=data.substr(14, 23) ;          
                let text ="Hello";
                let result = text.substring(1, 4);
                //document.getElementById("demo").innerHTML = data_inizio;
                console.log(data_inizio);
                console.log(data_fine);
                //console.log(text);

                document.getElementById("dataInizio").value = data_inizio;
                document.getElementById("dataFine").value = data_fine;

            }


    </script>
    <body>

<?php require("Include/navbar.php")?>
<div class="container-fluid">
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
  <div class="row">
  
    <nav class="navbar">
        
    <h1 class="h2">Nuova attivit&agrave <?php echo"$nome $cognome";?></h1>

    </br></br>
    </div>
    <?php
        if(isset($_POST["salva"])){
                    
            $dt_inizio=$_POST["Datainizio"];
            $dt_fine=$_POST["Datafine"];
            $commento=$_POST["commento"];
            $id_azienda=$_POST["aziende"];
            $id_docente=$_POST["docenti"];
            $tutor=$_POST["tutoraz"];
            $id_alunno=$_GET["id"];
           // $id_periodo=$_POST["periodo"];
            //echo '<script>alert("CIAO")</script>';
            
            /* if(($dt_inizio=='')||($dt_fine=='')||($commento=='')||($id_azienda=='')||($id_docente=='')||($id_alunno=='')||($tutor=='')){
                echo '<script>alert("Attenzione: hai lasciato alcuni campi vuoti.")</script>';
             }
             else{*/

            $sql="INSERT INTO assegnazione ( `id_alunno`, `id_azienda`,id_docente_tutor, 
            `Commento`, `data_inizio`, `data_fine`, `tutor`) VALUES  ( ?, ?,?, ?, ?, ?, ?);";
            //echo $sql;
           

             $stmt = $conn->prepare($sql);
            // echo $conn->error;
             $stmt->bind_param("iiissss", $id_alunno, $id_azienda, $id_docente, $commento, $dt_inizio, $dt_fine, $tutor );
             $stmt->execute();

             // echo '<script>alert("Nuova attività aggiunta con successo")</script>';
             header("location:report-attivita.php?id=$id_alunno");
             
        }
 echo'<div class="mb-4 clearfix">';
 echo '<form method="POST">';
 echo'<button type="button" name="indietro" value="Indietro" onclick="location.href=\'report-attivita.php?id='.$id.'\'" class="btn btn-secondary float-start">';
 echo '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
 <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
 </svg></button>';
 echo'<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end" >';
 echo '</div>';
    ?>
    

            <?php
                if(isset($_GET["id"])){
                      
              
                    echo'
                    <div class="justify-content-center">
                    <hr class="mt-2 mb-3"/>
                      <p class="fs-5"><span data-feather="calendar"class="align-baseline"></span> Data</p>
                      <div class="mb-3 row">
                      
                      <label class="col-sm-3 col-md-auto col-form-label">Data inizio</label>
                      <div class="col-sm-3 col-md-3">
                      <input type="date" required  class="form-control" id="dataInizio" name="Datainizio" value="">
                      </div></label>
        
                     
                      <label class="col-sm-3 col-md-1 col-form-label">Data fine</label>
                      <div class="col-sm-3 col-md-3">
                      <input type="date" required class="form-control" id="dataFine"  name="Datafine" value="">
                      </div></label>

                      <label class="col-sm-3 col-md-1 col-form-label">Periodo</label>
                      <div class="col-sm-3 col-md-3">
                      <select name="periodo" id="periodo" class="form-control" onchange="mostra()">
                    <option value=-1>Seleziona periodo preimpostato </option>';

                    $sql="select * from periodo_stage";
                    $stmt = $conn->prepare($sql);
                    $stmt->execute();
                    $result = $stmt->get_result();
                      if($result->num_rows > 0){
                       while($row=$result->fetch_assoc()){
                           $id_periodo=$row["id"];
                           $nome=$row["nome"];
                           $data_inizio=$row["data_inizio"];
                           $data_fine=$row["data_fine"];
                         
                           echo"<option value=$id_periodo>$data_inizio -- $data_fine</option>";
                       }
                    }

                      echo'
                      </select>
                      </div></label>
                      </div></div>
                     
                      <hr class="mt-2 mb-3"/>
                      <p class="fs-5"><span data-feather="edit-3"class="align-baseline"></span> Commento</p>
                      <div class="mb-3 row">
                      <label class="col-sm-3 col-md-1 col-form-label">Commento</label>
                      <div class="col-sm-3 col-md-3">
                      <p id="demo"></p>
                      <input type="text" required class="form-control"  name="commento" value="" size="30">
                      </div></div>
                     
                      <hr class="mt-2 mb-3"/>
                      <p class="fs-5"><span data-feather="briefcase"class="align-baseline"></span> Aziende</p>
                      <div class="mb-3 row">
                      <label class="col-sm-3 col-md-1 col-form-label">Azienda</label>
                      <div class="col-sm-3 col-md-2">
                     <select name="aziende" required class="form-control">';

                     $sqlAziende="select * from azienda";
                     $stmt = $conn->prepare($sqlAziende);
                     $stmt->execute();
                     $result = $stmt->get_result();
                       if($result->num_rows > 0){
                        while($row=$result->fetch_assoc()){
                            $id=$row["id"];
                            $nome=$row["denominazione_azienda"];
                            echo "<option value=$id>$nome</option>";
                            
                        }
                    }
                     echo'
                     </select>';
                     /*
                    </div>
                    <label class="col-sm-3 col-md-1 col-form-label">Indirizzo</label>
                    <div class="col-sm-3 col-md-3">
                    <select name="indirizzo" class="form-control">
                    <option value="INF">INFORMATICA</option>
                    <option value="ELE">ELETTRONICA</option>
                    <option value="AUT">AUTOMAZIONE</option>
                    <option value="TEL">TELECOMUNICAZIONE</option>
                    <option value="LIC">LICEO</option>
                    </select>
                    </div></label>*/
                    echo'
                    </div>
                    </div>
        
                 <hr class="mt-2 mb-3"/>
                      <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Docenti</p>
                      <div class="mb-3 row">
                      <label class="col-sm-3 col-md-1 col-form-label">Docente</label>
                      <div class="col-sm-3 col-md-2">
                     <select name="docenti" required class="form-control">';

                        $sqlDocenti="select * from persona join persona_ruolo on persona.id=persona_ruolo.idpersona where idruolo=2";
                        $stmt = $conn->prepare($sqlDocenti);
                        $stmt->execute();
                        $result = $stmt->get_result();
                          if($result->num_rows > 0){
                           while($row=$result->fetch_assoc()){
                            $id=$row["id"];
                            $nome=$row["nome"];
                            $cognome=$row["cognome"];
                            echo "<option value=$id>$nome $cognome</option>";
                           }
                        }

                     echo'
                     </select>
                      </div></div>
                 
                 <hr class="mt-2 mb-3"/>
                      <p class="fs-5"><span data-feather="users"class="align-baseline"></span> Tutor aziendali</p>
                      <div class="mb-3 row">
                      <label class="col-sm-3 col-md-auto col-form-label">Tutor aziendale</label>
                      <div class="col-sm-3 col-md-2">
                      <input type="text" required class="form-control"  name="tutoraz" value="">
                      </div>
                      </div>
                    </br>
                    </br>
                    </br>
                    </br> ';
                }
            
               
            ?>
               
                
                </nav>
    </main>

    
    <?php require("Include/menu.php");?>
<?php require("Include/footer.php");?>
    </body>

    </html>