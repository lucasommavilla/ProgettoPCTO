<?php  
  require_once("Include/funz_admin.inc");
  require("Include/db_connection.inc");

   ?> 
<!doctype html>
<html lang="en">
  <head>
    <title>Report attivita</title>
	
    <?php require("Include/head.php");?>
    
  </head>
  <body>
  
<?php require("Include/navbar.php")?>

<div class="container-fluid">
  <div class="row">
  
 
    <?php require("Include/menu.php");?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">


    <?php
        $id=$_GET["id"];
        $sql2="select nome, cognome from persona where id=".$id;
        $stmt = $conn->prepare($sql2);
        $stmt->execute();
        $result = $stmt->get_result();

     if($result->num_rows > 0){
        while($row=$result->fetch_assoc()){
            $nome=$row["nome"];
            $cognome=$row["cognome"];
        }
     }
     $sql3 = "select idclasse from classe_studente where idpersona=".$id;
     $stmt = $conn->prepare($sql3);
     $stmt->execute();
     $result2 = $stmt->get_result();

  if($result2->num_rows > 0){
     while($row=$result2->fetch_assoc()){
         $idclasse=$row["idclasse"];
     }
      
     $sql4="select sezione from classe where id =".$idclasse;
     $stmt = $conn->prepare($sql4);
     $stmt->execute();
     $result3 = $stmt->get_result();

  if($result3->num_rows > 0){
     while($row=$result3->fetch_assoc()){
         $sezione=$row["sezione"];
     }
  }
  }
  else{
    $sezione="";
  }

        ?>
                <h1 class="h2">Report attivit&agrave PCTO: <?php echo"$nome $cognome $sezione";?></h1>
             
               
            </nav>
            
          <?php
$id=$_GET["id"];
echo'<form method="POST">';

echo'<div class="mb-4 clearfix">';
 echo '<form method="POST">';
 echo'    <a href="nuova-assegnazione.php?id='.$id.'"><span data-feather="plus-circle"></span></a> <i>AGGIUNGI ATTIVIT&Agrave PCTO </i>
</br></br>';
if(isset($_GET["flag"])){
 echo'<button type="button" name="indietro" value="Indietro" onclick="location.href=\'studenti.php\'" class="btn btn-secondary float-start">';
 echo '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
 <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
 </svg></button></div>';
}
else{
  echo'<button type="button" name="indietro" value="Indietro" onclick="location.href=\'studenti-dettaglio.php?id=' . $id . '\'" class="btn btn-secondary float-start">';
  echo '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
  </svg></button></div>';
}

 
              ?>

    <nav class="navbar col-md-9"  >
   
   
          

         <hr>
                <?php
                $id=$_GET["id"]; 
      $sql= 'select assegnazione.*, azienda.denominazione_azienda from assegnazione join azienda on assegnazione.id_azienda=azienda.id where id_alunno='.$id;
              $stmt = $conn->prepare($sql);
              $stmt->execute();
              $result = $stmt->get_result();

           if($result->num_rows > 0){
                echo "</br></br></br></br></br>";
               
                echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                    echo '<tr bgcolor="#252526">';
                    echo '<th style="width: 3.66%"></th>'; 
                    
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Azienda"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaAnno" value="Data inizio"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Data fine"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaTutor" value="Tutor Aziendale"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
                    echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="Commento"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaIndirizzo" value="Indirizzo"/></th>';
                    //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaCodicefiscale" value="Codice Fiscale"/></th>';
                    echo "</tr>";
                   while($row=$result->fetch_assoc()){
                            
                              echo'<tr id="'.$row['id'].'"><td><a href="assegnazione.php?id_assegnazione='.htmlspecialchars($row["id"]).'"><span data-feather="edit"></span></a></td><td>'.$row['denominazione_azienda'].'</td><td>'.$row['data_inizio'].'</td><td>'.$row['data_fine'].'</td><td>'.$row['tutor'].'</td><td>'.$row['Commento'].'</td></tr>';
      } 
      echo "</table>";

    }
      else{
        echo '<div class="col-md-12 justify-content-center">';
        echo'<h5>Non è presente alcuna attività!</div>';
      }
     

    ?>

</nav>

</main>

    <?php require("Include/footer.php");?>
</body>
    </html>