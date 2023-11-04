<?php

require_once 'bootstrap.php';

// Creating the new document...
$phpWord = new \PhpOffice\PhpWord\PhpWord();

$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor('Template.docx');

$templateProcessor->setValue('firstname', 'Lin');
$templateProcessor->setValue('lastname', 'Ruize');

$templateProcessor->saveAs("pippo.docx");

echo "Template vuoto <a href='Template.docx'>Template.docx</a><br>";

echo "Che abbia fatto? <a href='pippo.docx'>pippo.docx</a>";

?>
