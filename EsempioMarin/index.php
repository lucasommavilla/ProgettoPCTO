<?php 
	require("include/db_connection.inc");
	session_start();
	if(!isset($_SESSION["varOrID"])){$_SESSION["varOrID"]=0;}
	if(!isset($_SESSION["varOrNome"])){$_SESSION["varOrNome"]=0;}
	if(!isset($_SESSION["varOrCog"])){$_SESSION["varOrCog"]=0;}
	if(!isset($_SESSION["varOrDNas"])){$_SESSION["varOrDNas"]=0;}
	if(!isset($_SESSION["varOrCitta"])){$_SESSION["varOrCitta"]=0;}
	if(!isset($_SESSION["varOrInd"])){$_SESSION["varOrInd"]=0;}
	if(!isset($_SESSION["varOrCodF"])){$_SESSION["varOrCodF"]=0;}
	if(!isset($_SESSION["sessCerca"])){$_SESSION["sessCerca"]="";}
	//$_SESSION[varOrID'];
	
	if(isset($_POST["esporta"])){
						$sql="select * from docente";
						$result = $conn->query($sql);
						//$mydate=getdate(date("U"));
						//$nomefileb = 'docente_'.$mydate["mday"].$mydate["mon"].$mydate["year"]."_".$mydate["hours"].$mydate["minutes"].$mydate["seconds"].'.csv';						
						$nomefileb = 'docente_backup.csv';
						$result = mysqli_query($conn, $sql);
						$row2 = mysqli_fetch_array($result, MYSQLI_ASSOC);
						$fp = fopen($nomefileb, 'w');
						$intestazione = array('ID', 'DATA NASCITA', 'CODICE FISCALE', 'CITTA', 'INDIRIZZO', 'NOME', 'COGNOME');
						fputcsv($fp, $intestazione, $separator = ";");
						while($row2=$result->fetch_assoc()){
							fputcsv($fp, $row2, $separator = ";");
							//fputcsv($fp, $row2["nome"]);
						}
						fclose($fp);
						
						$file_url = $nomefileb;
						header('Content-Type: txt/csv');
						header("Content-Transfer-Encoding: Binary");
						header("Content-disposition: attachment; filename=\"" . basename($file_url) . "\"");
						readfile($file_url);
						exit;
												
					}
?>
<!doctype html>
<html>
	<style>	
	tr:hover > td {
	background-color: #82b0e0;
	color: black;
	}
	th{
	color: #ffffff;
	}
	.bottone {
	  width: 120px;
	  height: 50px;
	  background-color: #FF0000;
	  background-image: url('immagine.gif');
	  background-repeat: no-repeat;
	  background-position: center center;
}
	</style>
	<head>
		<title>DB Connection Docenti</title>
		 <!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
			
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css" />
		<script src="bootstrap-5.1.3-dist/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<script>
		function mostraAlert() {
			document.getElementById("hidden_elimina").value = 0;
			var idel = document.getElementById("docente");
			console.log(idel);
			var r = confirm('Sei sicuro di voler eliminare il docente?');
			if (r == true) {
				document.getElementById("hidden_elimina").value = 1;
			}
		}
	</script>

	<body>
	<?php
	function generaTabella($result){
		echo '<div class="container">';
			echo '<div class="row justify-content-start">';
				echo '<div class="table-responsive-sm">';
					echo '<table class="table" border="1px" collapse="collapse">';
					echo '<tr bgcolor="#0d6efd">';
					echo '<th scope="col">Selezione</th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaId" value="ID"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaNome" value="Nome"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaCognome" value="Cognome"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaCitta" value="Città"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaIndirizzo" value="Indirizzo"/></th>';
					echo '<th scope="col"><input class="btn btn-primary" type="submit" name="ordinaCodicefiscale" value="Codice Fiscale"/></th>';
					echo "</tr>";
				echo '</div>';
					if($result->num_rows > 0){			
						$nriga=0;
						while($row=$result->fetch_assoc()){
							if($nriga%2 == 0){
								echo'<tr bgcolor="#ffffff">';	
							}else{
								echo'<tr bgcolor="#d9d9d9">';
							}
							//echo '<div class="form-check">';
							echo '<td><input class="form-check-input" type="radio" id="docente" name="docente" value="'.$row["id"].'"/></td>';
							//echo "</div>";
							echo '<td>'.htmlspecialchars($row["id"]).'</td>';
							echo '<td>'.htmlspecialchars($row["nome"]).'</td>';
							echo '<td>'.htmlspecialchars($row["cognome"]).'</td>';
							echo '<td>'.htmlspecialchars($row["datanascita"]).'</td>';
							echo '<td>'.htmlspecialchars($row["cittaresidenza"]).'</td>';
							echo '<td>'.htmlspecialchars($row["indirizzo"]).'</td>';
							echo '<div class="col-sm-2 text-truncate">';
							echo '<td>'.htmlspecialchars($row["codicefiscale"]).'</td>';
							echo '</div>';
							echo "</tr>";	
							$nriga = $nriga+1;
						}
					}
					echo "</table>";
				
			echo '</div>';
		echo '</div>';
	}
	
	function cerca($keyword){
		$keyword=$_POST["testocerca"];
					$sql='SELECT * FROM docente WHERE';
					$sql.=' cognome like "%'.$keyword.'%"';
					$sql.=' or nome like "%'.$keyword.'%"';
					$sql.=' or datanascita like "%'.$keyword.'%"';
					$sql.=' or codicefiscale like "%'.$keyword.'%"';
					$sql.=' or cittaresidenza like "%'.$keyword.'%"';
					$sql.=' or indirizzo like "%'.$keyword.'%"';
					$sql.=' or id like "%'.$keyword.'%"';
					//echo $sql;

					return $sql;
	}
?>

<?php
						if(isset($_POST["salva"])){
							
						//salvo dati docente
						if(isset($_POST["id"])){
							$id = $_POST["id"];
						}else{
							$id = -1;
						} 
						$sql="";
						if($id != -1){
							//se id!= -1 allora aggiorni i dati
							$sql="update docente set";
							$sql.=" datanascita=?";
							$sql.=", codicefiscale=?";
							$sql.=", cittaresidenza=?";
							$sql.=", indirizzo=?";
							$sql.=", cognome=?";
							$sql.=", nome=?";
							$sql.= " where id=?";
							$stmt = $conn->prepare($sql);
							$stmt->bind_param("ssssssi",$_POST["datanascita"] ,$_POST["codicefiscale"], $_POST["cittaresidenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"], $id);
						}else{
							//altrimenti inserisco nuovo docente
							$sql="insert into docente(datanascita, codicefiscale, cittaresidenza, indirizzo, cognome, nome)values(?,?,?,?,?,?)";
							$stmt = $conn->prepare($sql);
							$stmt->bind_param("ssssss",$_POST["datanascita"] ,$_POST["codicefiscale"], $_POST["cittaresidenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"]);
							
						}
						//echo "<p>$sql</p>";
						//eseguo la query
						$stmt->execute();
						$result = $stmt->get_result();
						//echo "<p>$result</p>";
						//header("Refresh:0");
						
					}else if(isset($_POST["btnfile"])){
						$uploadDir = __DIR__.'\uploads';
						//print_r($_FILES);
						foreach ($_FILES as $file) {
							if (UPLOAD_ERR_OK === $file['error']) {
								$fileName = basename($file['name']);
								move_uploaded_file($file['tmp_name'], $uploadDir.DIRECTORY_SEPARATOR.$fileName);
							}
						}
						
								$nomefile = 'uploads\\'.$fileName;
								//$handler = fopen($nomefile, 'r');
								$rowFile = file($nomefile);
								foreach ( $rowFile as $row ) {
									$row = str_replace('"', '', $row);
									// Separo le colonne
									$data = explode( ';', $row );
									$sql = 'INSERT INTO docente (datanascita, codicefiscale, cittaresidenza, indirizzo, nome, cognome) VALUES(?,?,?,?,?,?)';
									//$id = $data[0];
									$datanascita = $data[1];
									$codicefiscale = $data[2];
									$cittaresidenza = $data[3];
									$indirizzo = $data[4];
									$nome = $data[5];
									$cognome = $data[6];
									$stmt = $conn->prepare($sql);
									$stmt->bind_param("ssssss",$datanascita, $codicefiscale, $cittaresidenza, $indirizzo, $nome, $cognome);
									$stmt->execute();
									$result = $stmt->get_result();
								}
					}else if(isset($_POST["elimina"])){
						if(isset($_POST["docente"])){
							$id = $_POST["docente"];
						}else{
							$id = -1;
						} 
						//echo $id;
						$sql="";
						$elimina = $_POST["hidden_elimina"];
						
						if($elimina && $id!=-1){
							$sql = "delete from docente where id= ?";
							$stmt = $conn->prepare($sql);
							$stmt->bind_param("i", $id);
							$stmt->execute();
							$result = $stmt->get_result();
							//echo "<p>$sql</p>";
							//eseguo la query
							$result = $conn->query($sql);
							//echo "<p>$result</p>"; 
							//header("Refresh:0");
						}
					}
						
						
				?>

	
				<?php
				if(!isset($_POST["submit"])){
				?>
	<div class="container">
		<nav class="navbar">
		<a class="navbar-brand"></a>
          	<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
			  Options
			  <span class="navbar-toggler-icon" style="background-image: url('icon.png');"></span>
			</button>
			<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			  <div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Opzioni</h5>
				<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				  <li class="nav-item">
				  <b>-Importa da file</b>
					<form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
						<div class="input-group">
							<input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
							<button class="btn btn-outline-secondary" name="btnfile" type="submit" id="inputGroupFileAddon04">Carica</button>
						</div>
					</form>
					<br>
				  </li>
				  <li class="nav-item">
				  <b>-Esporta in csv</b>
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
		
		<nav class="navbar">
          	<div class="container-fluid">
				<form class="d-flex" method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
                    <input class="form-control me-2" name="testocerca" type="text" placeholder="Cerca" aria-label="Cerca">
                   	<button class="btn btn-outline-primary" type="submit" name="cerca">Cerca</button>
           		</form>	
				<form method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
				<div class="col">
					<div class="btn-group mb-3" role="group" aria-label="Basic outlined example">
						<input type="Submit" class="btn btn-outline-primary" name="submit" value="Modifica/Aggiungi" />
						<input type="hidden" id="idelimina" name="hidden_id" value="<?php echo $id?>"/>
						<input type="hidden" name="hidden_elimina" id="hidden_elimina"  value="0"/>
						<input type="Submit" onclick='mostraAlert()' class="btn btn-outline-danger" name="elimina" value="Elimina" />  
					</div>
				</div>

			</div>
        </nav>
	</div>
			
				<?php
				//ordinamento
					if(isset($_POST["ordinaId"])){
						$_SESSION['varOrID']+=1;
						$_SESSION["varOrNome"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrInd"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrID']%2 == 0){
							$sql="Select * from docente order by id DESC";
						}else{
							$sql="Select * from docente order by id ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaNome"])){
						$_SESSION['varOrNome']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrInd"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrNome']%2 == 0){
							$sql="Select * from docente order by nome DESC";
						}else{
							$sql="Select * from docente order by nome ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaCognome"])){
						$_SESSION['varOrCog']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrNome"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrInd"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrCog']%2 == 0){
							$sql="Select * from docente order by cognome DESC";
						}else{
							$sql="Select * from docente order by cognome ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaDatanascita"])){
						$_SESSION['varOrDNas']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrNome"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrInd"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrDNas']%2 == 0){
							$sql="Select * from docente order by datanascita DESC";
						}else{
							$sql="Select * from docente order by datanascita ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaCitta"])){
						$_SESSION['varOrCitta']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrNome"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrInd"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrCitta']%2 == 0){
							$sql="Select * from docente order by cittaresidenza DESC";
						}else{
							$sql="Select * from docente order by cittaresidenza ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaIndirizzo"])){
						$_SESSION['varOrInd']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrNome"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrCodF"]=0;
						if($_SESSION['varOrInd']%2 == 0){
							$sql="Select * from docente order by indirizzo DESC";
						}else{
							$sql="Select * from docente order by indirizzo ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
					}else if(isset($_POST["ordinaCodicefiscale"])){
						$_SESSION['varOrCodF']+=1;
						$_SESSION["varOrID"]=0;$_SESSION["varOrNome"]=0;$_SESSION["varOrCog"]=0;$_SESSION["varOrDNas"]=0;$_SESSION["varOrCitta"]=0;$_SESSION["varOrInd"]=0;
						if($_SESSION['varOrCodF']%2 == 0){
							$sql="Select * from docente order by codicefiscale DESC";
						}else{
							$sql="Select * from docente order by codicefiscale ASC";
						}
						$result = $conn->query($sql);
						generaTabella($result);
				?>
						
						
						
						
				<?php
				//ricerca		
					}else if(!isset($_POST["cerca"])){
						$sql="SELECT * FROM docente";
						$result = $conn->query($sql);
						generaTabella($result);
					}
					else if(isset($_POST["cerca"])){
					
					$_SESSION["sessCerca"]=$_POST["testocerca"];
					$sql=cerca($_POST["testocerca"]);
					$result = $conn->query($sql);
					generaTabella($result);
				}
				?>
					
					</form>
					</div>
						
				
					<?php
		} 
			if(isset($_POST["submit"])){
					?>
					
					<form method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
					<?php
					if(isset($_POST["submit"])){
						echo '';
						if(isset($_POST["docente"])){
							$id = $_POST["docente"];
						}else{
							$id = -1;
						}
						//recupero info docente con id selezionato
						$sql="SELECT * FROM docente WHERE id=".$id;
						$result = $conn->query($sql);
						$cognome ="";
						$nome ="";
						$datanascita ="";
						$cittaresidenza ="";
						$indirizzo ="";
						$codicefiscale ="";
						if($result->num_rows > 0){
							//mi aspetto di avere un solo record
							$row=$result->fetch_assoc();
							$cognome = $row["cognome"];
							$nome = $row["nome"];
							$datanascita = $row["datanascita"];
							$cittaresidenza = $row["cittaresidenza"];
							$indirizzo = $row["indirizzo"];
							$codicefiscale = $row["codicefiscale"];
						}
					}
				?>
				</br>
				<center>
				<h3>Modifica Docente</h3>
				</br>
				</center>
				<div class="row justify-content-center">	
				
				<input type="hidden" id="id" name="id" value="<?php echo $id?>"/>
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="text" class="form-control" name="cognome" id="cognome" placeholder="Cognome" value="<?php echo $cognome ?>">
						<label for="cognome">Cognome</label>
					</div>
					
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="text" class="form-control" name="nome" id="nome" placeholder="Nome" value="<?php echo $nome ?>">
						<label for="nome">Nome</label>
					</div>
					
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="date" class="form-control" name="datanascita" id="datanascita" placeholder="Data di Nascita" value="<?php echo $datanascita ?>">
						<label for="datanascita">Data Nascita</label>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="text" class="form-control" name="codicefiscale" id="codicefiscale" placeholder="Codice Fiscale" value="<?php echo $codicefiscale ?>">
						<label for="codicefiscale">Codice Fiscale</label>
					</div>
					
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="text" class="form-control" name="cittaresidenza" id="cittaresidenza" placeholder="Città" value="<?php echo $cittaresidenza ?>">
						<label for="cittaresidenza">Città</label>
					</div>
					
					<div class="col-md-3 col-sm-12 form-floating mb-3">
						<input type="text" class="form-control" name="indirizzo" id="indirizzo" placeholder="Indirizzo" value="<?php echo $indirizzo ?>">
						<label for="indirizzo">Indirizzo</label>
					</div>		
				</div>
				<div class="row justify-content-center">
				<div class="col-md-3 col-sm-6">
					<input class="btn btn-outline-primary" type="Submit" name="salva" value="Salva" />
				</div>
				<div class="col-md-3 col-sm-3"></div>
				<div class="col-md-3 col-sm-3"></div>
				</div>
				</form>
				<?php
					}
				?>
				
				
			</div>
		</div>	
		
	</body>
</html>