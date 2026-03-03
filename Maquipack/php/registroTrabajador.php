<?php
require("conexion.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre=$_POST['nombre'];
    $ap_paterno=$_POST['ap_paterno'];
    $ap_materno=$_POST['ap_materno'];
    $puesto=$_POST['puesto'];
    $colonia=$_POST['colonia'];
    $calle=$_POST['calle'];
    $codigo_postal=$_POST['codigo_postal'];
    $telefono=$_POST['telefono'];
    $id_pago=$_POST['id_pago'];
    $id_empresa=$_POST['id_empresa'];
    $numero_cuenta = isset($_POST['numero_cuenta']) ? $_POST['numero_cuenta'] : null;


    try {
        $sql = "INSERT INTO usuario (nombre, ap_paterno, ap_materno, puesto, colonia, calle, codigo_postal, telefono, id_pago, id_empresa, numero_cuenta) 
                VALUES (:nombre, :ap_paterno, :ap_materno, :puesto, :colonia, :calle, :codigo_postal, :telefono, :id_pago, :id_empresa, :numero_cuenta)";

        $stmt = $conexion->prepare($sql);

        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':ap_paterno', $ap_paterno);
        $stmt->bindParam(':ap_materno', $ap_materno);
        $stmt->bindParam(':puesto', $puesto);
        $stmt->bindParam(':colonia', $colonia);
        $stmt->bindParam(':calle', $calle);
        $stmt->bindParam(':codigo_postal', $codigo_postal);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':id_pago', $id_pago);
        $stmt->bindParam(':id_empresa', $id_empresa);
         $stmt->bindParam(':numero_cuenta', $numero_cuenta);
        
        
        

        $stmt->execute();

        echo "<script>alert('Usuario Registrado correctamente')
        window.location.href='../registro_trabajador.php'</script>";
    } catch (PDOException $e) {
        echo "Error al registrar: " . $e->getMessage();
    }
}
?>