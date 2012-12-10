<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Hola</title>
    <style type="text/css">

    @page {
        size: 216mm 279mm;
        /*margin-left: 3cm;*/
        /*margin-right: 4cm;*/
    }

    h1, h2, h3, h4, h5, h6 {

    }

    body {
    }

    table {
        border: 1px solid #383838;
        width: 100%;
    }

    thead>tr>th {
        font-weight: bold;
    }

        /* FILA */
    td {

    }

    th {
        border: 1px solid #383838;
        text-align: left;
        vertical-align: top;
        padding: 0.25em 0.25em;
        font-weight: normal;

    }

    </style>
</head>
<body>
<h1>${titulo}</h1>

<p>${descripcion}</p>

<table>
    <thead>
    <tr>
        <th>Anterior</th>
        <th>Actual</th>
        <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${cambioEstadoInstanceList}" var="cambio">
        <tr>
            <th>${cambio.anterior}</th>
            <th>${cambio.actual}</th>
            <th>${cambio.descripcion}</th>
        </tr>
    </g:each>
    </tbody>
</table>

</body>
</html>