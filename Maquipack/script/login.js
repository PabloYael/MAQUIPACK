document.getElementById("loginForm").addEventListener("submit", function(e){
    e.preventDefault();

    const usuario = document.getElementById("usuario").value;
    const password = document.getElementById("password").value;
    const mensaje = document.getElementById("mensaje");

    if(usuario === "" || password === ""){
        mensaje.innerHTML = "<p style='color:red;'>Completa todos los campos</p>";
        return;
    }

    mensaje.innerHTML = "<p style='color:green;'>Acceso correcto ✔</p>";
});