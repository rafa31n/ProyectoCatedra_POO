<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 15/4/2022
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
<!-- menu-->
<div class="sidebar-container">
    <div class="sidebar-logo">
        <i class="bi-circle-fill" style="font-size: 1rem; color: rgb(255, 255, 255);"></i>  Project Name
    </div>
    <ul class="sidebar-navigation">

        <li>
            <!-- Inicio-->
            <a href="#">
                <i class="bi-house" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Inicio
            </a>
        </li>
        <!-- Caso-->
        <li>

            <a href="#">
                <i class="bi-archive" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Casos
            </a>
        </li>
        <!-- Bitacora-->
        <li>

            <a href="../Bitacoras/Bitacoras.jsp">
                <i class="bi-bootstrap" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Bitacoras
            </a>
        </li>
        <!-- Crear solicitud-->
        <li>

            <a href="#">
                <i class="bi-envelope" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Solicitud
            </a>
        </li>
        <!--Usuarios-->
        <li>

            <a href="#">
                <i class="bi bi-person" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Usuarios
            </a>
        </li>
        <!--Programadores-->
        <li>

            <a href="#">
                <i class="bi bi-person-workspace" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Programadores
            </a>
        </li>
        <!--Crear Reporte-->
        <li>

            <a href="#">
                <i class="bi bi-file-earmark" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Ver reportes
            </a>
        </li>
        <!-- departamentos-->
        <li>
            <a href="#">
                <i class="bi bi-app-indicator" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Departamentos
            </a>
        </li>
    </ul>
</div>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" >


    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">



        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <div class="dropdown open">
            <button class="btn  dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                Dropdown
            </button>
            <div class="dropdown-menu" aria-labelledby="triggerId">
                <a class="dropdown-item" href="#">Ver Perfil</a>
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
