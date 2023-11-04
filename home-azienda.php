<?php   
	require("Include/db_connection.inc");  
   //entry.php  
   session_start();  
   if(!isset($_SESSION["username"]))  
   {  
        header("location:login.php?action=login");  
   }  
   if(!isset($_SESSION["aziendaSelezionata"])){
		$_SESSION["aziendaSelezionata"]= -1;
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
	<?php
			
			function generaDettaglioHomeStudente($idAziendaSelezionata){
				require("Include/db_connection.inc"); 
				$sql='select * from azienda az join assegnazione ass on az.id=ass.id_azienda and ass.id_alunno = (select id from persona where login="'.$_SESSION["username"].'") '.$idAziendaSelezionata.'';
				$sqlAzienda = $conn->query($sql);
				$sql='select * from persona p join assegnazione ass on p.id=ass.id_docente_tutor and ass.id_alunno = (select id from persona where login="'.$_SESSION["username"].'") '.$idAziendaSelezionata.'';
				$sqlDocente = $conn->query($sql);
				$sql='select * from persona p join assegnazione ass on p.id=ass.id_azienda_tutor and ass.id_alunno = (select id from persona where login="'.$_SESSION["username"].'") '.$idAziendaSelezionata.'';
				$sqlTutorAziendale = $conn->query($sql);
				$nomePersonaDocente = "";
				$cognomeDocente = "";
				$cellulareDocente = "";
				$telefonoDocente = "";
				$emailDocente = "";

				$nomePersonaTutorAziendale = "";
				$cognomeTutorAziendale = "";
				$cellulareTutorAziendale = "";
				$telefonoTutorAziendale = "";
				$emailTutorAziendale = "";

				$nomeAzienda = "";
				$indirizzo = "";
				$leg_nomecognome = "";
				$dataInizio = "";
				$dataFine = "";
				$comune = "";

				if ($sqlAzienda->num_rows > 0) {
					while ($row = $sqlAzienda->fetch_assoc()) {
					  $row2 = $sqlTutorAziendale->fetch_assoc();
					  $row3 = $sqlDocente->fetch_assoc();
					  $indirizzo = htmlspecialchars($row["indirizzo"]);
					  $comune =  htmlspecialchars($row["comune"]);
					  $nomeAzienda = htmlspecialchars($row["denominazione_azienda"]);
					  $leg_nomecognome = htmlspecialchars($row["leg_nomecognome"]);
					  $dataInizio = htmlspecialchars($row["data_inizio"]);
					  $dataFine = htmlspecialchars($row["data_fine"]);

					  $cellulareDocente = htmlspecialchars($row2["cellulare"]);
					  $telefonoDocente = htmlspecialchars($row2["telefono"]);
					  $nomePersonaDocente = htmlspecialchars($row2["nome"]);
					  $cognomeDocente = htmlspecialchars($row2["cognome"]);
					  $emailDocente = htmlspecialchars($row2["email"]);
					
					  $cellulareTutorAziendale = htmlspecialchars($row3["cellulare"]);
					  $telefonoTutorAziendale = htmlspecialchars($row3["telefono"]);
					  $nomePersonaTutorAziendale = htmlspecialchars($row3["nome"]);
					  $cognomeTutorAziendale = htmlspecialchars($row3["cognome"]);
					  $emailTutorAziendale = htmlspecialchars($row3["email"]);
					} 
					
				  ?>
				  <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
				  
				  
				  <div class="justify-content-center">
				  <div class="mb-4 clearfix">
				  		<p class="fs-5 float-start"><span data-feather="briefcase"class="align-baseline"></span> Azienda a cui sei assegnato (dal <?php echo substr($dataInizio, 0, 10)?> al <?php echo substr($dataFine, 0, 10)?>)</p>
						<button type="button" onclick='location.href="home-studente-doc-personali.php"' name="docAzienda" value="" class="btn btn-primary float-end">
							Vedi Documenti
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
								<path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
							</svg>
                        </button>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Nome</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="nomeAzienda" value="<?php echo $nomeAzienda ?>">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Indirizzo</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="indirizzo" value="<?php echo $indirizzo ?>, <?php echo $comune ?>">
						</div>
					</div>
					<div class="mb-3 row">
						  <label class="col-sm-3 col-md-1 col-form-label">Rappr.</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="leg_nomecognome" value="<?php echo $leg_nomecognome ?>">
						  </div>
						  <label class="col-sm-3 col-md-1 col-form-label"></label>
						  <div class="col-sm-3 col-md-3">
						  </div>
					</div>

					<hr class="mt-2 mb-3"/>
					<p class="fs-5"><span data-feather="user"class="align-baseline"></span> Il tuo Tutor Aziendale </p>
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Nome</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="nomePersonaTutorAziendale" value="<?php echo $nomePersonaTutorAziendale ?>">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Cognome</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="cognomeTutorAziendale" value="<?php echo $cognomeTutorAziendale ?>">
						</div>
					</div>
					<div class="mb-3 row">
						  <label class="col-sm-3 col-md-1 col-form-label">Mail</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="emailTutorAziendale" value="<?php echo $emailTutorAziendale ?>">
						  </div>
						  <label class="col-sm-3 col-md-1 col-form-label">Cellulare</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="cellulareTutorAziendale" value="<?php echo $cellulareTutorAziendale?>">
						  </div>
					</div>
					<hr class="mt-2 mb-3"/>
					<p class="fs-5"><span data-feather="user"class="align-baseline"></span> Il tuo Tutor Scolastico </p>
					<div class="mb-3 row">
						<label class="col-sm-3 col-md-1 col-form-label">Nome</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="nomePersonaDocente" value="<?php echo $nomePersonaDocente ?>">
						</div>
						<label class="col-sm-3 col-md-1 col-form-label">Cognome</label>
						<div class="col-sm-3 col-md-3">
							<input type="text" readonly class="form-control" name="cognomeDocente" value="<?php echo $cognomeDocente ?>">
						</div>
					</div>
					<div class="mb-3 row">
						  <label class="col-sm-3 col-md-1 col-form-label">Mail</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="emailDocente" value="<?php echo $emailDocente ?>">
						  </div>
						  <label class="col-sm-3 col-md-1 col-form-label">Cellulare</label>
						  <div class="col-sm-3 col-md-3">
							  <input type="text" readonly class="form-control" name="cellulareDocente" value="<?php echo $cellulareDocente?>">
						  </div>
					</div>
				  </form>	
				  </br>
				  </br>
				  </br>
				  </br>
				  <?php
					
				}
		  }

		  
		?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

      	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        	<h1 class="h2">Home</h1>
      	</div>
		<?php
			$sql='select nome, cognome from persona where id=(select id from persona where login="'.$_SESSION["username"].'");';
			$nome="";
			$cognome="";
			$result = $conn->query($sql);
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$nome = htmlspecialchars(ucwords($row["nome"]));
				$cognome = htmlspecialchars(ucwords($row["cognome"]));
			} 			
		?>
	
		<div class="row justify-content-center">
			<div class="col col-md-auto col-sm-auto col-lg-auto">
				<h1 class="h2 mb-3 "><?php echo $nome.' '.$cognome?></h1>
			</div>
		</div>
		<?php
		/*	
			//$sql='select id_azienda from assegnazioni where id_alunno=(select id from persona where login="'.$_SESSION["username"].'");';
			$idAziendaSelezionata="";
			$sql='select az.id, nome from azienda az join assegnazione ass on az.id=ass.id_azienda and ass.id_alunno = (select id from persona where login="'.$_SESSION["username"].'") order by ass.data_fine DESC';
			$sqlAzienda = $conn->query($sql);
			if(isset($_POST["aziende"])){
				$_SESSION["aziendaSelezionata"] = $_POST["aziende"]; 
			}if(isset($_POST["aziende"])){
				//echo("<script>console.log('PHP: ".$_POST["aziende"]."');</script>");
				//$_SESSION["aziendaSelezionata"] = $_POST["aziende"]; 
				//echo("<script>console.log('PHP: ".$_SESSION["aziendaSelezionata"]."');</script>");
				$idAziendaSelezionata='AND ass.id_azienda='.$_POST["aziende"].'';
				generaDettaglioHomeStudente($idAziendaSelezionata);
			}else if($_SESSION["aziendaSelezionata"] != -1){
				//echo("<script>console.log('PHP: ".$_SESSION["aziendaSelezionata"]."');</script>");
				$idAziendaSelezionata='AND ass.id_azienda='.$_SESSION["aziendaSelezionata"].'';
				generaDettaglioHomeStudente($idAziendaSelezionata);
			}else{
				generaDettaglioHomeStudente($idAziendaSelezionata);
			}*/
		?>
    </main>
  
</div>
  <?php require("Include/footer.php");?>
</body>
</html>
