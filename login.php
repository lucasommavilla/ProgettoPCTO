<?php
//$connect = mysqli_connect("localhost", "root", "", "pcto");
require("Include/db_connection.inc");
//mettete il nome del db che avete dato voi, lunedi 24/1 impostiamo tutti "PCTO" come nome comune
//in piu bisogna cambiare al fine di utilizzare solo la classe in comune per instaurare la connessione con il db
session_start();
if (isset($_SESSION["username"])) {
   header("location:index.php");
}
if (isset($_POST["register"])) {
   if (isset($_POST["username"]) || isset($_POST["password"])) {
      if (empty($_POST["username"]) || empty($_POST["password"])) {
         echo '<script>alert("Both Fields are required")</script>';
      } else {
         $username = mysqli_real_escape_string($conn, $_POST["username"]);
         $password = mysqli_real_escape_string($conn, $_POST["password"]);
         $password = md5($password);
         $query = "INSERT INTO persona (login, password) VALUES('$username', '$password')";
         if (mysqli_query($conn, $query)) {
            echo '<script>alert("Registration Done")</script>';
         }
      }
   }
}

if (isset($_POST["login"])) {
   if (isset($_POST["username"]) || isset($_POST["password"])) {
      if (empty($_POST["username"]) || empty($_POST["password"])) {
         echo '<script>alert("Both Fields are required")</script>';
      } else {
         $username = mysqli_real_escape_string($conn, $_POST["username"]);
         $password = mysqli_real_escape_string($conn, $_POST["password"]);
         $password = md5($password);
         $query = "SELECT * FROM persona WHERE login = '$username' AND password = '$password'";
         $result = mysqli_query($conn, $query);
         if (mysqli_num_rows($result) > 0) {
            echo print_r($row = $result->fetch_assoc());
            echo $row['id'];
            $_SESSION['username'] = $username;
            $_SESSION['idpersonaloggata'] = $row['id'];
            $sql = 'SELECT pr.idruolo FROM persona_ruolo pr where idpersona = ' . $_SESSION['idpersonaloggata'];
            $result = mysqli_query($conn, $sql);
            if (mysqli_num_rows($result) > 0) {
               $row = $result->fetch_assoc();
               $_SESSION["idruolo"] = $row['idruolo'];
            }
            if ($_SESSION["idruolo"] == 3) header("location:home-studente.php");
            //if($_SESSION["idruolo"]==5) header("location:home-azienda.php");  
            if ($_SESSION["idruolo"] != 3 && $_SESSION["idruolo"] != 5) header("location:index.php");
         } else {
            echo '<script>alert("Wrong User Details")</script>';
         }
      }
   }
}
?>
<html>

<head>
   <title>Max Planck | PCTO</title>
   <link rel="icon" href="Images/iconaplanck.ico" />
   <meta charset="utf-8">
   <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
   <!-- Bootstrap core CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style type="text/css" media="screen">
   .gradient-custom-2 {
      background: linear-gradient(217deg, rgba(255, 0, 0, .8), rgba(255, 0, 0, 0) 70.71%),
         linear-gradient(127deg, rgba(0, 0, 208, .8), rgba(40, 79, 208, 0) 70.71%),
         linear-gradient(336deg, rgba(0, 0, 255, .8), rgba(0, 0, 255, 0) 70.71%);
   }
</style>
<section class="vh-100 gradient-custom-2" style="background-color: #ffffff">
   <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
         <div class="col col-xl-10">
            <div class="card bg-grey text-white" style="border-radius: 1rem;">
               <div class="row align-items-center">
                  <div class="col-md-6 col-lg-5 d-none d-md-block">
                     <img src="Images/PCTO_logo2.png" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; width: 450px; height:520,5" />
                  </div>
                  <div class="col-md-6 col-lg-7 d-flex align-items-center">
                     <div class="card-body p-4 p-lg-5 text-black">
                        <form method="POST">
                           <div class="d-flex align-items-center mb-3 pb-1">
                              <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                              <span class="h1 fw-bold mb-0"><img src="Images/logo.jpeg" alt="logo" width="9%" height="9%"> ITIS Max Planck</span>
                           </div>
                           <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Accedi all'app PCTO</h5>
                           <div class="form-outline mb-4">
                              <input type="text" name="username" class="form-control form-control-lg" minlength="8" />
                              <label class="form-label" for="form2Example17">Username</label>
                           </div>
                           <div class="form-outline mb-4">
                              <input type="password" name="password" class="form-control form-control-lg" minlength="8" />
                              <label class="form-label" for="form2Example27">Password</label>
                           </div>
                           <div class="pt-1 mb-4">
                              <input type="submit" name="login" value="Login" class="btn btn-dark btn-lg btn-block" />

                              <input type="submit" name="register" value="Register" class="btn btn-dark btn-lg btn-block" />
                              <!-- -->
                           </div>
                           <a class="small text-muted" href="#!">Password dimenticata?</a>
                           <p class="mb-5 pb-lg-2" style="color: #393f81;"></p>
                           © 2023 Copyright: Max Planck
                           <br />
                           Credits: Luca Sommavilla, Alessandroo Busatto & </br> Tommaso Bordignon
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

</html>