<?php
//entry.php
    require_once("Include/funz_admin.inc");
    require_once("Include/db_connection.inc");


$id = "";
$id_docente = "";
$n_info = "";
$n_tele = "";
$n_ele = "";
$n_auto = "";
$n_liceo = "";
$n_totale = "";
$denominazione_azienda = "";
$settore = "";
$indirizzo = "";
$cap = "";
$comune= "";
$referente_aziendale = "";
$tutor_aziendale = "";
$telefono = "";
$inizioam = "";
$fineam = "";
$iniziopm = "";
$finepm = "";
$email = "";
$sito = "";
$n_dipe = "";
$settore_attivita = "";
$leg_denomi = "";
$leg_via = "";
$leg_comune = "";
$leg_nomecognome="";
$leg_datanascita = "";
$leg_comunenascita = "";
$leg_iva = "";
$rapleg_conven = "";
$rapleg_codicefiscale = "";
$rapleg_convenzionedata = "";
$commento = "";

if (isset($_GET["id"])) {
    $id = $_GET["id"];
    $sql = "SELECT * FROM azienda where id = " . $id;
    $result = $conn->query($sql)->fetch_assoc();
    $id_docente = $result["id_docente"];
    $n_info = $result["n_informatici"];
    $n_tele = $result["n_telecomunicazioni"];
    $n_ele = $result["n_elettronici"];
    $n_auto = $result["n_automazioni"];
    $n_liceo = $result["n_liceo"];
    $n_totale = $result["n_totale"];
    $denominazione_azienda = $result["denominazione_azienda"];
    $settore = $result["settore"];
    $indirizzo = $result["indirizzo"];
    $cap = $result["cap"];
    $comune= $result["comune"];
    $referente_aziendale = $result["referente_aziendale"];
    $tutor_aziendale = $result["tutor_aziendale"];
    $telefono = $result["telefono"];
    $inizioam = $result["inizioam"];
    $fineam = $result["fineam"];
    $iniziopm = $result["iniziopm"];
    $finepm = $result["finepm"];
    $email = $result["email"];
    $sito = $result["sito"];
    $n_dipe = $result["n_dipendenti"];
    $settore_attivita = $result["settore_attivita"];
    $leg_denomi = $result["leg_denominazioneazienda"];
    $leg_via = $result["leg_via"];
    $leg_comune = $result["leg_comune"];
    $leg_nomecognome=$result["leg_nomecognome"];
    $leg_datanascita = $result["leg_datanascita"];
    $leg_comunenascita = $result["leg_comunenascita"];
    $leg_iva = $result["leg_iva"];
    $rapleg_conven = $result["rapleg_convenzioneprotocolo"];
    $rapleg_codicefiscale = $result["rapleg_codicefiscale"];
    $rapleg_convenzionedata = $result["rapleg_convenzionedata"];
    $commento = $result["commento"];
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Azienda dettaglio</title>
    <style>
        .feather {
            vertical-align: baseline !important;
        }

    </style>
    <?php require("Include/head.php"); ?>
    <script>
        var eliminaButton,backButton,noteButton,modifyButton,rootButton;
        function initia(){
            eliminaButton = document.getElementById('eliminaButton');
            backButton = document.getElementById('backButton');
            noteButton = document.getElementById('noteButton');
            rootButton = document.getElementById("rootButton");
        }

        function nota(id) {
            window.location.href = "nota.php?id=" + id;
        }
        function elimina(id){
            co = confirm("Vuoi veramente eliminare questa azienda?");
            if(co)
            window.location.href="aziende.php?elimina=&id="+id;
        }
        var a = [];
        function modify(object){
            formNodes = document.getElementsByClassName("form-control");
            modifyButton = object;
            for(i = 0;i<34;i++){
                formNodes[i].disabled = false;
                a[i] = formNodes[i].value;
            }

            ParentElimina = eliminaButton.parentNode;
            console.log(ParentElimina);
            ParentElimina.removeChild(eliminaButton);
            document.getElementById("buttonMenu").removeChild(backButton);
            document.getElementById("buttonMenu").removeChild(noteButton);
            newEle = document.createElement("input");
            newEle.setAttribute("type","submit");
            newEle.setAttribute("name","modifica");
            newEle.setAttribute("id","saveButton");
            newEle.setAttribute("value","Salva");
            newEle.setAttribute("class","btn btn-secondary float-end");
            ParentElimina.append(newEle);

            newEle1 = document.createElement("button");
            newEle1.setAttribute("type","button");
            newEle1.setAttribute("name","unmodify");
            newEle1.setAttribute("id","unModify");
            newEle1.textContent = "Annulla Modifica";
            newEle1.addEventListener("click",unModify);
            newEle1.setAttribute("class","btn btn-secondary");
            object.parentNode.append(newEle1);

            object.parentNode.removeChild(object);
        }
        function unModify(){
            formNodes = document.getElementsByClassName("form-control");
            for(i = 0;i<34;i++){
                formNodes[i].value = a[i];
                formNodes[i].disabled = true;
            }
            document.getElementById("unModify").parentNode.removeChild(document.getElementById("unModify"));
            document.getElementById("buttonMenu").append(backButton);
            document.getElementById("buttonMenu").append(noteButton);
            document.getElementById("buttonMenu").append(modifyButton);
            document.getElementById("rootButton").append(eliminaButton);
            document.getElementById("saveButton").parentNode.removeChild(document.getElementById("saveButton"));
            initia();

        }
        function back(){
            var url = "aziende.php?<?php (isset($_GET["orderby"])) ? print("orderby=".$_GET["orderby"]."&") : print(""); ?><?php (isset($_GET["offset"])) ? print("offset=".$_GET["offset"]."&") : print(""); ?><?php isset($_GET["page_num"]) ? print("page_num=".$_GET["page_num"]."&") : print(""); ?> <?php (isset($_GET["id_doc"])) ? print("id_doc=".$_GET["id_doc"]."&") : print(""); ?>  <?php isset($_GET["testocerca"]) ? printf("&testocerca=%s\"", $_GET["testocerca"]) : print("\"")  ?> ;

            window.location.href = url;
        }
    </script>
</head>
<body onload="initia()">
<?php require("Include/navbar.php"); ?>

<div class="container-fluid">
    <div class="row">
        <?php
        require_once("Include/menu.php");
        ?>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <nav class="navbar">
                <nav class="navbar">
                    <div class="container-fluid">
                        <p class="h2 mb-3"><?php isset($_GET["id"]) ? print($denominazione_azienda) : print("Nuovo azienda"); ?></p>
                    </div>
                </nav>
            </nav>

            <form action="aziende.php" method="POST">
                <input type="hidden" name="id" value="<?php print($id); ?>">
                <?php
                if (isset($_GET["page_num"]))
                    echo "<input type='hidden' name = 'page_num' value='" . $_GET['page_num'] . "'>";
                if (isset($_GET["offset"]))
                    echo "<input type='hidden' name = 'offset' value='" . $_GET['offset'] . "'>";
                if (isset($_GET['orderby']))
                    echo "<input type='hidden' name = 'orderby' value='" . $_GET['orderby'] . "'>";
                if (isset($_GET['id_doc']))
                    echo "<input type='hidden' name = 'id_doc' value='" . $_GET['id_doc'] . "'>";
                if (isset($_GET['testocerca']))
                    echo "<input type='hidden' name = 'testocerca' value='" . $_GET['testocerca'] . "'>";

                ?>
                <div class="mb-4 clearfix" id="rootButton">
                    <div class="btn-toolbar float-start" id="buttonMenu" role="toolbar" aria-label="Toolbar with button groups">
                        <div class="btn-group me-2" id="backButton" role="group" aria-label="First group">
                            <button type="button" onclick="back()" name="indietro" value=""
                                    class="btn btn-secondary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-arrow-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                </svg>
                            </button>
                        </div>
                        <?php
                        if (isset($_GET['id']))
                            echo '<div class="btn-group me-2" id="noteButton" role="group" aria-label="Second group">
                                    <a onclick="nota(' . $_GET["id"] . ')"  class="btn btn-secondary"> Apri note </a>
                                    </div>'
                        ?>
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <?php
                            if(isset($_GET['id'])){
                                print("<button type='button' id='modifica' class='btn btn-secondary' onclick='modify(this)' >Modifica</button>");
                            }
                            else{
                                print("<input type='submit' name='salva' value='Salva' class='btn btn-secondary'>");
                            }
                            ?>
                        </div>
                    </div>
                    <?php
                    if(isset($_GET["id"]) )
                    printf("<button type='button' id='eliminaButton'  onclick='elimina(%d)'
                           class='btn btn-danger float-end'>Elimina azienda</button>",$_GET["id"]);
                    ?>
                </div>
                <div class="justify-content-center">
                    <p class="fs-5">
                        <span data-feather="briefcase"></span>
                        <span>Dati azienda</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Nome azienda *</label>
                        <div class="col-md-5 col-sm-3">
                            <input type="text" name="denominazione_azienda" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($denominazione_azienda); ?>" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Referente</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="referente_aziendale" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($referente_aziendale); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Tutor *</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="tutor_aziendale" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($tutor_aziendale); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Settore attivita</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="settore_attivita" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($settore_attivita); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Settore</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="settore" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($settore); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Email *</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="email" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($email); ?>" required>
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Telefono *</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="telefono" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($telefono); ?>" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Sito</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="sito" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($sito); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Dipendenti</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="n_dipendenti" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($n_dipe); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Docente</label>
                        <div class="col-md-3 col-sm-3">
                            <select class="form-select form-control" <?php if(isset($_GET["id"])) print("disabled") ?> id="inputGroupSelect01" name="id_docente">
                                <?php
                                    $id_doc =null;
                                    if(isset($_GET["id"]) && is_numeric($_GET["id"])){
                                        $result = $conn->query("select persona.* from azienda join persona on azienda.id_docente = persona.id where azienda.id = ".$_GET["id"]);
                                        if($result->num_rows == 0) print("<option selected>Seleziona un prof</option>");
                                        else {
                                            $row = $result->fetch_assoc();
                                            $id_doc = $row["id"];
                                            printf("<option selected value=%s>%s %s</option>",$row["id"],$row["nome"],$row["cognome"]);
                                        }
                                    }
                                    else{
                                        print("<option selected>Seleziona un prof</option>");
                                    }

                                    $result = $conn->query("select distinct * from persona join persona_ruolo on persona.id = persona_ruolo.idpersona where idruolo = 2 and idpersona > 0");
                                    if(!($result == false))while($row = $result->fetch_assoc()){
                                        if($row["idpersona"]!=$id_doc)
                                        printf("<option value='%s'>".$row["cognome"]." ".$row["nome"]."</option>",$row["idpersona"]);
                                    }
                                ?>

                            </select>
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">
                    <p class="fs-5">
                        <span data-feather="map-pin"></span>
                        <span>Indirizzo</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Via * </label>
                        <div class="col-md-5 col-sm-3">
                            <input type="text" name="indirizzo" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($indirizzo); ?>" required>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Comune * </label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="comune" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($comune); ?>" required>
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Cap * </label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="cap" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($cap); ?>" required>
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">

                    <p class="fs-5">
                        <span data-feather="briefcase"></span>
                        <span>Dati sede legale</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Nome azienda</label>
                        <div class="col-md-5 col-sm-3">
                            <input type="text" name="leg_denominazioneazienda" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($leg_denomi); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Via</label>
                        <div class="col-md-5 col-sm-3">
                            <input type="text" name="leg_via" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($leg_via); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Comune</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="leg_comune" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($leg_comune); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Partita IVA</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="leg_iva" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($leg_iva); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Convenzione Prot</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="rapleg_convenzioneprotocolo" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($rapleg_conven); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Convenzione Data</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="rapleg_convenzionedata" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($rapleg_convenzionedata); ?>">
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">
                    <p class="fs-5">
                        <span data-feather="user"></span>
                        <span>Dati rappresentante legale</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Rappresentante</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="leg_nomecognome" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($leg_nomecognome); ?>" >
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Codice fiscale</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="rapleg_codicefiscale" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($rapleg_codicefiscale); ?>" >
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Comune nascita</label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" name="leg_comunenascita" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($leg_comunenascita); ?>" >
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Data nascita</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="leg_datanascita" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($leg_datanascita); ?>" >
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">
                    <p class="fs-5">
                        <span data-feather="users"></span>
                        <span>Ospitalità</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Info</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_informatici" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($n_info); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Tele</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_telecomunicazioni" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($n_tele); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Ele</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_elettronici" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($n_ele); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Auto</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_automazioni" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?>
                                   value="<?php print($n_auto); ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Liceo</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_liceo" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($n_liceo); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Totale</label>
                        <div class="col-md-2 col-sm-3">
                            <input type="text" name="n_totale" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($n_totale); ?>">
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">
                    <p class="fs-5">
                        <span data-feather="clock"></span>
                        <span>Tempo lavoro</span>
                    </p>
                    <div class="mb-3 row input-group">
                        <label class="col-md-1 col-sm-3 col-form-label">Mattina</label>
                        <div class="col-md-1 col-sm-3" style="padding: 0">
                            <input type="text" name="inizioam" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($inizioam); ?>">
                        </div>
                        <span class="col-md-1 col-sm-1 col-form-label input-group-text">Fino a</span>
                        <div class="col-md-1 col-sm-3" style="padding: 0">
                            <input type="text" name="fineam" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($fineam); ?>">
                        </div>
                        <label class="col-md-1 col-sm-3 col-form-label">Pomeriggio</label>
                        <div class="col-md-1 col-sm-3" style="padding: 0">
                            <input type="text" name="iniziopm" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($iniziopm); ?>">
                        </div>
                        <span class="col-md-1 col-sm-1 col-form-label input-group-text">Fino a</span>
                        <div class="col-md-1 col-sm-3" style="padding: 0">
                            <input type="text" name="finepm" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> value="<?php print($finepm); ?>">
                        </div>
                    </div>
                    <hr class="mt-2 mb-3">

                    <p class="fs-5">
                        <span data-feather="clipboard"></span>
                        <span>Altro</span>
                    </p>
                    <div class="mb-3 row">
                        <label class="col-md-1 col-sm-3 col-form-label">Commento </label>
                        <div class="col-md-8 col-sm-3">
                            <textarea name="commento" class="form-control" <?php if(isset($_GET["id"])) print("disabled") ?> ><?php print($commento); ?></textarea>
                        </div>
                    </div>
                </div>
            </form>

        </main>

    </div>
</div>


<?php require("Include/footer.php"); ?>
</body>
</html>

