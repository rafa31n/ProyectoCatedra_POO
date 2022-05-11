<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 6/5/2022
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select * from estado</sql:query>

<html>
<head>
    <title>Reportes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">
    <form action="/ServletReportes" method="post">
        <label>Imprimir Reporte</label>
        <input type="date" name="fechaCreado" id="fechaCreado" required >
        <input type="submit" name="operacion" class="btn btn-success" value="Generar">
    </form>
    <form  method="post">
        <input type="date" name="fechaCreado" id="fechaCreado2" hidden>
        <input type="submit" name="operacion" id="buscar" class="btn btn-success" value="Buscar">
    </form>
    <c:if test="${param.operacion!=null}">
        <table class="table table-striped">
            <thead class="table-dark">
            <tr>
                <td>Id Caso</td>
                <td>Titulo</td>
                <td>Descripcion</td>
                <td>Estado Actual</td>
                <td>Fecha creación</td>
                <td></td>
            </tr>
            </thead>
            <sql:query var="rsBuscar" dataSource="${db}">select id_caso,titulo,descripcion,nombre_estado,fecha_creacion from caso left join estado e on e.id_estado = caso.id_estado where fecha_creacion=? and id_departamento=?
                <sql:param value="${param.fechaCreado}"></sql:param>
                <sql:param value="${sessionScope['idDepartamtento']}"></sql:param>
            </sql:query>
            <c:forEach var="row" items="${rsBuscar.rows}" varStatus="status">
                <tr>
                    <c:if test="${not empty row.id_caso}">
                        <td>${row.id_caso}</td>
                        <td>${row.titulo}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.nombre_estado}</td>
                        <td>${row.fecha_creacion}</td>
                        <td><a href="../Bitacoras/VerBitacoras.jsp?id=${row.id_caso}" class="btn btn-success">Ver bitacoras</a> </td>
                    </c:if>


                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<script src="js/ajax.js"></script>


</body>
</html>
