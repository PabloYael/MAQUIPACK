<?php
require("php/conexion.php");

require 'vendor/autoload.php';

use Dompdf\Dompdf;

$sql = "SELECT 
            nombre,
            origen,
            destino,
            camioneta,
            numero_cuenta,
            (salario * viajes_realizados) AS sueldo_total
        FROM transporte 
        GROUP BY nombre, origen, destino, camioneta, numero_cuenta, salario, viajes_realizados";

$stmt = $conexion->query($sql);


if(isset($_GET['pdf'])){

    ob_start();
?>
<h2>Reporte de Sueldos de transporte </h2>

<table border="1" width="100%" cellspacing="0" cellpadding="5">
<tr>
    <th>Nombre del chofer</th>
    <th>Origen</th>
    <th>Destino</th>
    <th>Camioneta</th>
    <th>Numero de Cuenta</th>
    <th>Sueldo Total</th>
</tr>

<?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
<tr>
    <td><?= $row['nombre']; ?></td>
    <td><?= $row['origen']; ?></td>
    <td><?= $row['destino']; ?></td>
    <td><?= $row['camioneta']; ?></td>
    <td><?= $row['numero_cuenta']; ?></td>
    <td>$<?= number_format($row['sueldo_total'],2); ?></td>
</tr>
<?php } ?>

</table>

<?php
    $html = ob_get_clean();

    $dompdf = new Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', 'portrait');
    $dompdf->render();
    $dompdf->stream("reporte_sueldosTransporte.pdf", ["Attachment" => true]);

    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte semanal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos/turnos.css">
     <link rel="icon" href="img/logopack2.png" type="jpg">
</head>
<body>

<div class="container">
    <h1>Reporte semanal</h1>

    <div class="table-container">
        <table>
           <tr>
    <th>Nombre del Chofer</th>
    <th>Origen</th>
    <th>Destino</th>
    <th>Camioneta</th>
    <th>Número de Cuenta</th>
    <th>Sueldo Total</th>
</tr>

<?php
$stmt = $conexion->query($sql); 
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
?>
<tr>
    <td><?= $row['nombre']; ?></td>
    <td><?= $row['origen']; ?></td>
    <td><?= $row['destino']; ?></td>
    <td><?= $row['camioneta']; ?></td>
     <td><?= $row['numero_cuenta']; ?></td>
    <td>$<?= number_format($row['sueldo_total'],2); ?></td>
</tr>
<?php } ?>

</table>
    </div>
<a href="?pdf=1">
    <button>Descargar PDF</button>
</a>
    <div class="buttons">
    <button onclick="history.back()">Regresar</button> 
  </div>
</div>

<script src="script/turnos.js"></script>
</body>
</html>