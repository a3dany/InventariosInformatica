var x = $(document);
x.ready(iniciar);

function iniciar() {
    $("#control1").fadeOut(0);
    $("#control2").fadeOut(0);
    $("#control3").fadeOut(0);
    $("#controlCompra1").fadeOut(0);
    $("#controlCompra2").fadeOut(0);
    $("#controlCompra3").fadeOut(0);
    $("#controlCompra4").fadeOut(0);
    $("#controlCompra5").fadeOut(0);


    $("#selector1").click(actualizar1);
    $("#selector2").click(actualizar2);
    $("#selector3").click(actualizar3);
    $("#controlEsComprado").click(actualizarCompra);
}

function actualizar1() {
    if ($("#control1").is(":visible")) {
        $("#control1").fadeOut("slow");
    } else {
        $("#control1").fadeIn("slow");
    }
}
function actualizar2() {
    if ($("#control2").is(":visible")) {
        $("#control2").fadeOut("slow");
    } else {
        $("#control2").fadeIn("slow");
    }
}
function actualizar3() {
    if ($("#control3").is(":visible")) {
        $("#control3").fadeOut("slow");
    } else {
        $("#control3").fadeIn("slow");
    }
}

function actualizarCompra() {
    if ($("#controlCompra1").is(":visible")) {
        $("#controlCompra1").fadeOut("slow");
        $("#controlCompra2").fadeOut("slow");
        $("#controlCompra3").fadeOut("slow");
        $("#controlCompra4").fadeOut("slow");
        $("#controlCompra5").fadeOut("slow");
    } else {
        $("#controlCompra1").fadeIn("slow");
        $("#controlCompra2").fadeIn("slow");
        $("#controlCompra3").fadeIn("slow");
        $("#controlCompra4").fadeIn("slow");
        $("#controlCompra5").fadeIn("slow");
    }
}
