<?php
require("php/conexion.php");

$sql = "SELECT id_usuario, nombre FROM usuario ORDER BY nombre";
$stmt = $conexion->query($sql);


?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Control de asistencia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos/turnos.css">
     <link rel="icon" href="img/logopack2.png" type="jpg">
</head>
<body>

<div class="container">
    <h1>Control de asistencia, Horas extras y turnos</h1>
<form method="POST" action="php/guardar_asistencia.php">

    <label>Empleado:</label>
    <select name="id_usuario" required>
        <option value="">Selecciona empleado</option>

        <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
            <option value="<?= $row['id_usuario']; ?>">
                <?= $row['nombre']; ?>
            </option>
        <?php } ?>

    </select>

    <br><br>

    <label>Fecha:</label>
    <input type="date" name="fecha" required>
    <label for="">Horas extras</label>
    <input type="number" name="horas_extra" id="">

    <br><br>

    
    <div class="buttons">
      <button type="submit">Registrar asistencia</button>
        <button onclick="history.back()">Regresar</button>
    </div>
</div>

<script src="script/turnos.js"></script>
</body>
</html>