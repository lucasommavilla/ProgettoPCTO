<?php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");
if (!isset($_SESSION["varOrNome"])) {
    $_SESSION["varOrNome"] = 0;
}
if (!isset($_SESSION["varOrInizio"])) {
    $_SESSION["varOrInizio"] = 0;
}
if (!isset($_SESSION["varOrFine"])) {
    $_SESSION["varOrFine"] = 0;
}


if (isset($_POST["esporta"])) {
    $sql = "select * from persona join persona_ruolo on persona.id=persona_ruolo.idpersona and persona_ruolo.idruolo = 3";
    $result = $conn->query($sql);
    $nomefileb = 'persona_backup.csv';
    $result = mysqli_query($conn, $sql);
    $row2 = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $fp = fopen($nomefileb, 'w');
    $intestazione = array('ID', 'NOME', 'COGNOME', 'DATA NASCITA', 'CODICE FISCALE', 'SESSO', 'CELLULARE', 'LOGIN', 'PASSWORD', 'MATRICOLA', 'CITTADINANZA', 'CAP', 'TELEFONO', 'EMAIL', 'INDIRIZZO', 'CITTA', 'TUT_IDAZIENDA');
    fputcsv($fp, $intestazione, $separator = ";");
    while ($row2 = $result->fetch_assoc()) {
        fputcsv($fp, $row2, $separator = ";");
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
    <title>Periodi Stage</title>
	
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
            echo '</br></br><table class="table table-striped table-bordered table-sm table-responsive" style="text-align:center">';
                echo '<tr bgcolor="#252526">';
                echo '<th style="width: 3.66%"></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:#ffffff" type="submit" name="ordinaNome" value="Nome"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCognome" value="Data Inizio"/></th>';
                echo '<th ><input class="btn btn-sm" style="background-color:#252526; color:white" type="submit" name="ordinaCitta" value="Data Fine"/></th>';
                echo "</tr>";
                if ($result->num_rows > 0) {
                    $nriga = 0;
                    while ($row = $result->fetch_assoc()) {
                        echo '<td><a href="periodo-stage-dettaglio.php?id='.htmlspecialchars($row["id"]).'"><span data-feather="edit"></span></a></td>';
                        echo '<td>' . htmlspecialchars($row["nome"]) . '</td>';
                        echo '<td>' . htmlspecialchars($row["data_inizio"]) . '</td>';
                        echo '<td>' . htmlspecialchars($row["data_fine"]) . '</td>';                      
                        echo "</tr>";
                    }
                }
            echo "</table>";
        echo '</div>';
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
            $sql = "UPDATE `periodo_stage` SET";
            $sql .= " nome=?";
            $sql .= ", data_inizio=?";
            $sql .= ", data_fine=?";
            $sql .= " where id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssi", $_POST["nome"], $_POST["data_inizio"], $_POST["data_fine"], $id);
        } else {
            //altrimenti inserisco nuovo persona
            $sql = "insert into persona(nome, data_inizio, data_fine)values(?,?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $_POST["nome"], $_POST["data_inizio"], $_POST["data_fine"]);
        }
        //echo "<p>$sql</p>";
        //eseguo la query
        $stmt->execute();
        $result = $stmt->get_result();
        //echo "<p>$result</p>";
        //header("Refresh:0");

    }

    ?>


    <?php
    if (!isset($_POST["submit"])) {
    ?>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <nav class="navbar">
                <h1 class="h2">Periodi Stage</h1>
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
                                <b>Aggiungi un periodo</b>
                                  <div class="row justify-content-start">
                                    <form method="POST" action="periodo-stage-dettaglio.php" enctype="multipart/form-data">
                                      <input type="Submit" class="btn btn-outline-secondary" name="submit" value="Aggiungi" />
                                    </form>
                                  </div>
                                  <br>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
	    <div>
            <form class="d-flex" method="POST" action="<?php $_SERVER["PHP_SELF"]; ?>">
        </div>
		<?php
        //ordinamento
        if (isset($_POST["ordinaNome"])) {
            $_SESSION['varOrNome'] += 1;
            $_SESSION["varOrInizio"] = 0;
            $_SESSION["varOrFine"] = 0;
            if ($_SESSION['varOrNome'] % 2 == 0) {
                $sql = "SELECT * FROM `periodo_stage` order by nome DESC";
            } else {
                $sql = "SELECT * FROM `periodo_stage` order by nome ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
        } else if (isset($_POST["ordinaInizio"])) {
            $_SESSION['varOrInizio'] += 1;
            $_SESSION["varOrNome"] = 0;
            $_SESSION["varOrFine"] = 0;
            if ($_SESSION['varOrInizio'] % 2 == 0) {
                $sql = "SELECT * FROM `periodo_stage` order by data_inizio DESC";
            } else {
                $sql = "SELECT * FROM `periodo_stage` order by data_inizio ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
        } else if (isset($_POST["ordinaFine"])) {
            $_SESSION['varOrFine'] += 1;
            $_SESSION["varOrNome"] = 0;
            $_SESSION["varOrInizio"] = 0;
            if ($_SESSION['varOrFine'] % 2 == 0) {
                $sql = "SELECT * FROM `periodo_stage` order by data_fine DESC";
            } else {
                $sql = "SELECT * FROM `periodo_stage` order by data_fine ASC";
            }
            $result = $conn->query($sql);
            generaTabella($result);
	
        } else{
            $sql = "SELECT * FROM `periodo_stage`";
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
