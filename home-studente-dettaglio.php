<?php   
	require("Include/db_connection.inc");  
   //entry.php  
   session_start();  
   if(!isset($_SESSION["username"]))  
   {  
        header("location:login.php?action=login");  
   }  
   ?>  
<!doctype html>
<html lang="en">
  <head>
    <title>Planck PCTO</title>
    <?php require("Include/head-studente.php");?>
  </head>
  <body>
    
  <?php require("Include/navbar-studente.php");?>

<div class="container-fluid">
  
    <?php require("Include/menu-studente.php");?>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<?php
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
						<div class="col-sm-1 col-md-1">
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
		?>
      	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Informazioni personali</h1>
      	</div>
	  	<div class="row justify-content-center">
		</div>
		<div class="row justify-content-start mb-3">
		<div class="mb-4 clearfix">
                <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                  <div class="btn-group me-2" role="group" aria-label="First group">
                          <button type="button" onclick="location.href='home-studente.php'" name="indietro" value="" class="btn btn-secondary">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                          </svg>
						  Torna alla home
                          </button>
                  </div>
              </div>
                <input type="button" onclick="location.href='logout.php'" name="disconnetti" value="Disconnettiti" class="btn btn-danger float-end">
            </div>
		</div>
		<?php
			$sql = 'select * from persona where id=(select id from persona where login="'.$_SESSION["username"].'");';
      		$result = $conn->query($sql);
			generaDettaglioVisualizzazione($result);
		?>
    </main>
  
</div>
  <?php require("Include/footer.php");?>
</body>
</html>
