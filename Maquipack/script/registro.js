 const form = document.getElementById("registroForm");
    const mensaje = document.getElementById("mensaje");

    form.addEventListener("submit", function(e){
        e.preventDefault();

        const nombre = document.getElementById("nombre").value.trim();
        const correo = document.getElementById("correo").value.trim();
        const password = document.getElementById("password").value.trim();

        if(nombre === "" || correo === "" || password === ""){
            mensaje.innerHTML = "<p class='error'>Por favor completa los campos obligatorios.</p>";
            return;
        }

        if(password.length < 6){
            mensaje.innerHTML = "<p class='error'>La contraseña debe tener al menos 6 caracteres.</p>";
            return;
        }

        form.reset();
    });

    function iniciarSesion(){
        alert("Redirigiendo a inicio de sesión...");
        
    }