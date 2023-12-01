<?php
//entry.php
    require_once("Include/funz_admin.inc");
    require("Include/db_connection.inc");

?>
<!doctype html>
<html lang="en">
<head>
    <title>Classi - dettaglio</title>
    <?php require("Include/head.php"); ?>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="dashboard/dashboard.css" rel="stylesheet">

    <script>
        function mostraAlert() {
            document.getElementById("hidden_elimina").value = 0;
            var idel = document.getElementById("classe");
            console.log(idel);
            var sezione = document.getElementById("sezione").value;
            var anno = document.getElementById("anno").value;
            // var c = confirm ('prova');
            //  var iddocente = document.getElementById("id_docente").value;
            var r = confirm('Sei sicuro di voler ELIMINARE la classe ' + sezione.toUpperCase() + ' ' + anno.toUpperCase() + '?');
            if (r == true) {
                document.getElementById("hidden_elimina ").value = 1;
            }
        }
    </script>

</head>
<body>

<?php
if (isset($_POST["elimina"])) {
    $id = $_POST["id"];
    setcookie("id",$id);
    $sql = "";
    $elimina = $_POST["hidden_elimina"];
    if ($id != -1) {
        $sql = "delete from classe where id= ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        //print($stmt->error);
        header("location:classi.php");
    }
}
?>
  <script>
    function ricava_select(){
      var slct1 = document.getElementById("slct1");
      return slct1;
    }
  </script>
<?php
if (isset($_POST["salva"])) {
    //echo "<script>alert(' ci sono ')</script>";
    //salvo dati persona
    if (isset($_GET["id"])) {
        $id = $_GET["id"];
    } else {
        $id = -1;
    }
    $sql = "";
    if ($id != -1) {
        setcookie("select",$_POST["slct1"]);
        if ($_POST["slct1"] != -1){
        //se id!= -1 allora aggiorni i dati
        $sql = "update classe set";
        $sql .= " id_docente=?";
        $sql .= ", sezione=?";
        $sql .= ", anno=?";
        $sql .= " where id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("issi", $_POST["slct1"], $_POST["sezione"], $_POST["anno"], $id);
        $stmt->execute();
        $result = $stmt->get_result();
        header("location:classi.php");  
       
        }else{
        $sql = "update classe set";
        $sql .= " sezione=?";
        $sql .= ", anno=?";
        $sql .= " where id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $_POST["sezione"], $_POST["anno"], $id);
        $stmt->execute();
        $result = $stmt->get_result();
        header("location:classi.php");  
        }
      
    } else {
        
        //altrimenti inserisco nuovo persona
        // $sql = "INSERT into persona(datanascita, codicefiscale, residenza, indirizzo, cognome, nome, cellulare, telefono, cap, email, sesso) values(?,?,?,?,?,?,?,?,?,?,?)";
        $sql = "INSERT INTO `classe` (`id_docente`, `sezione`, `anno`) VALUES (?,?,?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iss", $_POST["slct1"], $_POST["sezione"], $_POST["anno"]);
        $stmt->execute();
        header("location:classi.php");
    }
}
function generaDettaglioVisualizzazione($result, $connessione)
{
    $iddocente = "";
    $sezione = "";
    $anno = "";

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $iddocente = htmlspecialchars($row["id_docente"]);
        $sezione = htmlspecialchars($row["sezione"]);
        $anno = htmlspecialchars($row["anno"]);
    }

    if ($iddocente != "") {
        $sql2 = 'Select nome, cognome from persona where id =' . $iddocente;
        $result2 = $connessione->query($sql2);
        $nome = "";
        $cognome = "";

        if ($result2->num_rows > 0) {
            $row = $result2->fetch_assoc();
            $nome = htmlspecialchars($row["nome"]);
            $cognome = htmlspecialchars($row["cognome"]);
        }
    }
    echo '
            <div class="justify-content-center">
            <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="book"class="align-baseline"></span> Classe</p>
              <div class="mb-3 row">
              
              <label class="col-sm-3 col-md-1 col-form-label">Sezione</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" readonly class="form-control" id="sezione" name="sezione" value="' . $sezione . '">
              </div></label>

              <label class="col-sm-3 col-md-1 col-form-label">Anno</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" readonly class="form-control" id="anno" name="anno" value="' . $anno . '">
              </div></label>
              </div>
              ';
    if ($iddocente != "") {
        echo '
              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Docente</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Docente</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" readonly class="form-control" name="cap" value="' . $nome,  $cognome . '">
              </div></label></div>
              ';
    }
    echo '
         </div>
            </br>
            </br>
            </br>
            </br>';
}

function generaDettaglioModifica($result, $connessione)
{

    $iddocente = "";
    $sezione = "";
    $anno = "";

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $iddocente = htmlspecialchars($row["id_docente"]);
        $sezione = htmlspecialchars($row["sezione"]);
        $anno = htmlspecialchars($row["anno"]);
    }

    $sql2 = "SELECT DISTINCT * FROM `persona` join persona_ruolo on persona.id = persona_ruolo.idpersona where idruolo = 2";
    $result2 = $connessione->query($sql2);

    $nome = "";
    $cognome = "";
    $var = "Elenco docenti";

    echo '
            <div class="justify-content-center">
            <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="book"class="align-baseline"></span> Classe</p>
              <div class="mb-3 row">
              
              <label class="col-sm-3 col-md-1 col-form-label">Sezione *</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" required class="form-control" name="sezione" value="' . $sezione . '">
              </div></label>

              <label class="col-sm-3 col-md-1 col-form-label">Anno *</label>
              <div class="col-sm-3 col-md-3">
              <input type="text" required class="form-control" name="anno" value="' . $anno . '">
              </div></label>
              </div>

              <hr class="mt-2 mb-3"/>
              <p class="fs-5"><span data-feather="user"class="align-baseline"></span> Docente</p>
              <div class="mb-3 row">
              <label class="col-sm-3 col-md-1 col-form-label">Docente</label>
              <select style="width:20%;" id="slct1" name="slct1" class="form-select">
              <option value="-1"> ' . $var . '</option>';
          if ($result2->num_rows > 0) {
           while ($row = $result2->fetch_assoc()) {
            echo '<option value="' . $row["id"] . '">
                ' . htmlspecialchars($row["nome"]) . '
                ' . htmlspecialchars($row["cognome"]) . '
                </option>';
        }
    }
    echo '</select>
         </div>
            </br>
            </br>
            </br>
            </br>';
}

?>
<?php require("Include/navbar.php"); ?>

<div class="container-fluid">
    <div class="row">
        <?php require("Include/menu.php"); ?>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <nav class="navbar">
                <?php
                if (isset($_GET["id"])) {
                    $id = $_GET["id"];

                    $sql = 'Select id_docente, sezione, anno from classe where id =' . $_GET["id"];
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $nriga = 0;
                        $row = $result->fetch_assoc();
                        //echo'<span data-feather="arrow-left"></span></a>';
                        echo '
      <nav class="navbar">
        <div class="container-fluid">
        <p class="h2 mb-3"> Dettaglio della classe ' . htmlspecialchars($row["sezione"]) . ' ' . htmlspecialchars($row["anno"]) . '</p>
        </div>
      </nav>
      ';
                    } else {
                        echo '<h1 class="h2 mb-3">Attenzione: Classe inesistente</h1>';
                    }

                } else {
                    echo '<h1 class="h2 mb-3">Aggiungi nuova classe</h1>';
                }
                ?>

            </nav>
            <form action="<?php $_SERVER["PHP_SELF"]; ?>" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="hidden_elimina" id="hidden_elimina" value="0">
                <input type="hidden" name="id" value="<?php isset($_GET['id'])?print($_GET['id']): print('-1') ?>">
                <?php
                if (isset($_GET["id"])) {
                    $id = $_GET["id"];

                    $sql = 'Select * from classe where id =' . $_GET["id"];
                    $result = $conn->query($sql);

                    if (!isset($_POST["modifica"])) {
                        ?>
                        <div class="mb-4 clearfix">
                            <div class="btn-toolbar float-start" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group me-2" role="group" aria-label="First group">
                                    <button type="button" onclick="location.href='classi.php'" name="indietro" value=""
                                            class="btn btn-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                  d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="btn-group me-2" role="group" aria-label="Second group">
                                    <input type="submit" name="modifica" value="Modifica" class="btn btn-secondary">
                                </div>
                            </div>
                            <input type="submit" onclick="mostraAlert()" name="elimina" value="Elimina Classe"
                                   class="btn btn-danger float-end">
                        </div>
                        <?php
                        generaDettaglioVisualizzazione($result, $conn);


                    }
                    if (isset($_POST["modifica"])) {
                        echo '<div class="mb-4 clearfix">';
                        echo '<input type="button" onclick="location.href=\'classi-dettaglio.php?id=' . $id . '\'" name="annullamodifiche" value="Annulla Modifiche" class="btn btn-secondary float-start">';
                        echo '<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
                        echo '</div>';

                        generaDettaglioModifica($result, $conn);

                    }
                } else {
                    $sql = 'Select * from classe where id =-1';
                    $result = $conn->query($sql);
                    echo '<div class="mb-4 clearfix">';
                    echo '<input type="button" onclick="location.href=\'classi.php\'" name="annullamodifiche" value="Annulla" class="btn btn-secondary float-start">';
                    echo '<input type="submit" name="salva" value="Salva" class="btn btn-primary float-end">';
                    echo '</div>';
                    generaDettaglioModifica($result, $conn);

                }

                ?>

            </form>
        </main>

    </div>
</div>
<?php require("Include/footer.php"); ?>
</body>
</html>