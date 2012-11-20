<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <style type='text/css' media='screen'>
    #login {
        border: .2em solid #fff;
        padding: 2em;
        padding-bottom: 0em;
        padding-left: 0em;
        padding-right: 0em;
        margin: 1em;
        text-align: center;
        background-image: url("${resource(dir: 'images', file: 'laboratorio_informatica.png')}");

        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    #login .inner {
        width: 250px;
        padding-bottom: 6px;
        margin: 10px auto;
        text-align: left;
        border: 1px solid #ECECEC;
        /*        background-color: #ECECEC;*/
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #login .inner .fheader {
        padding: 10px 10px 10px 10px;
        /*background-color: #ECECEC;*/
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;

    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 50px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type='text'] {
        width: 120px;
    }

    #login .inner .cssform label {

        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 50px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 50px
    }

    .login_message {
        padding-bottom: 0.5em;
        color: #FF4444;
    }

    .text_ {
        width: 120px;
        margin-left: 0.5em;
        margin-right: 0.5em;
    }

    #login .inner .chk {
        height: 12px;
    }

    #textoprincipal {

        font-family: "roboto-light";
        font-size: 1.5em;
        padding: 1em;
        text-align: center;
    }

    #contenido {
        margin: 1em;
        margin-top: 1.5em;
        text-align: center;
    }

    .caja {
        margin-top: 15em;
        padding: 1em;
        background-color: #383838;
        color: #ECECEC;
        -moz-border-radius: 0.4em;
        -webkit-border-radius: 0.4em;
        border-radius: 0.4em;
        font-family: roboto-light;
        font-size: 1.25em;
    }

    input[type='submit'] {
        color: #383838;
        background-color: #ECECEC;
        -moz-border-radius: 0.3em;
        -webkit-border-radius: 0.3em;
        border-radius: 0.3em;
        margin-right: 1em;
        padding-right: 1em;
        padding-left: 1em;
    }

    input[type='submit']:hover {
        background-color: #C6C6C6;
    }

    input[type='submit']:active {
        background-color: #C6C6C6;
    }

     #pie {
         font-size: 0.7em;
     }

    </style>
</head>

<body>

<div id="contenido">
    <span id="textoprincipal">Gestión de activos fijos, moderno y móvil.</span>
    <br/>

    <div id='login'>
        <div class='caja'>

            <g:if test='${flash.message}'>
                <div class='login_message'>${flash.message}</div>
            </g:if>

            <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>

                <label for='username'><g:message code="springSecurity.login.username.label"/></label>
                <input type='text' class='text_' name='j_username' id='username'/>

                <label for='password'><g:message code="springSecurity.login.password.label"/></label>
                <input type='password' class='text_' name='j_password' id='password'/>

                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>


                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>

            </form>
        </div>
    </div>
    Ingrese al sistema con su cuenta personal, si no tiene una contactese con el responsable de sistemas.
    <br/><br/><br/>
    <span id="pie">Desarrollo del sistema web y aplicación movíl por <a href="http://about.me/danyalvarez">Daniel Alvarez</a>.</span>

</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
