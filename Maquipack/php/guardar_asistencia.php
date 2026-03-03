<?php
require("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_usuario = $_POST['id_usuario'];
    $fecha = $_POST['fecha'];
    $horas_extra=$_POST['horas_extra'];

    try {

       
        $validar = "SELECT COUNT(*) FROM asistencia 
                    WHERE id_usuario = :id_usuario 
                    AND fecha = :fecha AND horas_extra = :horas_extra";

        $stmtValidar = $conexion->prepare($validar);
        $stmtValidar->bindParam(':id_usuario', $id_usuario);
        $stmtValidar->bindParam(':fecha', $fecha);
         $stmtValidar->bindParam(':horas_extra', $horas_extra);
        $stmtValidar->execute();

        if ($stmtValidar->fetchColumn() > 0) {
            echo " Este empleado ya tiene asistencia registrada en esa fecha.";
            exit();
        }

        $sql = "INSERT INTO asistencia (id_usuario, fecha, horas_extra)
                VALUES (:id_usuario, :fecha, :horas_extra)";

        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':id_usuario', $id_usuario);
        $stmt->bindParam(':fecha', $fecha);
        $stmt->bindParam(':horas_extra', $horas_extra);
        $stmt->execute();

        echo " Asistencia registrada correctamente";

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>