<?php
session_start();
require "conexion.php";

$usuario = $_POST['usuario'];
$password = $_POST['password'];

$stmt = $conexion->prepare("SELECT * FROM admin WHERE nombre_admin = :usuario");
$stmt->bindParam(':usuario', $usuario);
$stmt->execute();

$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user['password'])) {
    $_SESSION['usuario'] = $user['nombre'];
    header("Location: ../index.html");
    exit();
} else { 
    echo "<script>alert('Usuario o contraseña incorrecto')
    window.location.href='../login.html'
   </script>";
    exit();
}
?>