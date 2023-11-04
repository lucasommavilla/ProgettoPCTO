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
    <?php require("Include/head.php");?>
  </head>
  <body>
    
  <?php require("Include/navbar-azienda.php");?>

<div class="container-fluid">
  
    <?php require("Include/menu-azienda.php");?>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<?php
			function generaDettaglioVisualizzazione($result){
				$denominazione_azienda = "";
				$settore = "";
				$indirizzo = "";
				$cap = "";
				$comune = "";
				$referente_aziendale = "";
				$tutor_aziendale = "";
				$telefono = "";
                $email = "";
				$sito = "";
                $leg_iva = "";
                $rapleg_convenzioneprotocolo = "";
                $rapleg_codicefiscale = "";
                $rapleg_convenzionedata = "";

				  if ($result->num_rows > 0) {
					  $row = $result->fetch_assoc();
					  $denominazione_azienda = htmlspecialchars($row["denominazione_azienda"]);
					  $settore = htmlspecialchars($row["settore"]);
					  $indirizzo = htmlspecialchars($row["indirizzo"]);
					  $cap = htmlspecialchars($row["cap"]);
					  $comune = htmlspecialchars($row["comune"]);
					  $referente_aziendale = htmlspecialchars($row["referente_aziendale"]);
					  $tutor_aziendale = htmlspecialchars($row["tutor_aziendale"]);
					  $telefono = htmlspecialchars($row["telefono"]);
					  $email = htmlspecialchars($row["email"]);
					  $sito = htmlspecialchars($row["sito"]);
					  $leg_iva = htmlspecialchars($row["iva"]);
                      $rapleg_convenzioneprotocolo = htmlspecialchars($row["convenzione_protocollo"]);
                      $rapleg_codicefiscale = htmlspecialchars($row["codice_fiscale"]);
                      $rapleg_convenzionedata = htmlspecialchars($row["data_convenzione"]);
				  } 
				  echo '
				  <div class="justify-content-center">
				  <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Dati anagrafici</p>
					<div class="mb-3 row">
						<label class="col-md-1 col-sm-3 col-form-label">Denominazione Azienda</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly id="denominazione_azienda" class="form-control" name="denominazione_azienda" value="'. $denominazione_azienda .'">
						</div>
						<label class="col-sm-3 col-md-1  col-form-label">Settore</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly id="settore" class="form-control" name="settore" value="'. $settore .'">
						</div>
					</div>
	  
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Indirizzo</label>
						<div class="col-sm-3 col-md-3">
							<input type="date" readonly class="form-control" name="indirizzo" value="'. $indirizzo .'">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Cap</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="cap" value="'. $cap .'">
						</div>
					</div>
	  
					<div class=" mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Comune</label>
						<div class="col-sm-1 col-md-1">
							<input type="text" readonly class="form-control" name="comune" value="'. $comune .'">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label"></label>
						<div class="col-sm-3 col-md-3">
						  
						</div>
					</div>
					<hr class="mt-2 mb-3"/>
					<p class="fs-5"><span data-feather="phone"class="align-baseline"></span> Contatti</p>
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Referente Aziendale</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="referente_aziendale" value="'. $referente_aziendale .'">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Tutor Aziendale</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="Tutor_aziendale" value="'. $tutor_aziendale .'">
						</div>
					</div>
	  
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Telefono</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="telefono" value="'. $telefono .'">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label"></label>
						<div class="col-sm-3 col-md-3">
						  
						</div>
					</div>
					<hr class="mt-2 mb-3"/>
					<p class="fs-5"><span data-feather="home"class="align-baseline"></span> Residenza</p>
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Email</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="email" value="'. $email .'">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Sito</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="sito" value="'. $sito .'">
						</div>
					</div>
					<div class="mb-3 row">
						  <label class="col-sm-3 col-md-1 col-form-label">IVA</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="leg_iva" value="'. $leg_iva .'">
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
                          <button type="button" onclick="location.href='home-azienda.php'" name="indietro" value="" class="btn btn-secondary">
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
			$sql = 'select * from azienda where id=(select id from azienda where login="'.$_SESSION["username"].'");';
      		$result = $conn->query($sql);
			generaDettaglioVisualizzazione($result);
		?>
    </main>
  
</div>
  <?php require("Include/footer.php");?>
</body>
</html>
