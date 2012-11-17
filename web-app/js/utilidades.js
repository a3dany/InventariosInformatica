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


    $("input[name=perteneceActivo]").click(actualizar1);

    $("input[name=esAsignadoAmbiente]").click(actualizar2);

  //  $("input[name=perteneceActivo]").click(actualizar1);
  //  $("#selector3").click(actualizar3);


    $("input[name=esComprado]").click(actualizarCompra);
}

function actualizar1() {
    if ($("input[name=perteneceActivo]").is(":checked")) {
        $("#control1").fadeIn("slow");
    } else {
        $("#control1").fadeOut("slow");
    }
}
function actualizar2() {
    if ($("input[name=esAsignadoAmbiente]").is(":checked")) {
        $("#control2").fadeIn("slow");
    } else {
        $("#control2").fadeOut("slow");
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
    if ($("input[name=esComprado]").is(":checked")) {
        $("#controlCompra1").fadeIn("slow");
        $("#controlCompra2").fadeIn("slow");
        $("#controlCompra3").fadeIn("slow");
        $("#controlCompra4").fadeIn("slow");
        $("#controlCompra5").fadeIn("slow");
    } else {
        $("#controlCompra1").fadeOut("slow");
        $("#controlCompra2").fadeOut("slow");
        $("#controlCompra3").fadeOut("slow");
        $("#controlCompra4").fadeOut("slow");
        $("#controlCompra5").fadeOut("slow");
    }
}
