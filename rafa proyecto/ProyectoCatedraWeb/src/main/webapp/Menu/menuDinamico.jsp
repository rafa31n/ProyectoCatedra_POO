<%@ page import="modelos.Session" %><%--
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<!-- menu-->
<div class="sidebar-container">
    <div class="sidebar-logo">
        <i class="bi-circle-fill" style="font-size: 1rem; color: rgb(255, 255, 255);"></i>  Project Name
    </div>
    <ul class="sidebar-navigation">
<%
    Integer cargo=Session.getId_cargo();
    switch (cargo){
        //programador
        case 1:
            %>
        <!-- Bitacora-->
        <li>

            <a href="#">
                <i class="bi-bootstrap" style="font-size: 1rem; color: rgb(255, 255, 255);"></i><i class="fa fa-tachometer" aria-hidden="true"></i> Bitacoras
            </a>
        </li>
        <%
            break;
        //admin
        case 2:
            %>
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
        <%
            break;
    }
%>



    </ul>
</div>


</body>
</html>
