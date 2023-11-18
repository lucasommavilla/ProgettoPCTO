<?php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");

?>
<!doctype html>
<html lang="en">
  <head>
    <title>Classi</title>
	
    <?php require("Include/head.php");?>
    
  </head>
  <body>

<?php require("Include/navbar.php")?>

<div class="container-fluid">
  <div class="row">
  

    <?php require("Include/menu.php");?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
       
                <h1 class="h2">Classi</h1>
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
                                <b>Aggiungi una classe </b>
                                <div class="row justify-content-start">
                                    <form method="POST" action="classi-dettaglio.php" enctype="multipart/form-data">
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
            </nav>
    <nav class="navbar col-md-9"  >
   
               
          

         <hr>
                <?php
      $sql= "select nome,cognome,classe.* from persona right join classe on classe.id_docente = persona.id order by anno desc,sezione asc limit 100;";
              $stmt = $conn->prepare($sql);
              $stmt->execute();
              $result = $stmt->get_result();

           if($result->num_rows > 0){
                echo "</br></br></br>";
                echo '<div class="col-md-12 justify-content-center">';
                echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                    echo '<tr bgcolor="#252526">';
                    echo '<th style="width: 3.66%"></th>';
                    echo '<th style="width: 3.66%"></th>';
                    
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Classe"/>Classe</th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaAnno" value="Anno"/>Anno</th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Coordinatore"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
                    //echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="ID coordinatore"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaIndirizzo" value="Indirizzo"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaCodicefiscale" value="Codice Fiscale"/></th>';
                    echo "</tr>";
                   while($row=$result->fetch_assoc()){
                            if(is_null($row['id_docente'])){
                                   $docente="------";
                                   //$id_coordinatore="------";
                              }
                            else{
                                   $docente=''.$row['nome'];
                                   $docente.=' '.$row['cognome'];
                                   //$id_coordinatore="".$row['id_docente'];
                              }
                              
                              echo'<tr id="'.$row['id'].'"><td><a href="classi-dettaglio.php?id='.htmlspecialchars($row["id"]).'"><span data-feather="edit"></span></a></td><td><a href=studenti.php?classe='.$row['sezione'].'><span data-feather="users"></span></a></td><td>'.$row['sezione'].'</td><td>'.$row['anno'].'</td><td>'.$docente.'</td><td>'/*.$id_coordinatore.'</td></tr>'*/;
      } 


    }

      echo "</table>";

    ?>

</nav>
</main>
    <?php require("Include/footer.php");?>
</body>
    </html> 