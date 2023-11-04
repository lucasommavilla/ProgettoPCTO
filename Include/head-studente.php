<?php
if (!isset($_SESSION["username"])) {
  header("location:login.php");
} else {
  if ($_SESSION["idruolo"] != 3 && $_SESSION["idruolo"] != 5) {
?>
    <center>
      <br><br>
      <h1><b>Questa sezione è accessibile al solo personale autorizzato</b></h1>
      <h3>reindirizzamento in corso</h3>
    </center>';
<?php
    header("refresh:3;url=index.php");
    exit();
  }
}
if (!isset($_SESSION["aziendaSelezionata"])) {
  $_SESSION["aziendaSelezionata"] = -1;
}
?>
<link rel="icon" href="Images/iconaplanck.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="5DII 2021/2022">


<!-- Bootstrap core CSS -->
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  tr:hover>td {
    background-color: #dadde3;
  }

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