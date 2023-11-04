<?php  
   //entry.php  
   require_once("Include/funz_admin.inc");
   ?>  
<!doctype html>
<html lang="en">
  <head>
    <title>Reports</title>
    <?php require("Include/head.php");?>
  </head>
  <body>

  <?php require("Include/navbar.php");?>

<div class="container-fluid">
  <div class="row">
  <?php require("Include/menu.php");?>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Report</h1>
      </div>
	  <div class="row justify-content-left">
	  <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a target = "_blank" href="dashboard/report/docalunni.pdf" title ="Documentazione Alunno" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/report/docalunni.png" class="card-img-top" alt="Documentazione Alunno">
			  <div class="card-body">
				<p class="card-text" align="center">Documentazione Alunno</p>
			  </div>
			  </a>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a target = "_blank" href="dashboard/report/docdocente.pdf" title ="Documentazione Docenti" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/report/docdocente.png" class="card-img-top" alt="Documentazione Docenti">
			  <div class="card-body">
				<p class="card-text" align="center">Documentazione Docenti</p>
			  </div>
			  </a>
			</div>
		</div>
		<div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a target = "_blank" href="dashboard/report/docaziende.pdf" title ="Documentazione Aziende" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/report/docaziende.png" class="card-img-top" alt="Documentazione Aziende">
			  <div class="card-body">
				<p class="card-text" align="center">Documentazione Aziende</p>
			  </div>
			  </a>
			</div>
		</div>
		<div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;" ><a target = "_blank" href="dashboard/report/docpcto.pdf" title ="Documentazione PCTO"  style="text-decoration:none; color: inherit;">
			  <img src="dashboard/report/docpcto.png" class="card-img-top" alt="Documentazione PCTO">
			  <div class="card-body">
				<p class="card-text" align="center">Documentazione PCTO</p>
			  </div>
			  </a>
			</div>
		</div>
		</div>


    </main>
  </div>
</div>
  <?php require("Include/footer.php");?>
</body>
</html>
