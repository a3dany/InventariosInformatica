var x = $(document);
x.ready(iniciar);

function iniciar() {
    actualizar();
}

function actualizar() {
    $("#list-prestamo").load("list #list-prestamo");
}

setInterval(actualizar, 3000);

