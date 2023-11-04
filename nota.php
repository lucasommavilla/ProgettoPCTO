<?php  
  require("Include/db_connection.inc");
  require_once("Include/funz_admin.inc");
  require_once("Include/db_connection.inc");

if (!isset($_SESSION["varOrCognome"])) {
    $_SESSION["varOrCognome"] = 0;
}
if (!isset($_SESSION["varOrTitolo"])) {
    $_SESSION["varOrTitolo"] = 0;
}
if (!isset($_SESSION["varOrDtins"])) {
    $_SESSION["varOrDtins"] = 0;
}
if (!isset($_SESSION["varOrDtscad"])) {
    $_SESSION["varOrDtscad"] = 0;
}

if((!isset($_SESSION["idaziendapernota"]))||($_SESSION["idaziendapernota"]!=$_GET['id'])) {
    $_SESSION["idaziendapernota"]=$_GET['id'];
}

if (isset($_POST["esporta"])) {
    $sql = 'SELECT nota.idnota, persona.cognome, persona.nome, nota.titolo, nota.descrizione, nota.data, nota.scadenza FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=?';
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $_GET['id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $nomefileb = 'nota_azienda_'.$_SESSION['nomeaziendausata'].'_backup.csv';
    $row2 = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $fp = fopen($nomefileb, 'w');
    $intestazione = array('ID', 'COGNOME', 'NOME', 'TITOLO', 'DESCRIZIONE', 'DATA INSERIMENTO', 'DATA SCADENZA');
    fputcsv($fp, $intestazione, $separator = ";");
    if ($result->num_rows > 0) {
        fputcsv($fp, $row2, $separator = ";");
        while ($row2 = $result->fetch_assoc()) {
            fputcsv($fp, $row2, $separator = ";");
        }
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
    <title>Note</title>
	
    <?php require("Include/head.php");?>
    
  </head>
  <body>

<?php require("Include/navbar.php")?>

<div class="container-fluid">
  <div class="row">
    <?php require("Include/menu.php");?>
	<?php
    function generaTabella($result)
    {
        echo '<div class="justify-content-center">';
            echo '<table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                echo '<tr bgcolor="#252526">';
                echo '<th style="width: 3.66%"></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Creatore nota"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaTitolo" value="Panoramica"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaInserimento" value="Data inserimento"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaScadenza" value="Data scadenza"/></th>';
                echo "</tr>";
                if ($result->num_rows > 0) {
                    $nriga = 0;
                    while ($row = $result->fetch_assoc()) {
                        $titolo="Non specificata";
                        if(isset($row["titolo"])&&!empty($row["titolo"])) {
                            $titolo=$row["titolo"];
                        }
                        $dat=htmlspecialchars($row["data"]);
                        $dat=new Datetime(htmlspecialchars($dat));
                            $dat=date_format($dat,"d/m/Y H:i:s");
                        $scad="Non specificata";
                        $confronto="0000-00-00 00:00:00";
                        if(isset($row["scadenza"])&&!empty($row["scadenza"])&&$confronto!=$row["scadenza"]) {
                            $scad=htmlspecialchars($row["scadenza"]);
                            $scad=new Datetime(htmlspecialchars($row["scadenza"]));
                            $scad=date_format($scad,"d/m/Y H:i:s");
                        } if (!isset($_POST["cerca"])) {
                        echo '<td><a href="nota-dettaglio.php?idnota='.htmlspecialchars($row["idnota"]).'&idazienda='.htmlspecialchars($_GET["id"]).'"><span data-feather="edit"></span></a></td>';
                        } else {
                            echo '<td><a href="nota-dettaglio.php?idnota='.htmlspecialchars($row["idnota"]).'&idazienda='.htmlspecialchars($_SESSION["idaziendapernota"]).'"><span data-feather="edit"></span></a></td>';

                        }
                        echo '<td>' . htmlspecialchars($row["cognome"]) ." ". htmlspecialchars($row["nome"]) . '</td>';
                        echo '<td>' . htmlspecialchars($titolo) . '</td>';
                        echo '<td>' . htmlspecialchars($dat) . '</td>';
						echo '<td>' . htmlspecialchars($scad) . '</td>';
                        echo "</tr>";
                    }
                }
            echo "</table>";
        echo '</div>';

    }

    /*function cerca($keyword)
    {
        $keyword = $_POST["testocerca"];
        $sql = 'SELECT nota.idnota, persona.cognome, persona.nome, nota.titolo, nota.descrizione, nota.data, nota.scadenza FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda='.$_GET['id'].' AND (';
        $sql .= ' nota.titolo like "%' . $keyword . '%"';
        $sql .= ' or nota.descrizione like "%' . $keyword . '%"';
        $sql .= ' or nota.data like "%' . $keyword . '%"';
        $sql .= ' or nota.scadenza like "%' . $keyword . '%"';
        $sql .= ' or persona.nome like "%' . $keyword . '%"';
        $sql .= ' or persona.cognome like "%' . $keyword . '%")';
        return $sql;
    }*/

    ?>

    <?php
    //INIZIO
    /*if (isset($_POST["salva"])) {

        //salvo dati persona
        if (isset($_POST["id"])) {
            $id = $_POST["id"];
        } else {
            $id = -1;
        }
        $sql = "";
        if ($id != -1) {
            //se id!= -1 allora aggiorni i dati
            $sql = "update nota set";
            $sql .= ' titolo='.$_POST["titolo"];
            $sql .= ', descrizione='.$_POST["descrizione"];
            $sql .= ', data='.$_POST["data"];
            $sql .= ', scadenza='.$_POST["scadenza"];
            $sql .= ' where id='. $_GET["id"];
            $stmt = $conn->prepare($sql);
        } else {
            //MANCA///////////////////////////////////////////////////////////
            //altrimenti inserisco nuovo persona
            //$sql = "insert into persona(datanascita, codicefiscale, residenza, indirizzo, cognome, nome)values(?,?,?,?,?,?)";
            //$stmt = $conn->prepare($sql);
            //$stmt->bind_param("ssssss", $_POST["datanascita"], $_POST["codicefiscale"], $_POST["residenza"], $_POST["indirizzo"], $_POST["cognome"], $_POST["nome"]);
        }
        //echo "<p>$sql</p>";
        //eseguo la query
        $stmt->execute();
        $result = $stmt->get_result();
        //echo "<p>$result</p>";
        //header("Refresh:0");

    } */ if (isset($_POST["btnfile"])) {
            ?>
            <script>
                alert("Funzione ancora in fase di sviluppo");
            </script>
            <?php
        /*
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
            $sql="INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES ('1', '".$last_id."');";
            $result = $conn->query($sql);
            $last_id = $conn->insert_id;
            $sql="INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES ('1', '".$last_id."');";
            $result = $conn->query($sql);
            
        }*/
    } /*else if (isset($_POST["elimina"])) {
        if (isset($_POST["persona"])) {
            $id = $_POST["persona"];
        } else {
            $id = -1;
        } 
        $sql = "";
        $elimina = $_POST["hidden_elimina"];

        if ($elimina && $id != -1) {
            $sql = "delete from nota where id= ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result();
            $result = $conn->query($sql);
        }
    }*/
    //FINE

    ?>


    <?php
    if (!isset($_POST["submit"])) {
    ?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
        <?php
           $sql = 'SELECT denominazione_azienda FROM azienda WHERE id=?';
           $stmt = $conn->prepare($sql);
           $stmt->bind_param("i", $_GET['id']);
           $stmt->execute();
           $result = $stmt->get_result();
           if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $nomeazienda = $row['denominazione_azienda'];
            $_SESSION['nomeaziendausata']=$nomeazienda;
           }
        ?>
                <h1 class="h2">Note dell'azienda <?php echo $nomeazienda ?></h1>
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
                                <b>Aggiungi una nota</b>
                                  <div class="row justify-content-start">
                                    <form method="POST" action="nota-dettaglio.php?idazienda=<?php echo $_GET["id"]?>" enctype="multipart/form-data">
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
              <form class="d-flex" method="POST" action="<?php echo 'azienda_dettaglio.php?id='.$_GET['id'] ?>">
                  <div class="btn-group me-2" role="group" aria-label="First group">
                      <input type="submit" name="tornanota" value="<-- Torna al dettaglio dell'azienda" class="btn btn-secondary">
                 </div>
              </form>
              <div class="row justify-content-start">
                                    <form method="POST" action="nota-dettaglio.php?idazienda=<?php echo $_GET["id"]?>" enctype="multipart/form-data">
                                      <input type="Submit" class="btn btn-primary float-end" name="submit" value="Aggiungi una nota" />
                                    </form>
                                  </div>
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
        if (isset($_POST["ordinaTitolo"])) {
            $_SESSION['varOrTitolo'] += 1;
            $_SESSION["varOrCognome"] = 0;
            $_SESSION["varOrDtins"] = 0;
            $_SESSION["varOrDtscad"] = 0;
            if ($_SESSION['varOrTitolo'] % 2 == 0) {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by titolo DESC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            } else {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by titolo ASC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            }
            //$result = $conn->query($sql);
            //generaTabella($result);
        } else if (isset($_POST["ordinaCognome"])) {
            $_SESSION['varOrCognome'] += 1;
            $_SESSION["varOrTitolo"] = 0;
            $_SESSION["varOrDtins"] = 0;
            $_SESSION["varOrDtscad"] = 0;
            if ($_SESSION['varOrCognome'] % 2 == 0) {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by cognome DESC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            } else {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by cognome ASC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            }
            //$result = $conn->query($sql);
            //generaTabella($result);
        } else if (isset($_POST["ordinaInserimento"])) {
            $_SESSION['varOrDtins'] += 1;
            $_SESSION["varOrCognome"] = 0;
            $_SESSION["varOrDtscad"] = 0;
            $_SESSION["varOrTitolo"] = 0;
            if ($_SESSION['varOrDtins'] % 2 == 0) {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by data DESC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            } else {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by data ASC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            }
            //$result = $conn->query($sql);
            //generaTabella($result);
        } else if (isset($_POST["ordinaScadenza"])) {
            $_SESSION['varOrDtscad'] += 1;
            $_SESSION["varOrCognome"] = 0;
            $_SESSION["varOrDtins"] = 0;
            $_SESSION["varOrTitolo"] = 0;
            if ($_SESSION['varOrDtscad'] % 2 == 0) {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by scadenza DESC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            } else {
                $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by scadenza ASC';
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $_GET['id']);
                $stmt->execute();
                $result = $stmt->get_result();
                generaTabella($result);
            }
            //$result = $conn->query($sql);
            //generaTabella($result);
        } else if (!isset($_POST["cerca"])) {	
            $sql = 'SELECT * FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? order by data DESC';
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $_GET['id']);
            $stmt->execute();
            $result = $stmt->get_result();
            generaTabella($result);
        } else if (isset($_POST["cerca"])) {
            $_SESSION["sessCerca"] = $_POST["testocerca"];	
            $keyword = "%".$_POST["testocerca"]."%";
            $sql = 'SELECT nota.idnota, persona.cognome, persona.nome, nota.titolo, nota.descrizione, nota.data, nota.scadenza FROM nota, persona WHERE persona.id=nota.idpersona AND idazienda=? AND (';
            $sql .= ' nota.titolo like ?';
            $sql .= ' or nota.descrizione like ?';
            $sql .= ' or nota.data like ?';
            $sql .= ' or nota.scadenza like ?';
            $sql .= ' or persona.nome like ?';
            $sql .= ' or persona.cognome like ?)';
            $sql .= ' order by nota.data DESC';
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("issssss", $_GET['id'], $keyword, $keyword, $keyword, $keyword, $keyword, $keyword);
            $stmt->execute();
            $result = $stmt->get_result();
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
