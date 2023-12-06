<?php  
	require_once("Include/funz_admin.inc");
   ?>  
<!doctype html>
<html lang="en">
  <head>
    <title>Planck PCTO</title>
    <?php require("Include/head.php");?>
  </head>
  <body>
    
  <?php require("Include/navbar.php");?>

<div class="container-fluid">
  <div class="row">
    <?php require("Include/menu.php");?>
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Gestionale PCTOO</h1>
      </div>
	  <div class="row justify-content-left">
	  <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a href="studenti.php" title ="Studenti" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/imm/studenti.jpg" width="15%" height="20%" class="card-img-top" alt="Studenti" >
			  <div class="card-body">
				<p class="card-text" align="center">STUDENTI</p>
			  </div>
			  </a>
			</div>
		</div>
	  <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a href="docenti.php" title ="Docenti" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/imm/docenti.jpg" width="15%" height="20%" class="card-img-top" alt="Docenti">
			  <div class="card-body">
				<p class="card-text" align="center">DOCENTI</p>
			  </div>
			  </a>
			</div>
		</div>
    <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a href="segretario.php" title ="Segretari" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/imm/segretari.jpg" width="15%" height="20%" class="card-img-top" alt="Segretari">
			  <div class="card-body">
				<p class="card-text" align="center">SEGRETARI</p>
			  </div>
			  </a>
			</div>
		</div>
	  <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a href="aziende.php" title ="Aziende" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/imm/aziende.jpg" width="15%" height="20%" class="card-img-top" alt="Aziende">
			  <div class="card-body">
				<p class="card-text" align="center">AZIENDE</p>
			  </div>
			  </a>
			</div>
		</div>
	  <div class="col-md-4 col-sm-6 mb-2">
		  <div class="card" style="width: 18rem;"><a href="report.php" title ="Reports" style="text-decoration:none; color: inherit;">
			  <img src="dashboard/imm/report.jpg" width="15%" height="20%" class="card-img-top" alt="Reports">
			  <div class="card-body">
				<p class="card-text" align="center">REPORTS</p>
			  </div>
			  </a>
			</div>
		</div>
	  </div>
    </div>
    </main>
  </div>
</div>
  <?php require("Include/footer.php");?>
</body>
</html>
