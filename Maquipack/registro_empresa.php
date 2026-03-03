<?php
require("php/conexion.php");

$sql = "SELECT id_transporte, origen, destino FROM transporte";
$stmt = $conexion->query($sql);
$sql2 = "SELECT id_turno, nombre_turno from tipo_turno";
$stmt2 = $conexion -> query($sql2);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="estilos/reg_trab.css">
 <link rel="icon" href="img/logopack2.png" type="jpg">
<title>Registro de empresa</title>


</head>

<body>

<div class="container">

    <div class="left">
        <div class="logo-section">
            <center>
        <img src="img/logopack2.png" alt="Logo" width="100" height="100"> 
        </center></div>
        <h1>REGISTRO DE<br>EMPRESA</h1>
        <div class="regresar" onclick="history.back()">Regresar</div>
    </div>

    <div class="right">
        <h2>DATOS</h2>

        <form method="post" action="php/registro_empresa.php">
            <input type="text" name="nombre" placeholder="Nombre de empresa" require>
            <input type="text" name="colonia" placeholder="Colonia" require>
            <input type="text" name="calle" placeholder="Calle" require>
            <input type="text" name="c_p" placeholder="C.P" require>
            <input type="text" name="nombre_encargado" placeholder="Nombre de encargado" require>
            <input type="text" name="telefono_encargado" placeholder="Teléfono" require>
              <label for="">Ruta de transporte</label>
   <select name="id_transporte" required>
    <option value="">Selecciona ruta</option>

    <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
        <option value="<?php echo $row['id_transporte']; ?>">
            <?php echo $row['origen'] . " → " . $row['destino']; ?>
        </option>
    <?php } ?>
     
</select>
<label for="">Turno de la empresa</label>
   <select name="id_turno" required>
    <option value="">Selecciona el turno</option>

    <?php while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)) { ?>
        <option value="<?php echo $row['id_turno']; ?>">
            <?php echo $row['nombre_turno'] ; ?>
        </option>
    <?php } ?>
</select>
 <label for="">Pago de Turno</label>
        <input type="number" name="pago_turno" id="">
        <label for="">Pago horas extras</label>
        <input type="number" name="hora_extra" id="">

            <button type="submit">REGISTRAR</button>
        </form>
    </div>

</div>

<!-- <script src="script/reg_trab.js"></script> -->

</body>
</html>