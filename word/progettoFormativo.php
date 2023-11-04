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
function converti_data($data){
    
    return date_format(date_create($data), 'd-m-Y');

}
// Creating the new document...
$phpWord = new \PhpOffice\PhpWord\PhpWord();
$docname = 'template/Progetto_Formativo.docx';
$fileFinale = 'template/Progetto_Formativo_'.$id_alunno.'.docx';
$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($docname);

$connect = mysqli_connect("localhost", "root", "", "pcto");
   session_start();
$query2 = 'SELECT * from assegnazione WHERE id_alunno=' . $id_alunno . $aziendaSelezionata;


$result2=mysqli_query($connect,$query2);

if(mysqli_num_rows($result2)>0){
    $row2=$result2->fetch_assoc();

$query="SELECT * from attestato WHERE id_assegnazione=".$row2['id'];


$result=mysqli_query($connect,$query);
if(mysqli_num_rows($result)>0){
    $row=$result->fetch_assoc();

$templateProcessor->setValue('nome_al', $row['nome_al']); //tabella persona
$templateProcessor->setValue('cognome_al', $row['cognome_al']); //tabella persona
$templateProcessor->setValue('data_nascita', $row['data_nascita']); //tabella persona
$templateProcessor->setValue('cd_fiscale_al', $row['cod_fiscale_al']); //tabella persona
$templateProcessor->setValue('num_telefono_al', $row['telefono_al']); //tabella persona
$templateProcessor->setValue('mail_al', $row['mail_al']); //tabella persona
$templateProcessor->setValue('indirizzo_res_al', $row['indirizzo_res_al']); //tabella persona
$templateProcessor->setValue('cap_res_al', $row['cap_res_al']); //tabella persona
$templateProcessor->setValue('comune_res_al', $row['residenza_al']); //tabella persona
$templateProcessor->setValue('classe', $row['sezione']); //tabella classe
$templateProcessor->setValue('nome_az', $row['nome_az']); //tabella azienda
$templateProcessor->setValue('indirizzo', $row['indirizzo_az']); //tabella azienda
$templateProcessor->setValue('cap', $row['cap_az']); //tabella azienda
$templateProcessor->setValue('comune', $row['comune_az']); //tabella azienda
$templateProcessor->setValue('comune_leg', $row['leg_comune_az']); //tabella azienda
$templateProcessor->setValue('indirizzo_leg', $row['leg_indirizzo_az']); //tabella azienda
$templateProcessor->setValue('cd_fiscale_az', $row['codice_fiscale_az']); //tabella azienda
$templateProcessor->setValue('nome_cognome_ta', $row['nome_cognome_ta']); //tabella azienda
$templateProcessor->setValue('num_telefono_az', $row['telefono_az']); //tabella azienda
$templateProcessor->setValue('mail_az', $row['mail_az']); //tabella azienda
$templateProcessor->setValue('conv_data', $row['data_conv']); //tabella azienda
$templateProcessor->setValue('conv_protocollo', $row['conv_protocollo']); //tabella azienda
$templateProcessor->setValue('data_inizio', converti_data($row['data_inizio'])); //tabella periodo stage  
$templateProcessor->setValue('data_fine', converti_data($row['data_fine'])); //tabella periodo stage
$templateProcessor->setValue('data_firma', converti_data($row['data_fine'])); //tabella contatti
$templateProcessor->setValue('inizio_mattina', $row['inizio_mattina']); //tabella azienda
$templateProcessor->setValue('fine_mattina', $row['fine_mattina']); //tabella azienda
$templateProcessor->setValue('inizio_pome', $row['inizio_pomeriggio']); //tabella azienda
$templateProcessor->setValue('fine_pome', $row['fine_pomeriggio']); //tabella azienda
$templateProcessor->setValue('nome_ts', $row['nome_ts']); //tabella persona
$templateProcessor->setValue('cognome_ts', $row['cognome_ts']); //tabella persona
$templateProcessor->setValue('num_telefono_ts', $row['telefono_ts']); //tabella persona
$templateProcessor->setValue('mail_ts', $row['mail_ts']); //tabella persona
$templateProcessor->setValue('nome_ta', $row['nome_cognome_ta']); //tabella persona
$templateProcessor->setValue('num_telefono_ta', $row['telefono_ta']); //tabella persona
$templateProcessor->setValue('mail_ta', $row['mail_ta']); //tabella persona
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
