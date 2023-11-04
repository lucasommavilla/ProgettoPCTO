<?php
require("Include/db_connection.inc");
//entry.php  
session_start();
if (!isset($_SESSION["username"])) {
  header("location:login.php?action=login");
}
$sql = 'select password from persona where id =(select id from persona where login="' . $_SESSION["username"] . '");';
$nome = "";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  $row = $result->fetch_assoc();
  $psw = htmlspecialchars($row["password"]);
}

if (isset($_POST["submit"])) {
  $sql = "update persona set `password` = md5('" . $_POST["nuovaPassword2"] . "') WHERE persona.id = (select id from persona where login='" . $_SESSION["username"] . "');";
  $conn->query($sql);
  header("location:index.php");
}
?>
<!doctype html>
<html lang="en">

<head>
  <title>Planck PCTO</title>
  <?php require("Include/head.php"); ?>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="../../../../favicon.ico">

  <title>Signin Template for Bootstrap</title>

  <!-- Bootstrap core CSS -->
  <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->

  <style>
    html,
    body {
      height: 100%;
    }

    body {
      display: -ms-flexbox;
      display: -webkit-box;
      display: flex;
      -ms-flex-align: center;
      -ms-flex-pack: center;
      -webkit-box-align: center;
      align-items: center;
      -webkit-box-pack: center;
      justify-content: center;
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: 0 auto;
      top: 5%;
    }

    .form-signin .checkbox {
      font-weight: 400;
    }

    .form-signin .form-control {
      position: relative;
      box-sizing: border-box;
      height: auto;
      padding: 10px;
      font-size: 16px;
    }

    .form-signin .form-control:focus {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
  </style>
  <script src="md5.js"></script>
  <script>
    function check() {
      var psw = "<?php echo $psw;
                ?>";
      var oldpsw = document.getElementById("vecchiaPassword").value;
      oldpsw = md5(oldpsw);
      var psw1 = document.getElementById("nuovaPassword1").value;
      var psw2 = document.getElementById("nuovaPassword2").value;
      if (oldpsw == psw) {
        if (psw1 == psw2) {
          return true;
        } else {
          document.getElementById("errore2").style.display = "block";
        }
      } else {
        document.getElementById("errore").style.display = "block";
      }
      return false;
    }
  </script>
</head>

<body class="text-center">

  <form class="form-signin" action="#" method="POST" onsubmit="return check()">
    <img class="mb-4" src="Images/logo.jpeg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Reimposta password</h1>
    <label for="vecchiaPassword" class="sr-only">Vecchia Password</label>
    <input type="text" id="vecchiaPassword" class="form-control" placeholder="Vecchia password" required autofocus>
    <label for="nuovaPassword1" class="sr-only">Nuova Password</label>
    <input type="password" id="nuovaPassword1" class="form-control" placeholder="Nuova password" required>
    <label for="nuovaPassword2" class="sr-only">Conferma nuova password</label>
    <input type="password" name="nuovaPassword2" id="nuovaPassword2" class="form-control" placeholder="Nuova password" required>
    <div class="checkbox mb-3">
    </div>
    <input class="btn btn-lg btn-primary btn-block" type="submit" name="submit" value="Reimposta Password">
    <p id="errore" style="display: none; color:red">Password vecchia sbagliata</p>
    <p id="errore2" style="display: none; color:red">Password nuove non corrispondenti</p>
  </form>

  <?php require("Include/footer.php"); ?>
</body>

</html>