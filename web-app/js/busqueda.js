var x = $(document);
x.ready(iniciar);

function iniciar() {
    $('#busqueda').bind("keyup input paste", function () {
        actualizar();
    });
}

function actualizar() {
    $("#list-activo").load("buscarActivo/" + $('#busqueda').val() + " #list-activo");
//    alert("[" + $('#busqueda').val() + "]")
}

////setInterval(actualizar, 3000);
