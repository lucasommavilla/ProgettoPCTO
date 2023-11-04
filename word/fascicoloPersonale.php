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
require_once 'bootstrap.php';

// Creating the new document...
$phpWord = new \PhpOffice\PhpWord\PhpWord();
$docname = "template/Fascicolo_Personale.docx";
$fileFinale = "template/Fascicolo_Personale_".$id_alunno.".docx";
$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($docname);

$connect = mysqli_connect("localhost", "root", "", "pcto");
session_start();
$query2 = 'SELECT * from assegnazione WHERE id_alunno=' . $id_alunno . $aziendaSelezionata;

$result2=mysqli_query($connect,$query2);
if(mysqli_num_rows($result2)>0){
    $row2=$result2->fetch_assoc();

$query="SELECT * from attestato WHERE id_assegnazione=".$row2['id'];
}

$result=mysqli_query($connect,$query);
if(mysqli_num_rows($result)>0){
    $row=$result->fetch_assoc();

$templateProcessor->setValue('cognome',$row['nome_al']);
$templateProcessor->setValue('nome', $row['cognome_al']);
}

header("Content-Description: File Transfer");
header('Content-Disposition: attachment; filename="' . $fileFinale . '"');
header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
header('Content-Transfer-Encoding: binary');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Expires: 0');
$templateProcessor->saveAs("php://output");

// echo "Template vuoto <a href=$docname>$docname</a><br>";

// echo "Che abbia fatto? <a href=$fileFinale>$fileFinale</a>";
