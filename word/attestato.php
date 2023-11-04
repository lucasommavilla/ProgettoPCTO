<?php
require("../Include/db_connection.inc");
session_start();
$id_alunno = "";
$aziendaSelezionata = "";
if (isset($_SESSION["aziendaSelezionata"])) {
    $aziendaSelezionata = ' AND id_azienda="' . $_SESSION["aziendaSelezionata"] . '"';
}
$sql = 'select id from persona where id=(select id from persona where login="' . $_SESSION["username"] . '");';
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $id_alunno = htmlspecialchars($row["id"]);
}
//$id_alunno = 4;
require_once 'bootstrap.php';
function converti_data($data)
{

    return date_format(date_create($data), 'd-m-Y');
}
// Creating the new document...
$phpWord = new \PhpOffice\PhpWord\PhpWord();
$docname = 'template/Attestato_frequenza.docx';
$fileFinale = "template/Attestato_frequenza_" . $id_alunno . ".docx";
$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($docname);

/*SELECT id_alunno, id_azienda, id_docente_tutor, id_azienda_tutor, data_inizio, data_fine
FROM assegnazione a
JOIN persona p on p.id = a.id_alunno JOIN azienda az on az.id=a.id_azienda JOIN az on az.id*/

/*SELECT a.id, al.nome AS nome_al, al.cognome AS cognome_al, cl.sezione, cl.anno, az.nome AS nome_az, a.data_inizio, a.data_fine, ts.nome AS nome_ts, ts.cognome AS cognome_ts, ta.nome AS nome_ta, ta.cognome AS cognome_ta
FROM assegnazione a
JOIN persona al ON a.id_alunno=al.id
JOIN classe_studente cs ON a.id_alunno=cs.idpersona
JOIN classe cl ON cs.idclasse=cl.id
JOIN azienda az ON az.id=a.id_azienda
JOIN persona ts ON ts.id=a.id_docente_tutor
JOIN persona ta ON ta.id=a.id_azienda_tutor*/
//WHERE a.id=':id:'
$connect = mysqli_connect("localhost", "root", "", "pcto");
//session_start();

$query2 = 'SELECT * from assegnazione WHERE id_alunno=' . $id_alunno . $aziendaSelezionata;

$result2 = mysqli_query($connect, $query2);

if (mysqli_num_rows($result2) > 0) {
    $row2 = $result2->fetch_assoc();

    $query = "SELECT * from attestato WHERE id_assegnazione=" . $row2['id'];


    $result = mysqli_query($connect, $query);
    if (mysqli_num_rows($result) > 0) {
        $row = $result->fetch_assoc();
        // date_format($row['data_fine'], 'd-m-Y')
        $templateProcessor->setValue('nome', $row['nome_al']); //tabella persona
        $templateProcessor->setValue('cognome', $row['cognome_al']); //tabella persona
        $templateProcessor->setValue('classe', $row['sezione']); //tabella classe
        $templateProcessor->setValue('azienda', $row['nome_az']); //tabella azienda
        $templateProcessor->setValue('data_inizio', converti_data($row['data_inizio'])); //tabella periodo stage  
        $templateProcessor->setValue('data_fine', converti_data($row['data_fine'])); //tabella periodo stage
        $templateProcessor->setValue('data_firma', converti_data($row['data_fine'])); //tabella contatti
        $templateProcessor->setValue('nome_ts', $row['nome_ts']); //tabella persona
        $templateProcessor->setValue('cognome_ts', $row['cognome_ts']); //tabella persona
        $templateProcessor->setValue('nome_ta', $row['nome_cognome_ta']); //tabella persona


        header("Content-Description: File Transfer");
        header('Content-Disposition: attachment; filename="' . $fileFinale . '"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
        header('Content-Transfer-Encoding: binary');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Expires: 0');
        $templateProcessor->saveAs("php://output");
    }
}

//echo "Template vuoto <a href=$docname download="$docname"> $docname</a><br>";
//echo "Che abbia fatto? <a href=".$fileFinale." download=".$docname.">$fileFinale</a>";
