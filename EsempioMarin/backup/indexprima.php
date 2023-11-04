<?php require("include/db_connection.inc") ?>
<!dovtype html>
	<head>
		<title>DB Connection</title>
	</head>
	<body>
		<center><h1>DB Connection</h1></center>
		<form method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
		<?php
			$sql="SELECT * FROM docente";
			$result = $conn->query($sql);
			echo "<label>Seleziona docente per visualizzare la residenza</label></br>";
			echo "<select name=\"docente\">";
			echo "<option value= \"-1\">-- Indirizzo Docenti --</option>";
			if($result->num_rows > 0){				
				while($row=$result->fetch_assoc()){
					echo '<option value="'.$row["id"].'">';
					echo $row["nome"].' '.$row["cognome"];
					echo "</option>";
				}
			}
			echo "</select>";
			?>
			<input type="Submit" name="submit" value="Apri dettaglio" />
			</br>
			</form>
			<?php
			if(isset($_POST["submit"])){
			?>
			<form method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
			<?php
			if(isset($_POST["submit"])){
				$id = $_POST["docente"];
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
		<input type="hidden" name="id value="<?php echo $id?>"/>
		<label>Cognome: </label>
		<input type="text" name="cognome" value="<?php echo $cognome ?>"/>
		</br>
		<label>Nome: </label>
		<input type="text" name="nome" value="<?php echo $nome ?>"/>
		</br>
		<label>Data Nascita: </label>
		<input type="date" name="datanascita" value="<?php echo $datanascita ?>"/>
		</br>
		<label>Codice Fiscale: </label>
		<input type="text" name="datanascita" value="<?php echo $codicefiscale ?>"/>
		</br>
		<label>Città: </label>
		<input type="text" name="datanascita" value="<?php echo $cittaresidenza ?>"/>
		</br>
		<label>Indirizzo: </label>
		<input type="text" name="indirizzo" value="<?php echo $indirizzo ?>"/>
		</br>
		
		<input type="Submit" name="salva" value="Salva" />
		</form>
		<?php
			} else if(isset($_POST["salva"])){
				//salvo dati docente
				$id = $_POST["id"];
				$sql="";
				if($id != -1){
					//se id!= -1 allora aggiorni i dati
					$sql="UPDATE docente SET";
					$sql.=", datanascita='".$_POST['datanascita']."'";
					$sql.=", codicefiscale='".$_POST['codicefiscale']."'";
					$sql.=", cittaresidenza='".$_POST['cittaresidenza']."'";
					$sql.=", indirizzo='".$_POST['indirizzo']."'";
					$sql.=" nome='".$_POST['nome']."'";;
					$sql.=", cognome='".$_POST['cognome']."'";
					
					$sql.= " where id=".$id;
				}else{
					//altrimenti inserisco nuovo docente
					$sql="INSERT INTO docente(id, datanascita, codicefiscale, cittaresidenza, indirizzo cognome, nome)values";
					$sql.="(NULL,'".$_POST["datanascita"]."','".$_POST["codicefiscale"]."','".$_POST["cittaresidenza"]."','".$_POST["indirizzo"]."','".$_POST["cognome"]."','".$_POST["nome"]."')";
				}
				echo "<p>$sql</p>";
				//eseguo la query
				$result = $conn->query($sql);
			}
		?>
	</body>
</html>