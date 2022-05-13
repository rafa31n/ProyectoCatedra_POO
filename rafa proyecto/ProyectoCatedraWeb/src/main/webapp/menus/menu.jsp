<%@ page import="modelos.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .sidebar-container {
            position: fixed;
            width: 220px;
            height: 100%;
            left: 0;
            overflow-x: hidden;
            overflow-y: auto;
            background: #2a93da;
            color: #fff;
        }

        .sidebar-logo {
            padding: 10px 15px 10px 30px;
            font-size: 20px;

        }

        .sidebar-navigation {
            padding: 0;
            margin: 0;
            list-style-type: none;
            position: relative;
        }

        .sidebar-navigation li {
            background-color: transparent;
            position: relative;
            display: inline-block;
            width: 100%;
            line-height: 20px;
        }

        .sidebar-navigation li a {
            padding: 10px 15px 10px 30px;
            display: block;
            color: #fff;
        }

        .sidebar-navigation li .fa {
            margin-right: 10px;
        }

        .sidebar-navigation li a:active,
        .sidebar-navigation li a:hover,
        .sidebar-navigation li a:focus {
            text-decoration: none;
            outline: none;
        }

        .sidebar-navigation li::before {
            background-color: #2574A9;
            position: absolute;
            content: '';
            height: 100%;
            left: 0;
            top: 0;
            -webkit-transition: width 0.2s ease-in;
            transition: width 0.2s ease-in;
            width: 3px;
            z-index: -1;
        }

        .sidebar-navigation li:hover::before {
            width: 100%;
        }

        .sidebar-navigation .header {
            font-size: 12px;
            text-transform: uppercase;

            padding: 10px 15px 10px 30px;
        }

        .sidebar-navigation .header::before {
            background-color: transparent;
        }

        .content-container {
            padding-left: 220px;
        }

        .navbar {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 0.5rem 1rem;
            margin-left: 14rem;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

<%
    Session ses = new Session();
    int cargo = ses.getId_cargo();

    String menuProgra = "<div class=\"sidebar-container\">\n" +
            "    <div class=\"sidebar-logo\">\n" +
            "        <i class=\"bi-circle-fill\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\">Telecomunicaciones</i>\n" +
            "    </div>\n" +
            "    <ul class=\"sidebar-navigation\">\n" +
            "\n" +
            "        <li>\n" +
            "            <!-- Inicio-->\n" +
            "            <a href=\"../index.jsp\">\n" +
            "                <i class=\"bi-house\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\"\n" +
            "                                                                                               aria-hidden=\"true\"></i>\n" +
            "                Inicio\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Caso-->\n" +
            "        <!-- Bitacora-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Bitacoras/Bitacoras.jsp\">\n" +
            "                <i class=\"bi-bootstrap\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Bitacoras\n" +
            "            </a>\n" +
            "        </li>\n" +
            "    </ul>\n" +
            "</div>";

    String menuAdmin = "<div class=\"sidebar-container\">\n" +
            "    <div class=\"sidebar-logo\">\n" +
            "        <i class=\"bi-circle-fill\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\">Telecomunicaciones</i>\n" +
            "    </div>\n" +
            "    <ul class=\"sidebar-navigation\">\n" +
            "\n" +
            "        <li>\n" +
            "            <!-- Inicio-->\n" +
            "            <a href=\"../index.jsp\">\n" +
            "                <i class=\"bi-house\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\"\n" +
            "                                                                                               aria-hidden=\"true\"></i>\n" +
            "                Inicio\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Caso-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../casos/casos.jsp\">\n" +
            "                <i class=\"bi-archive\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Casos\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Bitacora-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Bitacoras/Bitacoras.jsp\">\n" +
            "                <i class=\"bi-bootstrap\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Bitacoras\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Crear solicitud-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../solicitud/solicitud.jsp\">\n" +
            "                <i class=\"bi-envelope\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Solicitud\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!--Usuarios-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Usuarios/Usuarios.jsp\">\n" +
            "                <i class=\"bi bi-person\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Usuarios\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!--Programadores-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Programadores/Programadores.jsp\">\n" +
            "                <i class=\"bi bi-person-workspace\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Programadores\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!--Crear Reporte-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Reportes/reportes.jsp\">\n" +
            "                <i class=\"bi bi-file-earmark\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Ver reportes\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Departamentos-->\n" +
            "        <li>\n" +
            "            <a href=\"../Departamentos/departamentos.jsp\">\n" +
            "                <i class=\"bi bi-app-indicator\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i\n" +
            "                    class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Departamentos\n" +
            "            </a>\n" +
            "        </li>\n" +
            "       <!-- Aceptar/Denegar Solicitud-->\n" +
            "        <li>\n" +
            "            <a href=\"../AceptarDenegarCaso/aceptardenegar.jsp\">\n" +
            "                <i class=\"bi-envelope\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Aceptar/Denegar Solicitud\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Revision de Casos-->\n" +
            "        <li>\n" +
            "           \n" +
            "            <a href=\"../RevisionCasos/revisionCasos.jsp\">\n" +
            "                <i class=\"bi-archive\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Revision de Casos\n" +
            "            </a>\n" +
            "        </li>\n" +
            "    </ul>\n" +
            "</div>";

    String menuJefeArea = "<div class=\"sidebar-container\">\n" +
            "    <div class=\"sidebar-logo\">\n" +
            "        <i class=\"bi-circle-fill\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\">Telecomunicaciones</i>\n" +
            "    </div>\n" +
            "    <ul class=\"sidebar-navigation\">\n" +
            "\n" +
            "        <li>\n" +
            "            <!-- Inicio-->\n" +
            "            <a href=\"../index.jsp\">\n" +
            "                <i class=\"bi-house\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Inicio\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Caso-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../casos/casos.jsp\">\n" +
            "                <i class=\"bi-archive\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Casos\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Crear solicitud-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../solicitud/solicitud.jsp\">\n" +
            "                <i class=\"bi-envelope\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Solicitud\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!--Crear Reporte-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Reportes/reportes.jsp\">\n" +
            "                <i class=\"bi bi-file-earmark\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Ver reportes\n" +
            "            </a>\n" +
            "        </li>\n" +
            "    </ul>\n" +
            "</div>";

    String menuJefeDesarrollo = "<div class=\"sidebar-container\">\n" +
            "    <div class=\"sidebar-logo\">\n" +
            "        <i class=\"bi-circle-fill\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\">Telecomunicaciones</i>\n" +
            "    </div>\n" +
            "    <ul class=\"sidebar-navigation\">\n" +
            "\n" +
            "        <li>\n" +
            "<!-- Inicio-->\n" +
            "            <a href=\"../index.jsp\">\n" +
            "                <i class=\"bi-house\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Inicio\n" +
            "            </a>\n" +
            "        </li>\n" +
            "<!--Programadores-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Programadores/Programadores.jsp\">\n" +
            "                <i class=\"bi bi-person-workspace\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Programadores\n" +
            "            </a>\n" +
            "        </li>\n" +
            "<!--Crear Reporte-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../Reportes/reportes.jsp\">\n" +
            "                <i class=\"bi bi-file-earmark\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Ver reportes\n" +
            "            </a>\n" +
            "        </li>\n" +
            "<!-- Aceptar/Denegar Solicitud-->\n" +
            "        <li>\n" +
            "            <a href=\"../AceptarDenegarCaso/aceptardenegar.jsp\">\n" +
            "                <i class=\"bi bi-app-indicator\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Aceptar/Denegar Solicitud\n" +
            "            </a>\n" +
            "        </li>\n" +
            "    </ul>\n" +
            "</div>";

    String menuTester = "<div class=\"sidebar-container\">\n" +
            "    <div class=\"sidebar-logo\">\n" +
            "        <i class=\"bi-circle-fill\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\">Telecomunicaciones</i>\n" +
            "    </div>\n" +
            "    <ul class=\"sidebar-navigation\">\n" +
            "\n" +
            "        <li>\n" +
            "            <!-- Inicio-->\n" +
            "            <a href=\"../index.jsp\">\n" +
            "                <i class=\"bi-house\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Inicio\n" +
            "            </a>\n" +
            "        </li>\n" +
            "        <!-- Revision de Casos-->\n" +
            "        <li>\n" +
            "\n" +
            "            <a href=\"../RevisionCasos/revisionCasos.jsp\">\n" +
            "                <i class=\"bi-archive\" style=\"font-size: 1rem; color: rgb(255, 255, 255);\"></i><i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i> Revision de Casos\n" +
            "            </a>\n" +
            "        </li>\n" +
            "    </ul>\n" +
            "</div>";

    if (cargo == 1) {
        out.println(menuProgra);
    } else if (cargo == 2) {
        out.println(menuAdmin);
    } else if (cargo == 3) {
        out.println(menuJefeArea);
    } else if (cargo == 4) {
        out.println(menuJefeDesarrollo);
    } else if (cargo == 5) {
        out.println(menuTester);
    }

%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <div class="topbar-divider d-none d-sm-block"></div>
        <!-- Nav Item - User Information -->
        <div class="dropdown open">
            <button class="btn  dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false">
                <c:out value="${sessionScope['nombre']}"></c:out>
            </button>
            <div class="dropdown-menu" aria-labelledby="triggerId">
                <a class="dropdown-item" href="../perfil.jsp">Ver Perfil</a>
                <a class="dropdown-item " href="../cerrarSession.jsp">Salir</a>
            </div>
        </div>
    </ul>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/popper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
