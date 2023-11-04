<?php  
  require_once("Include/funz_admin.inc");
  require("Include/db_connection.inc");

    
if (!isset($_SESSION["varOrNome"])) {
    $_SESSION["varOrNome"] = 0;
}
if (!isset($_SESSION["varOrCog"])) {
    $_SESSION["varOrCog"] = 0;
}
if (!isset($_SESSION["varOrTel"])) {
    $_SESSION["varOrTel"] = 0;
}
if (!isset($_SESSION["varOrCod"])) {
  $_SESSION["varOrCod"] = 0;
}
//$_SESSION[varOrID'];

if (isset($_POST["esporta"])) {
    $sql = "select * from persona join persona_ruolo on id=idpersona and idruolo = 3";
    $result = $conn->query($sql);
    //$mydate=getdate(date("U"));
    //$nomefileb = 'persona_'.$mydate["mday"].$mydate["mon"].$mydate["year"]."_".$mydate["hours"].$mydate["minutes"].$mydate["seconds"].'.csv';						
    $nomefileb = 'persona_backup.csv';
    $result = mysqli_query($conn, $sql);
    $row2 = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $fp = fopen($nomefileb, 'w');
    $intestazione = array('ID', 'NOME', 'COGNOME', 'DATA NASCITA', 'CODICE FISCALE', 'SESSO', 'CELLULARE', 'LOGIN', 'PASSWORD', 'MATRICOLA', 'CITTADINANZA', 'CAP', 'TELEFONO', 'EMAIL', 'INDIRIZZO', 'CITTA', 'TUT_IDAZIENDA');
    fputcsv($fp, $intestazione, $separator = ";");
    while ($row2 = $result->fetch_assoc()) {
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
<html lang="en">
  <head>  
    <title>Segretari</title>
    <?php require("Include/navbar.php");?>
  </head>
  <body>

  <?php require("Include/head.php");?>

<div class="container-fluid">
  <div class="row">
  <?php require("Include/menu.php");?>
	<?php
    function generaTabella($result)
    {
        //echo '<div class="container">';
       // echo '<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">';
        echo '<div class="justify-content-center">';
            echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                echo '<tr bgcolor="#252526">';
                //echo '<th scope="col" style="background-color:#252526; color:#ffffff">Selezione</th>';
                //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaId" value="ID"/></th>';
                echo '<th style="width: 3.66%"></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Nome"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Cognome"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaTelefono" value="Telefono"/></th>';
                //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaDatanascita" value="Data Nascita"/></th>';
                //echo '<th ><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="Città"/></th>';
                //echo '<th scope="col"><input class="btn" style="background-color:#252526; color:white" type="submit" name="ordinaIndirizzo" value="Indirizzo"/></th>';
                echo '<th scope="col"><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCodicefiscale" value="Codice Fiscale"/></th>';
                echo "</tr>";
                //echo '</div>';
                if ($result->num_rows > 0) {
                    $nriga = 0;
                    while ($row = $result->fetch_assoc()) {
                        //echo '<div class="form-check">';
                        //echo '<td><input class="form-check-input" type="radio" id="persona" name="persona" value="' . $row["id"] . '"/></td>';
                        //echo "</div>";
                        echo '<td><a href="segretario-dettaglio.php?id='.htmlspecialchars($row["id"]).'"><span data-feather="edit"></span></a></td>';
                        //echo '<td>' . htmlspecialchars($row["id"]) . '</td>';
                        echo '<td>' . htmlspecialchars($row["nome"]) . '</td>';
                        echo '<td>' . htmlspecialchars($row["cognome"]) . '</td>';
                        echo '<td>' . htmlspecialchars($row["telefono"]) . '</td>';
                        //echo '<td>' . htmlspecialchars($row["datanascita"]) . '</td>';
                        //echo '<td>' . htmlspecialchars($row["residenza"]) . '</td>';
                        //echo '<td>' . htmlspecialchars($row["indirizzo"]) . '</td>';
                        //echo '<div class="col-sm-2 text-truncate">';
                        echo '<td>' . htmlspecialchars($row["codicefiscale"]) . '</td>';
                        //echo '</div>';
                        
                        echo "</tr>";
                    }
                }
            echo "</table>";
        echo '</div>';
        echo '<div style="top:50%; text-align:center;">';
        echo '<h1 size="200px">PAGINA IN COSTRUZIONE</h1>';
        echo '<img src="lavori_in_corso_rid.jpg">';
        echo '</div>';
    }
   

    function cerca($keyword)
    {
        $keyword = $_POST["testocerca"];
        $sql = 'SELECT * FROM persona join persona_ruolo on id=idpersona and idruolo = 3 WHERE';
        $sql .= ' cognome like "%' . $keyword . '%"';
        $sql .= ' or nome like "%' . $keyword . '%"';
        //$sql .= ' or datanascita like "%' . $keyword . '%"';
        $sql .= ' or telefono like "%' . $keyword . '%"';
        $sql .= ' or codicefiscale like "%' . $keyword . '%"';
        //$sql .= ' or residenza like "%' . $keyword . '%"';
        //$sql .= ' or indirizzo like "%' . $keyword . '%"';
        //$sql .= ' or id like "%' . $keyword . '%"';
        //echo $sql;

        return $sql;
    }
    ?>

    <?php
    if (isset($_POST["salva"])) {

        //salvo dati persona
        if (isset($_POST["id"])) {
            $id = $_POST["id"];
        } else {
            $id = -1;
        }
        $sql = "";
        if ($id != -1) {
            //se id!= -1 allora aggiorni i dati
            $sql = "update persona set";
            $sql .= " datanascita=?";
            $sql .= ", codicefiscale=?";
            $sql .= ", residenza=?";
            $sql .= ", indirizzo=?";
            $sql .= ", cognome=?";
            $sql .= ", nome=?";
            $sql .= " where id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssssi", $_POST["datanascita"], $_POST["codicefiscale"], $_POST["residenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"], $id);
        } else {
            //altrimenti inserisco nuovo persona
            $sql = "insert into persona(datanascita, codicefiscale, residenza, indirizzo, cognome, nome)values(?,?,?,?,?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssss", $_POST["datanascita"], $_POST["codicefiscale"], $_POST["residenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"]);
        }
        //echo "<p>$sql</p>";
        //eseguo la query
        $stmt->execute();
        $result = $stmt->get_result();
        //echo "<p>$result</p>";
        //header("Refresh:0");

    } else if (isset($_POST["btnfile"])) {
        $uploadDir = __DIR__ . '\uploads';
        //print_r($_FILES);
        foreach ($_FILES as $file) {
            if (UPLOAD_ERR_OK === $file['error']) {
                $fileName = basename($file['name']);
                move_uploaded_file($file['tmp_name'], $uploadDir . DIRECTORY_SEPARATOR . $fileName);
            }
        }

        $nomefile = 'uploads\\' . $fileName;
        //$handler = fopen($nomefile, 'r');
        $rowFile = file($nomefile);
        foreach ($rowFile as $row) {
            $row = str_replace('"', '', $row);
            // Separo le colonne
            $data = explode(';', $row);
            $sql = 'INSERT INTO persona (nome, cognome, datanascita, codicefiscale, sesso, cellulare, login, password, al_matricola, al_cittadinanza, cap, telefono, email, indirizzo, residenza, tut_idazienda) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
            //$id = $data[0];
            $nome = $data[1];
            $cognome = $data[2];
            $datanascita = $data[3];
            $codicefiscale = $data[4];
            $sesso = $data[5];
            $cellulare = $data[6];
            $login = $data[7];
            $password = $data[8];
            $al_matricola = $data[9];
            $al_cittadinanza = $data[10];
            $cap = $data[11];
            $telefono = $data[12];
            $email = $data[13];
            $indirizzo = $data[14];
            $residenza = $data[15];
            $tut_idazienda = $data[16];
            

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssssssssssssss", $nome, $cognome, $datanascita, $codicefiscale, $sesso, $cellulare, $login, $password, $al_matricola, $al_cittadinanza, $cap, $telefono, $email, $indirizzo, $residenza, $tut_idazienda);
            $stmt->execute();
            $result = $stmt->get_result();
            $last_id = $conn->insert_id;
            $sql="INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES ('3', '".$last_id."');";
            $result = $conn->query($sql);
            $last_id = $conn->insert_id;
            $sql="INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES ('3', '".$last_id."');";
            $result = $conn->query($sql);
            
        }
    } else if (isset($_POST["elimina"])) {
        if (isset($_POST["persona"])) {
            $id = $_POST["persona"];
        } else {
            $id = -1;
        }
        //echo $id;
        $sql = "";
        $elimina = $_POST["hidden_elimina"];

        if ($elimina && $id != -1) {
            $sql = "delete from persona where id= ?";
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
    if (!isset($_POST["submit"])) {
    ?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
                <h1 class="h2">Segretari</h1>
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
                                <b>Aggiungi un segretario</b>
                                  <div class="row justify-content-start">
                                    <form method="POST" action="segretario-dettaglio.php" enctype="multipart/form-data">
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
	  <div>
            
            
            <nav class="navbar">
                <div class="container-fluid">
                    <form class="d-flex" method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
                        <input class="form-control" name="testocerca" type="text" placeholder="Cerca" aria-label="Cerca">
                        <button class="btn btn-outline-secondary" type="submit" name="cerca">Cerca</button>
                    </form>
                    
                    <form class="d-flex" method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
                </div>
            </nav>
        </div>
		<?php
        //ordinamento
        if (isset($_POST["ordinaNome"])) {
            $_SESSION['varOrNome'] += 1;
            $_SESSION["varOrCog"] = 0;
            $_SESSION["varOrTel"] = 0;
            $_SESSION["varOrCod"] = 0;
            if ($_SESSION['varOrNome'] % 2 == 0) {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by nome DESC";
            } else {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by nome ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
        } else if (isset($_POST["ordinaCognome"])) {
            $_SESSION['varOrCog'] += 1;
            $_SESSION["varOrNome"] = 0;
            $_SESSION["varOrTel"] = 0;
            $_SESSION["varOrCod"] = 0;
            if ($_SESSION['varOrCog'] % 2 == 0) {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by cognome DESC";
            } else {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by cognome ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
        } else if (isset($_POST["ordinaTelefono"])) {
            $_SESSION["varOrTel"] += 1;
            $_SESSION["varOrCod"] = 0;
            $_SESSION["varOrNome"] = 0;
            $_SESSION["varOrCog"] = 0;
            if ($_SESSION['varOrTel'] % 2 == 0) {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by telefono DESC";
            } else {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by telefono ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
	
        } else if (isset($_POST["ordinaCodicefiscale"])) {
            $_SESSION["varOrCod"] += 1;
            $_SESSION["varOrTel"] = 0;
            $_SESSION["varOrNome"] = 0;
            $_SESSION["varOrCog"] = 0;
            if ($_SESSION['varOrCod'] % 2 == 0) {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by codicefiscale DESC";
            } else {
                $sql = "Select * from persona join persona_ruolo on id=idpersona and idruolo = 4 order by codicefiscale ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
	
        } else if (!isset($_POST["cerca"])) {            //ricerca	
            $sql = 'select * from persona join persona_ruolo on id=idpersona and idruolo = 4';
            $result = $conn->query($sql);
            generaTabella($result);
        } else if (isset($_POST["cerca"])) {

            $_SESSION["sessCerca"] = $_POST["testocerca"];
            $sql = cerca($_POST["testocerca"]);
            $result = $conn->query($sql);
            generaTabella($result);
        }
    }
        ?>

        </form>
        </div>


        </div>
        </div>
    </main>
  </div>
  <?php require("Include/footer.php");?>
  </body>
</html>
