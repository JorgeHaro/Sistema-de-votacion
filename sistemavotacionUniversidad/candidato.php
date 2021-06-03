<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Votación</title>


<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">


</head>

<style>
  
body{

background-image: url(img/voto.png);


background-size: 100%;


  
}


.contenedor{

border-color: black;
border:20px;
margin-top: 20px;
margin: 50px auto;
border-radius: 10px;
margin-right: 20%;
margin-left: 20%;
width: 60%;
height: 500px;





}

.contenedor:hover{

transition: .8s;
background-color:rgba(0,0,0 ,.2);
box-shadow:inset;
   

}



</style>


<body>
  <nav class="navbar navbar-default">
  <div class="container-fluid"> 
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
     </div>

    <div class="collapse navbar-collapse" id="defaultNavbar1">
<div class="menu1 col-md-7 col-md-offset-3">
      <ul class="nav navbar-nav">
        <li class="active">
        <li><a href="alumnos.php">Agregar Alumno</a></li>
      <li><a href="candidato.php">Agregar candidato</a></li>
        <li><a href="resultados.php">Resultados</a></li>
          <li><a href="index.php">Votación</a></li>  
      </ul>

  </div>
    </div>

  </div>

</nav>

<?php
   require_once("conexion.php");

    
		error_reporting(E_ALL ^ E_NOTICE);
$vacio = isset($_POST['variable']) ? $_POST['variable'] : null ;
    $acceso = isset($_POST['variable']) ? $_POST['variable'] : null ;
	 session_start();
        $cedula=$_SESSION["cedula_alumno"];
  
 if (empty($acceso)) {
   
}
  if (isset($_POST["id_carreras"])){
	 $id_carreras=$_POST["id_carreras"];
	}else{
	$id_carreras="";
	
    }
  if (isset($_POST["municipios"])){
	 $municipio=$_POST["municipios"];
	}else{
	$municipio="";
	}

if (isset($_POST["parroquias"])){
	 $parroquias=$_POST["parroquias"];
	}else{
	$parroquias="";
	}
       if (isset($_POST["nombre"])){
	 $nombre=$_POST["nombre"];
	}else{
	$nombre="";
	}

if (isset($_POST["cedula"])){
	 $cedula=$_POST["cedula"];
	}else{
	$cedula="";
	}
 if (isset($_POST["alumno"])) {
    $alumno=$_POST["alumno"];
}
     if (isset($_POST["cod_candidato"])) {
    $cod_candidato=$_POST["cod_candidato"];
}
     if (isset($_POST["cedula_alumno"])) {
    $alu=$_POST["cedula_alumno"];
}


if (isset($_POST["boton"])) {
    $boton=$_POST["boton"];
	switch ($boton) {
            
		case "guardar":                
             if (empty($cedula)){
	?>
			
			<script>
			alert('Ingrese  cedula');
			</script>
			<?php
			
			break;
	
	}
	if ( is_numeric($cedula)){
	?>
			
			<script>
			alert('Por favor colocar  solo numero en la cedula');
			</script>
			<?php
			
			break;
	
	}
                        if (empty($nombre)){
	?>
			
			<script>
			alert('ingrese  Nombre');
			</script>
			<?php
			
			break;
	
	}
         
          
		$sql="insert into candidatos (cedula_candidato,nombre,cod_candidato) values ('$cedula','$nombre','$cedula') ";
		$resultado=mysqli_query($cx,$sql);
		 if ($resultado){
              	$acceso="aprobado";
			?>
			
	
			<?php
			}
		$cedula="";
		$usuario="";
		$nombre="";
		$clave="";
		$nivel="";
	$clavev="";
		break;
  }
}

?>

<div class="contenedor">
<br>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="text-center"><font color="white" size="7" face="Algerian">Registro de Candidatos</font></h1>
    </div>
  </div>

</div>

 <div class="center-block col-md-4 col-xs-8">

<form name ="acceso" action="candidato.php" role="form" method="post">
  <div class="form-group">

				

					
  <div class="form-group">
    <label for="Usuario"><font color="white" size="4">Código UNI</font></label>
    <input type="text" name="cedula" class="form-control" id="cedula"
           placeholder="">
  </div>
  <div class="form-group">
    <label for="ejemplo_password_1"><font color="white" size="4">Nombre y apellido</font></label>
    <input type="text" name="nombre" class="form-control" id="nombre" 
           placeholder="Ejemplo:Enrique Sandoval Serveleon" required>
  </div>
		
<?php
  
    ?>
<br> <input type ="submit" class="btn btn-primary" name="boton" Value="guardar">


							 <input type ="submit"  class="btn btn-danger" name="boton" Value="Cancelar">
</form>
<?php
    	if ($acceso=="aprobado") {
			  echo '<script>alert("Candidato guardado correctamente")</script> ';
			}
    ?>

</div>
</div>

<script src="js/jquery-1.11.3.min.js"></script>

<script src="js/bootstrap.js"></script>
</body>
</html>
