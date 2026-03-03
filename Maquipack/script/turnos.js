function guardarDatos() {
    const horas = document.querySelector("input").value;

    const datos = {
        id: 1,
        nombre: "Juan Pérez",
        turnos: 5,
        monto: 2500,
        horasExtras: horas,
        metodo: "Transferencia",
        cuenta: "12345678"
    };

    localStorage.setItem("reporte", JSON.stringify(datos));
    alert("Datos guardados correctamente");
}

window.onload = function() {
    const tabla = document.getElementById("tablaReporte");
    const datos = JSON.parse(localStorage.getItem("reporte"));

    if(tabla && datos){
        tabla.innerHTML = `
            <tr>
                <td>${datos.id}</td>
                <td>${datos.nombre}</td>
                <td>${datos.turnos}</td>
                <td>$${datos.monto}</td>
                <td>${datos.horasExtras}</td>
                <td>${datos.metodo}</td>
                <td>${datos.cuenta}</td>
            </tr>
        `;
    }
};