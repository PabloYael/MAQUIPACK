
<?php

require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $origen=$_POST['origen'];
    $destino=$_POST['destino'];
    $nombre=$_POST['nombre'];
    $camioneta=$_POST['camioneta'];
    $salario=$_POST['salario'];
    $viajes=$_POST['viajes'];
    $telefono=$_POST['telefono'];
     $id_pago=$_POST['id_pago'];
  
    $numero_cuenta = isset($_POST['numero_cuenta']) ? $_POST['numero_cuenta'] : null;
   
    try {
        $sql = "INSERT INTO transporte (origen, destino, nombre, camioneta, salario, viajes_realizados, telefono, id_pago, numero_cuenta) 
                VALUES (:origen, :destino, :nombre, :camioneta, :salario, :viajes, :telefono, :id_pago, :numero_cuenta)";

        $stmt = $conexion->prepare($sql);

        $stmt->bindParam(':origen', $origen);
        $stmt->bindParam(':destino', $destino);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':camioneta', $camioneta);
        $stmt->bindParam(':salario', $salario);
        $stmt->bindParam(':viajes', $viajes);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':id_pago', $id_pago);
        $stmt->bindParam(':numero_cuenta', $numero_cuenta);
        
        
        

        $stmt->execute();

        echo "<script>alert('Transporte Registrado correctamente')
        window.location.href='../registro_transporte.html'</script>";
    } catch (PDOException $e) {
        echo "Error al registrar: " . $e->getMessage();
    }
}

?>
