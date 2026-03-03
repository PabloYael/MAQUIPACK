<?php
require("php/conexion.php");

require 'vendor/autoload.php';

use Dompdf\Dompdf;

$sql = "SELECT 
            u.nombre,
            e.nombre_empresa,
            COUNT(a.id_asistencia) AS turnos,
            COALESCE(SUM(a.horas_extra),0) AS horas_extra,
            (COUNT(a.id_asistencia) * e.pago_turno) +
            (COALESCE(SUM(a.horas_extra),0) * e.hora_extra)
            AS sueldo_total
        FROM usuario u
        JOIN empresa e ON u.id_empresa = e.id_empresa
        LEFT JOIN asistencia a ON u.id_usuario = a.id_usuario
        GROUP BY u.nombre, e.nombre_empresa, e.pago_turno, e.hora_extra
        ORDER BY e.nombre_empresa";

$stmt = $conexion->query($sql);


if(isset($_GET['pdf'])){

    ob_start();
?>
<h2>Reporte de Sueldos</h2>

<table border="1" width="100%" cellspacing="0" cellpadding="5">
<tr>
    <th>Empleado</th>
    <th>Empresa</th>
    <th>Turnos</th>
    <th>Horas Extra</th>
    <th>Sueldo Total</th>
</tr>

<?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
<tr>
    <td><?= $row['nombre']; ?></td>
    <td><?= $row['nombre_empresa']; ?></td>
    <td><?= $row['turnos']; ?></td>
    <td><?= $row['horas_extra']; ?></td>
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
    $dompdf->stream("reporte_sueldos.pdf", ["Attachment" => true]);

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
</head>
<body>

<div class="container">
    <h1>Reporte semanal</h1>

    <div class="table-container">
        <table>
           <tr>
    <th>Empleado</th>
    <th>Empresa</th>
    <th>Turnos</th>
    <th>Horas Extra</th>
    <th>Sueldo Total</th>
</tr>

<?php
$stmt = $conexion->query($sql); 
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
?>
<tr>
    <td><?= $row['nombre']; ?></td>
    <td><?= $row['nombre_empresa']; ?></td>
    <td><?= $row['turnos']; ?></td>
    <td><?= $row['horas_extra']; ?></td>
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