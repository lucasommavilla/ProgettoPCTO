<?php

use PhpOffice\PhpWord\Template;
use PhpOffice\PhpWord\TemplateProcessor;

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
require_once 'bootstrap.php';

function converti_data($data){
    
    return date_format(date_create($data), 'd-m-Y');

}

function getAnno($data){
    
    return date_format(date_create($data), 'Y');

}

$phpword = new \PhpOffice\PhpWord\PhpWord();
$docname = 'template\Firma_Presenze.docx';
$fileFinale = "template/Firma_Presenze_".$id_alunno.".docx";
$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($docname);

//$connect = mysqli_connect("localhost","root","","pcto");
//session_start();
$query2 = 'SELECT * from assegnazione WHERE id_alunno=' . $id_alunno . $aziendaSelezionata;


$result2 = mysqli_query($conn,$query2);
if(mysqli_num_rows($result2) > 0){
    $row2 = $result2->fetch_assoc();

$query = "SELECT * from attestato WHERE id_assegnazione =".$row2['id'];

$result = mysqli_query($conn,$query);
if(mysqli_num_rows($result) > 0){
    $row = $result->fetch_assoc();

    $templateProcessor->setvalue('nome',$row['nome_al']);
    $templateProcessor->setvalue('cognome',$row['cognome_al']);
    $templateProcessor->setvalue('classe',$row['sezione']);
    $templateProcessor->setvalue('anno',$row['anno']);
    $templateProcessor->setvalue('anno_firma',getAnno($row['data_inizio']));
    $templateProcessor->setvalue('azienda',$row['nome_az']);
    $templateProcessor->setvalue('data_inizio',converti_data($row['data_inizio']));
    $templateProcessor->setvalue('data_fine',converti_data($row['data_fine']));
    $templateProcessor->setvalue('data_firma',converti_data($row['data_fine']));
    $templateProcessor->setvalue('nome_ts',$row['nome_ts']);
    $templateProcessor->setvalue('cognome_ts',$row['cognome_ts']);
    $templateProcessor->setvalue('nome_ta',$row['nome_cognome_ta']);
    header("Content-Description: File Transfer");
        header('Content-Disposition: attachment; filename="' . $fileFinale . '"');
        header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
        header('Content-Transfer-Encoding: binary');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Expires: 0');
        $templateProcessor->saveAs("php://output");
}}

// echo "Template vuoto <a href=$docname>$docname</a><br>";
// echo "Che abbia fatto? <a href=$fileFinale>$fileFinale</a>";
?>