
<?php

require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre=$_POST['nombre'];
    $colonia=$_POST['colonia'];
    $calle=$_POST['calle'];
    $c_p=$_POST['c_p'];
    $nombre_encargado=$_POST['nombre_encargado'];
    $telefono_encargado=$_POST['telefono_encargado'];
    $pago_turno=$_POST['pago_turno'];
    $hora_extra=$_POST['hora_extra'];
    $id_transporte=$_POST['id_transporte'];
    $id_turno=$_POST['id_turno'];
   
    try {
        $sql = "INSERT INTO empresa (nombre_empresa, colonia, calle, c_p, nombre_encargado, telefono_encargado,pago_turno, hora_extra, id_turno, id_transporte) 
                VALUES (:nombre_empresa, :colonia, :calle, :c_p, :nombre_encargado, :telefono_encargado, :pago_turno, :hora_extra, :id_turno, :id_transporte)";

        $stmt = $conexion->prepare($sql);

        $stmt->bindParam(':nombre_empresa', $nombre);
        $stmt->bindParam(':colonia', $colonia);
        $stmt->bindParam(':calle', $calle);
        $stmt->bindParam(':c_p', $c_p);
        $stmt->bindParam(':nombre_encargado', $nombre_encargado);
        $stmt->bindParam(':telefono_encargado', $telefono_encargado);
        $stmt->bindParam(':pago_turno', $pago_turno);
        $stmt->bindParam(':hora_extra', $hora_extra);
        $stmt->bindParam(':id_transporte', $id_transporte);
        $stmt->bindParam(':id_turno', $id_turno);
        
        
        
        

        $stmt->execute();

        echo "<script>alert('Empresa Registrada correctamente')
        window.location.href='../registro_empresa.php'</script>";
    } catch (PDOException $e) {
        echo "Error al registrar: " . $e->getMessage();
    }
}

?>
