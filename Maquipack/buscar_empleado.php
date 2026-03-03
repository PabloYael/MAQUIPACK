<?php
require("php/conexion.php");

//metodo eliminar
if(isset($_POST['eliminar'])){
    $id = $_POST['eliminar'];

    $sql = "DELETE FROM usuario WHERE id_usuario = :id";
    $stmt = $conexion->prepare($sql);
    $stmt->execute(['id' => $id]);

    echo "<p style='color:red;'>Empleado eliminado correctamente</p>";
}
//metodo buscar
$buscar = "";

if(isset($_POST['buscar'])){
    $buscar = $_POST['buscar'];

    $sql = "SELECT u.*, e.nombre_empresa
            FROM usuario u
            LEFT JOIN empresa e ON u.id_empresa = e.id_empresa
            WHERE u.nombre ILIKE :buscar
            ORDER BY u.nombre";

    $stmt = $conexion->prepare($sql);
    $stmt->execute(['buscar' => "%$buscar%"]);
} else {
    $sql = "SELECT u.*, e.nombre_empresa
            FROM usuario u
            LEFT JOIN empresa e ON u.id_empresa = e.id_empresa
            ORDER BY u.nombre";

    $stmt = $conexion->query($sql);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Usuario</title>
     <link rel="stylesheet" href="estilos/turnos.css">
     <link rel="icon" href="img/logopack2.png" type="jpg">
</head>
<style>
    form input{
    padding:10px;
    border:none;
    border-radius:8px;
}
th, td{
    color:white;
}

</style>
<body>
<div class="container">
<h1>Buscar empleado para eliminar</h1>

<form method="post">
    <input id="buscar" type="text" name="buscar" 
           placeholder="Escribe nombre del empleado"
           value="<?= htmlspecialchars($buscar); ?>">
    <button type="submit">Buscar</button>
</form>

<br><br>

<table border="1" width="100%" cellpadding="5">
<tr>
    <th>ID</th>
    <th>Nombre</th>
    <th>Puesto</th>
    <th>Empresa</th>
    <th>Acción</th>
</tr>

<?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
<tr>
    <td><?= $row['id_usuario']; ?></td>
    <td><?= $row['nombre'] . " " . $row['ap_paterno']; ?></td>
    <td><?= $row['puesto']; ?></td>
    <td><?= $row['nombre_empresa']; ?></td>
    <td>
      <button href="?eliminar=<?= $row['id_usuario']; ?>"
           onclick="return confirm('Confirmar eliminación')">
           Eliminar
        </button>
    </td>
</tr>
<?php } ?>
<button onclick="history.back()">Regresar</button>

</table>
</div>
</body>
</html>