<?php
require("Include/db_connection.inc");
session_start();

$offset = 0;
$pag_num = 10;
$num_rows = $conn->query("select * from azienda")->num_rows;

function inputType($text, $type)
{
    if (!is_numeric($text)) return -1;
    if (in_array($text, ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'], true) && $type == 1) return 1;
    return 0;
}

if (isset($_REQUEST["offset"]) && is_numeric($_REQUEST["offset"])) {
    $offset = $_REQUEST["offset"];
}
if (isset($_REQUEST["pag_num"]) && is_numeric($_REQUEST["pag_num"])) {
    $pag_num = $_REQUEST["pag_num"];
}

if (!isset($_SESSION["varOrID"])) {
    $_SESSION["varOrID"] = 0;
}
if (!isset($_SESSION["varOrNome"])) {
    $_SESSION["varOrNome"] = 0;
}
if (!isset($_SESSION["varOrLocazione"])) {
    $_SESSION["varOrLocazione"] = 0;
}
if (!isset($_SESSION["varOrRapp"])) {
    $_SESSION["varOrRapp"] = 0;
}
if (!isset($_SESSION["varOrConv"])) {
    $_SESSION["varOrConv"] = 0;
}
if (!isset($_SESSION["varOrIva"])) {
    $_SESSION["varOrIva"] = 0;
}
if (!isset($_SESSION["sessCerca"])) {
    $_SESSION["sessCerca"] = "";
}






if (isset($_POST["esporta"])) {
    $sql = "select * from azienda";
    $result = $conn->query($sql);
    //$mydate=getdate(date("U"));
    //$nomefileb = 'docente_'.$mydate["mday"].$mydate["mon"].$mydate["year"]."_".$mydate["hours"].$mydate["minutes"].$mydate["seconds"].'.csv';
    $nomefileb = 'azienda_exp.csv';
    $result = mysqli_query($conn, $sql);
    $row2 = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $fp = fopen($nomefileb, 'w');
    $intestazione = array('ID', 'ID_DOCENTE', 'ID_TUTOR', 'NOME', 'LOCAZIONE', 'RAPPRESENTANTE', 'CONVENZIONE', "IVA", "COMMENTO", "N_INFORMATICI", "N_TELECOMUNICAZIONI", "N_ELETTRONICI", "N_AUTOMAZIONI", "N_LICEO");
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


function generaTabella($result, $conn)
{
    echo '<div class="justify-content-center">';
    echo '<table class=" table table-striped table-bordered table-sm" >';
    echo '<thead>';
    echo '<tr>';
    echo '<th scope="col" class="first"></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaNome" onclick="refresh(0)" value="Nome"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaDocente" onclick="refresh(12)" value="Docente"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaSettore" onclick="refresh(1)" value="Settore"/></th>';
    //echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaRappresentante" onclick="refresh(2)" value="Rappresentante"/></th>';
    //echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaIva" onclick="refresh(3)" value="Iva"/></th>';
    //echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaInd" onclick="refresh(4)" value="Indirizzo"/></th>';
    //echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaCap" onclick="refresh(5)" value="Cap"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaComune" onclick="refresh(6)" value="Comune"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaInfo" onclick="refresh(7)" value="Info"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaTele" onclick="refresh(8)" value="Tele"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaEle" onclick="refresh(9)" value="Ele"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaAuto" onclick="refresh(10)" value="Auto"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaLiceo" onclick="refresh(11)" value="Liceo"/></th>';
    echo '<th scope="col"><input class="btn btn-primary" type="button" name="ordinaLiceo" onclick="refresh(13)" value="Totale"/></th>';

    echo "</tr>";
    echo '</thead>';
    echo "<tbody class = 'table-scroll'>";
    if ($result->num_rows > 0) {
        $nriga = 0;

        while ($row = $result->fetch_assoc()) {
            if ($nriga % 2 == 0) {
                echo '<tr bgcolor="#ffffff">';
            } else {
                echo '<tr bgcolor="#d9d9d9">';
            }
            //echo '<div class="form-check">';
            //echo "</div>";
            $doc = "";
            $order = "";
            $search = "";
            $off = "";
            $pag = "";
            if (isset($_REQUEST["page_num"]))
                $pag = "<input type='hidden' name = 'page_num' value='" . $_REQUEST['page_num'] . "'>";
            if (isset($_REQUEST["offset"]))
                $off = "<input type='hidden' name = 'offset' value='" . $_REQUEST['offset'] . "'>";
            if (isset($_REQUEST['orderby']))
                $order = "<input type='hidden' name = 'orderby' value='" . $_REQUEST['orderby'] . "'>";
            if (isset($_REQUEST['id_doc']))
                $doc = "<input type='hidden' name = 'id_doc' value='" . $_REQUEST['id_doc'] . "'>";
            if (isset($_REQUEST['testocerca']))
                $search = "<input type='hidden' name = 'testocerca' value='" . $_REQUEST['testocerca'] . "'>";
            printf("<td class='text_fix'><form method='get' action='azienda_dettaglio.php'>%s%s%s%s%s<input type='hidden' name='id' value='%d'><button type='submit' style='border:none;background-color:inherit;'/><span data-feather='edit'></span></button></form></td>", $off, $pag, $order, $doc, $search, $row["id"]);
            echo '<td>' . htmlspecialchars($row["denominazione_azienda"]) . '</td>';
            if ($row["id_docente"] == 0)
                echo '<td></td>';
            else {
                $restultDoc = $conn->query("select * from persona where id=" . $row['id_docente']);
                $rowDoc = $restultDoc->fetch_assoc();
                echo '<td>' . htmlspecialchars($rowDoc["cognome"] . " " . $rowDoc["nome"]) . '</td>';
            }
            echo '<td>' . htmlspecialchars(substr($row["settore"], 0, 4)) . '</td>';
            echo '<td>' . htmlspecialchars($row["comune"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_informatici"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_telecomunicazioni"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_elettronici"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_automazioni"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_liceo"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["n_totale"]) . '</td>';
            //echo '<td>' . htmlspecialchars($row["leg_iva"]) . '</td>';
            //echo '<td>' . htmlspecialchars($row["indirizzo"]) . '</td>';
            //echo '<td>' . htmlspecialchars($row["cap"]) . '</td>';
            echo "</tr>";
            $nriga = $nriga + 1;
        }
    }
    echo "</tbody>";
    echo "</table>";

    echo '</div>';
    echo '</div>';
}

function cerca()
{
    $sql = 'SELECT * FROM azienda WHERE';
    $sql .= ' nome like ?';
    $sql .= ' or settore like ?';
    $sql .= ' or referente_aziendale like ?';
    $sql .= ' or leg_iva like ?';
    $sql .= ' or indirizzo like ?';
    $sql .= ' or comune like ?';
    $sql .= ' or cap like ?';
    //echo $sql;

    return $sql;
}

if (isset($_POST["salva"]) || isset($_POST["modifica"])) {
    //salvo dati docente
    if (isset($_POST["id"]) && is_numeric($_POST["id"])) {
        $id = $_POST["id"];
    } else {
        $id = -1;
    }

    if(!isset($_POST["denominazione_azienda"],$_POST["email"],$_POST["telefono"],$_POST["indirizzo"],$_POST["comune"],$_POST["cap"],$_POST["leg_iva"])){
        die("Error nel acquisizione dei dati !!");
    }

    $sql = "";
    $stmt = null;
    if ($id != -1) {
        //se id!= -1 allora aggiorni i dati
        $sql = "update azienda set  `id_docente`=? ,`n_informatici`=?, `n_telecomunicazioni`=?,
                   `n_elettronici`=?, `n_automazioni`=?, `n_liceo`=?,`denominazione_azienda` =?, 
                   `settore` = ?,`indirizzo`=?,`cap`=?,
                   `comune`=? ,`referente_aziendale`=?, `tutor_aziendale`=?, 
                   `telefono`=?, `inizioam`=?, `fineam`=?, 
                   `iniziopm`=?, `finepm`=?, `email`=?,
                   `sito`=?, `n_dipendenti`=?, `settore_attivita` = ?, `leg_denominazioneazienda` = ? ,
                   `leg_via`=?, `leg_comune`=?, `leg_nomecognome`=?,
                   `leg_datanascita`=?, `leg_comunenascita`=?, `leg_iva`=?,
                   `rapleg_convenzioneprotocolo`=?, `rapleg_codicefiscale`=?, `rapleg_convenzionedata`=?,
                   `commento`= ?, `n_totale`= ? where id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssssssssssssssssssssssssssssssssi",
            $_POST["id_docente"], $_POST["n_informatici"], $_POST["n_telecomunicazioni"],
            $_POST["n_elettronici"], $_POST["n_automazioni"], $_POST["n_liceo"], $_POST["denominazione_azienda"],
            $_POST["settore"], $_POST["indirizzo"], $_POST["cap"],
            $_POST["comune"], $_POST["referente_aziendale"], $_POST["tutor_aziendale"],
            $_POST["telefono"], $_POST["inizioam"], $_POST["fineam"],
            $_POST["iniziopm"], $_POST["finepm"], $_POST["email"],
            $_POST["sito"], $_POST["n_dipendenti"], $_POST["settore_attivita"],
            $_POST["leg_denominazioneazienda"], $_POST["leg_via"], $_POST["leg_comune"],
            $_POST["leg_nomecognome"], $_POST["datanascita"], $_POST["leg_comunenascita"],
            $_POST["leg_iva"], $_POST["rapleg_convenzioneprotocolo"], $_POST["rapleg_codicefiscale"],
            $_POST["rapleg_convenzionedata"], $_POST["commento"], $_POST["n_totale"], $id);
    } else {
        //altrimenti inserisco nuovo docente
        $sql = "insert into azienda(id_docente, n_informatici, n_telecomunicazioni,
                    n_elettronici, n_automazioni, n_liceo,
                    denominazione_azienda , settore,indirizzo,
                    cap,comune,referente_aziendale,
                    tutor_aziendale,telefono,inizioam,
                    fineam,iniziopm,finepm,
                    email,sito,n_dipendenti,settore_attivita,
                    leg_denominazioneazienda,leg_via,leg_comune,
                    leg_nomecognome,leg_datanascita,leg_comunenascita,
                    leg_iva,rapleg_convenzioneprotocolo,rapleg_codicefiscale,
                    rapleg_convenzionedata,commento,n_totale) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssssssssssssssssssssssssssssssss",
            $_POST["id_docente"], $_POST["n_informatici"], $_POST["n_telecomunicazioni"],
            $_POST["n_elettronici"], $_POST["n_automazioni"], $_POST["n_liceo"], $_POST["denominazione_azienda"],
            $_POST["settore"], $_POST["indirizzo"], $_POST["cap"],
            $_POST["comune"], $_POST["referente_aziendale"], $_POST["tutor_aziendale"],
            $_POST["telefono"], $_POST["inizioam"], $_POST["fineam"],
            $_POST["iniziopm"], $_POST["finepm"], $_POST["email"],
            $_POST["sito"], $_POST["n_dipendenti"], $_POST["settore_attivita"],
            $_POST["leg_denominazioneazienda"], $_POST["leg_via"], $_POST["leg_comune"],
            $_POST["leg_nomecognome"], $_POST["leg_datanascita"], $_POST["leg_comunenascita"],
            $_POST["leg_iva"], $_POST["rapleg_convenzioneprotocolo"], $_POST["rapleg_codicefiscale"],
            $_POST["rapleg_convenzionedata"], $_POST["commento"], $_POST["n_totale"]);
            }
    //echo "<p>$sql</p>";
    //eseguo la query
    $stmt->execute();
    $result = $stmt->get_result();

    if($id == -1){
        $num_rows += 1;
    }


    //echo "<p>$result</p>";
    //header("Refresh:0");

} else if (isset($_REQUEST["elimina"])) {
    if (isset($_REQUEST["id"])) {
        $id = $_REQUEST["id"];
    } else {
        $id = -1;
    }
    //echo $id;

    if ($id != -1) {
        $sql = "delete from azienda where id= ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        //echo "<p>$sql</p>";
        //eseguo la query
    }
}


//ordinamento
if (isset($_REQUEST["orderby"]) && inputType($_REQUEST["orderby"], 1) == 1) {
    if (!isset($_SESSION["orderby"])) {
        $_SESSION["orderby"] = $_REQUEST["orderby"];
        $_SESSION["orderdirect"] = false;
    } else {
        if ($_SESSION["orderby"] == $_REQUEST["orderby"]) $_SESSION["orderdirect"] = !$_SESSION["orderdirect"];
        else $_SESSION["orderby"] = $_REQUEST["orderby"];
    }
    $id = $_REQUEST["orderby"];
    switch ($id) {
        case "0" :
            $or = "denominazione_azienda";
            break;
        case "1" :
            $or = "settore";
            break;
        case "2" :
            $or = "referente_aziendale";
            break;
        case "3" :
            $or = "leg_iva";
            break;
        case "4" :
            $or = "indirizzo";
            break;
        case "5" :
            $or = "cap";
            break;
        case "6" :
            $or = "comune";
            break;
        case "7" :
            $or = "n_informatici";
            break;
        case "8" :
            $or = "n_telecomunicazioni";
            break;
        case "9" :
            $or = "n_elettronici";
            break;
        case "10":
            $or = "n_automazioni";
            break;
        case "11":
            $or = "n_liceo";
            break;
        case "12":
            $or = "nome,cognome";
            break;
        case "13":
            $or = "n_totale";
    }
    $sql = "SELECT azienda.*" . ($_REQUEST["orderby"] == "12" ? ",persona.nome,persona.cognome" : "") . " FROM azienda join persona on azienda.id_docente = persona.id " . ((isset($_REQUEST['id_doc']) && inputType($_REQUEST["id_doc"], 0) == 0) ? "where id_docente = " . $_REQUEST['id_doc'] : "") . " order by " . $or . " " . ($_SESSION["orderdirect"] ? "desc" : "asc") . " limit " . $offset * $pag_num . "," . $pag_num;
    $result = $conn->query($sql);
    $num_rows = $result->num_rows;
} else if (isset($_REQUEST["testocerca"])) {
    $cerca = "%" . $_REQUEST["testocerca"] . "%";
    $sql = "";
    $or = "";
    if (!isset($_SESSION["orderby"])) {

        if (isset($_REQUEST["id_doc"]) && inputType($_REQUEST["id_doc"], 0) == 0)
            $sql = "SELECT * FROM azienda WHERE id_docente = ? and
                     denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ? limit " . $offset * $pag_num . "," . $pag_num;
        else
            $sql = "SELECT * FROM azienda WHERE
                     denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ? limit " . $offset * $pag_num . "," . $pag_num;
    } else {
        switch ($_SESSION["orderby"]) {
            case "0" :
                $or = "denominazione_azienda";
                break;
            case "1" :
                $or = "settore";
                break;
            case "2" :
                $or = "referente_aziendale";
                break;
            case "3" :
                $or = "leg_iva";
                break;
            case "4" :
                $or = "indirizzo";
                break;
            case "5" :
                $or = "cap";
                break;
            case "6" :
                $or = "comune";
                break;
            case "7" :
                $or = "n_informatici";
                break;
            case "8" :
                $or = "n_telecomunicazioni";
                break;
            case "9" :
                $or = "n_elettronici";
                break;
            case "10":
                $or = "n_automazioni";
                break;
            case "11":
                $or = "n_liceo";
                break;
            case "12":
                $or = "nome,cognome";
                break;
            case "13":
                $or = "n_totale";

        }

        if (isset($_REQUEST["id_doc"]) && inputType($_REQUEST["id_doc"], 0) == 0)
            $sql = "SELECT azienda.*" . ($_REQUEST["orderby"] == "12" ? ",persona.nome,persona.cognome" : "") . " FROM azienda join persona on azienda.id_docente = persona.id WHERE 
                            id_docente = ? and
                    denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ? order by " . $or . " " . ($_SESSION["orderdirect"] ? "desc" : "asc") . " limit " . $offset * $pag_num . "," . $pag_num;
        else
            $sql = "SELECT azienda.*" . ($_REQUEST["orderby"] == "12" ? ",persona.nome,persona.cognome" : "") . " FROM azienda WHERE 
                    denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ? order by " . $or . " " . ($_SESSION["orderdirect"] ? "desc" : "asc") . " limit " . $offset * $pag_num . "," . $pag_num;
    }
    $stmt = null;
    if (isset($_REQUEST["id_doc"]) && inputType($_REQUEST["id_doc"], 0) == 0) {
        $stmt = $conn->prepare("SELECT azienda.*" . ($_REQUEST["orderby"] == "12" ? ",persona.nome,persona.cognome" : "") . "  FROM azienda WHERE id_docente = ? and
                    denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ?");
        $stmt->bind_param("ssssssss", $_REQUEST["id_doc"], $cerca, $cerca, $cerca, $cerca, $cerca, $cerca, $cerca);
    } else {
        $stmt = $conn->prepare("SELECT * FROM azienda WHERE
                    denominazione_azienda like ?  or settore like ? or referente_aziendale like ? or 
                    leg_iva like ? or indirizzo like ? or comune like ? or cap like ?");
        $stmt->bind_param("sssssss", $cerca, $cerca, $cerca, $cerca, $cerca, $cerca, $cerca);

    }
    $stmt->execute();
    $num_rows = $stmt->get_result()->num_rows;
    $stmt->close();


    $stmt = $conn->prepare($sql);
    if (isset($_REQUEST["id_doc"]) && inputType($_REQUEST["id_doc"], 0) == 0)
        $stmt->bind_param("ssssssss", $_REQUEST["id_doc"], $cerca, $cerca, $cerca, $cerca, $cerca, $cerca, $cerca);
    else
        $stmt->bind_param("sssssss", $cerca, $cerca, $cerca, $cerca, $cerca, $cerca, $cerca);
    $stmt->execute();
    $result = $stmt->get_result();

} else {
    if (isset($_REQUEST["id_doc"]) && inputType($_REQUEST["id_doc"], 0) == 0)
        $sql = "SELECT * FROM azienda where id_docente = " . $_REQUEST["id_doc"] . " limit " . $offset * $pag_num . "," . $pag_num;
    else
        $sql = "SELECT * FROM azienda limit " . $offset * $pag_num . "," . $pag_num;
    $result = $conn->query($sql);

}


?>


<!doctype html>
<html>
<style>
    a:hover {
        cursor: pointer !important;
    }

    .btn-primary {
        border-color: #252526 !important;
    }

    tr:hover > td {
        background-color: #82b0e0;
        color: black;
    }


    thead > tr:nth-child(1) {
        background-color: #252526;
    }

    th > input {
        width: 100% !important;
        background-color: #252526 !important;
    }


    .text_fix {
        text-align: center !important;
    }

    thead {
        table-layout: fixed;
        width: calc(100%);
    }

    .first {
        width: 25px;
    }

    .last {
        width: 17px;
    }

    .table-scroll {
        width: calc(100%);
        overflow-y: scroll;
        height: 400px;
    }

    .bottone {
        width: 120px;
        height: 50px;
        background-color: #FF0000;
        background-image: url('immagine.gif');
        background-repeat: no-repeat;
        background-position: center center;
    }

    h2{
        width: 100%;
    }
    p{
        margin-left: 20%;
    }
</style>


<head>
    <title>Azienda</title>
    <?php require("Include/head.php"); ?>
</head>
<script>
    function docFilter() {
        var url = "?<?php (isset($_REQUEST["orderby"])) ? print("orderby=" . $_REQUEST["orderby"] . "&") : print(""); ?>offset=<?php print($offset) ?>&page_num=<?php print($pag_num) ?>  <?php isset($_REQUEST["testocerca"]) ? printf("&testocerca=%s\"", $_REQUEST["testocerca"]) : print("\"")  ?> ;
        if (document.getElementById("inputGroupSelect01").options[document.getElementById("inputGroupSelect01").selectedIndex].value != 'Seleziona un prof')
            window.location.href = url + "&id_doc=" + document.getElementById("inputGroupSelect01").options[document.getElementById("inputGroupSelect01").selectedIndex].value;
        else
            window.location.href = url;
    }


    function refresh(id) {
        var url = "?orderby=" + id + "&offset=<?php print($offset) ?>&page_num=<?php print($pag_num) ?>  <?php isset($_REQUEST["testocerca"]) ? printf("&testocerca=%s\"", $_REQUEST["testocerca"]) : print("\"")  ?>;
        if (document.getElementById("inputGroupSelect01").options[document.getElementById("inputGroupSelect01").selectedIndex].value != "Seleziona un prof")
            window.location.href = url + "&id_doc=" + document.getElementById("inputGroupSelect01").options[document.getElementById("inputGroupSelect01").selectedIndex].value;
        else
            window.location.href = url;
    }

    function jump(id) {
        window.location.href = "azienda_dettaglio.php?id=" + id;
    }
</script>



<body>
<?php require("Include/navbar.php"); ?>
<?php
if(isset($_POST["salva"]) && $id == -1) {
    printf("<h2><p>Visualizzare <a href = 'azienda_dettaglio.php?id=%s'>azienda</a> aggiunto</p></h2>",$stmt->insert_id);
}
if(isset($_POST["modifica"]) && is_numeric($id)){
    printf("<h2><p>Visualizzare <a href = 'azienda_dettaglio.php?id=%s'>azienda</a> modificato</p></h2>",$id);
}
?>
<div class="container-fluid">
    <div class="row">
        <?php
        require_once("Include/menu.php");
        ?>



        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 justify-content-center">
            <nav class="navbar">
                <h1 class="h2">Azienda</h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    Options
                    <span class="navbar-toggler-icon" style="background-image: url('Images/option_icon.png');"></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                     aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Opzioni</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <li class="nav-item">

                                <b>Aggiungi un'azienda </b>

                                <div class="row justify-content-start">
                                    <form method="POST" action="azienda_dettaglio.php" enctype="multipart/form-data">
                                        <input type="Submit" class="btn btn-outline-secondary" name="submit"
                                               value="Aggiungi"/>
                                    </form>
                                </div>
                                <br>
                            </li>
                            <!--                            <li class="nav-item">-->
                            <!--                                <b>Importa da file</b>-->
                            <!--                                <form action="-->
                            <?php //$_SERVER["PHP_SELF"]; ?><!--" method="POST" enctype="multipart/form-data">-->
                            <!--                                    <div class="input-group">-->
                            <!--                                        <input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">-->
                            <!--                                        <button class="btn btn-outline-secondary" name="btnfile" type="submit" id="inputGroupFileAddon04">Carica</button>-->
                            <!--                                    </div>-->
                            <!--                                </form>-->
                            <!--                                <br>-->
                            <!--                            </li>-->
                            <!--                            <li class="nav-item">-->
                            <!--                                <b>Esporta in csv</b>-->
                            <!--                                <div class="row justify-content-start">-->
                            <!--                                    <form action="-->
                            <?php //$_SERVER["PHP_SELF"]; ?><!--" method="POST" enctype="multipart/form-data">-->
                            <!--                                        <input type="Submit" class="btn btn-outline-dark" id="esporta" name="esporta" value="Esporta Database" />-->
                            <!--                                    </form>-->
                            <!--                                </div>-->
                            <!--                            </li>-->
                        </ul>
                    </div>
                </div>
            </nav>





            <div>
                <nav class="navbar">
                    <div class="container-fluid">
                        <form class="d-flex" method="GET" action="<?php $_SERVER["PHP_SELF"]; ?>">
                            <input class="form-control" name="testocerca" type="text" placeholder="Cerca"
                                   aria-label="Cerca">
                            <button class="btn btn-outline-secondary" type="submit" name="cerca">Cerca</button>
                        </form>
                        <div class="col-md-3">
                            <select class="form-select form-control" id="inputGroupSelect01" onchange="docFilter();"
                                    name="id_doc">
                                <?php
                                if (isset($_REQUEST["id_doc"]) && is_numeric($_REQUEST["id_doc"])) {
                                    $doc = $conn->query("select * from persona where id = " . $_REQUEST["id_doc"]);
                                    if ($doc == false) print("<option selected>Seleziona un prof</option>");
                                    else {
                                        $row = $doc->fetch_assoc();
                                        printf("<option selected value=%s>%s %s</option>", $row["id"], $row["cognome"], $row["nome"]);
                                    }
                                } else {
                                    print("<option selected>Seleziona un prof</option>");
                                }

                                $doc = $conn->query("select distinct * from persona join persona_ruolo on persona.id = persona_ruolo.idpersona where idruolo = 2 and idpersona > 0");
                                if (!($doc == false)){
                                    while ($row = $doc->fetch_assoc()) {
                                        if ($row["idpersona"] != $_REQUEST["id_doc"])
                                            printf("<option value='%s'>" . $row["cognome"] . " " . $row["nome"] . "</option>", $row["idpersona"]);
                                    }
                                    if(isset($_REQUEST["id_doc"]))
                                    print("<option >Seleziona un prof</option>");
                                }

                                ?>

                            </select>
                        </div>

                        <ul class="pagination" style="margin-bottom: 0">
                            <li class="page-item <?php $offset == 0 ? print("disabled") : "" ?>">
                                <?php
                                if ($offset == 0) print('<span class="page-link">Previous</span>');
                                else {
                                    $link = "aziende.php?offset=" . ($offset - 1) . "&pag_num=" . $pag_num . (isset($_REQUEST["testocerca"]) ? "&testocerca=" . $_REQUEST["testocerca"] : "") . (isset($_REQUEST["orderby"]) ? "&orderby=" . $_REQUEST["orderby"] : "") . (isset($_REQUEST["id_doc"]) ? "&id_doc=" . $_REQUEST["id_doc"] : "");
                                    printf("<a class='page-link' href='%s'>Previous</a>", $link);
                                }
                                ?>
                            </li>
                            <li class="page-item active" aria-current="page">
                                <span class="page-link"><?php print($offset + 1); ?></span>
                            </li>
                            <li class="page-item <?php ($offset + 1) * $pag_num > $num_rows ? print("disabled") : "" ?>"
                            ">
                            <?php
                            if (($offset + 1) * $pag_num > $num_rows) print('<span class="page-link">Next</span>');
                            else {
                                $link = "aziende.php?offset=" . ($offset + 1) . "&pag_num=" . $pag_num . (isset($_REQUEST["testocerca"]) ? "&testocerca=" . $_REQUEST["testocerca"] : "") . (isset($_REQUEST["orderby"]) ? "&orderby=" . $_REQUEST["orderby"] : "") . (isset($_REQUEST["id_doc"]) ? "&id_doc=" . $_REQUEST["id_doc"] : "");
                                printf("<a class='page-link' href='%s'>Next</a>", $link);
                            }
                            ?>
                            </li>
                        </ul>
                        <form class="col-md-1" method="GET" action="<?php $_SERVER["PHP_SELF"]; ?>">

                        </form>
                    </div>
                </nav>
            </div>


            <?php generaTabella($result, $conn); ?>


        </main>
    </div>
</div>


<?php require("Include/footer.php"); ?>
</body>


</html>