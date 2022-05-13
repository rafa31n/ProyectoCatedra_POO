<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 7/5/2022
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<jsp:useBean id="departamentoName" class="modelos.Departamentos"></jsp:useBean>

<html>
<head>
    <title>Casos en el departamento</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">
<c:set var="idDepartamento" value="${sessionScope['idDepartamtento']}"></c:set>
    <sql:query var="rsBuscar" dataSource="${db}">select id_caso,nombre_estado, titulo, descripcion, pdf_caso, ifnull(fecha_inicio,'no hay fecha') as fecha_inicio , ifnull(fecha_final,'no hay fecha') as
        fecha_final, fecha_creacion  from caso left join estado e on e.id_estado = caso.id_estado  where id_departamento=?
    <sql:param value="${idDepartamento}"></sql:param>
    </sql:query>
    <sql:query var="rsEstado" dataSource="${db}">select * from estado  </sql:query>
    <div class=""></div>
    <div class="container-fluid">
        <h1>Casos del departamento: ${departamentoName.selectDepartamento(idDepartamento)}  </h1>
        <%--- Buscador segun estado--%>

        <%--- Buscador segun estado--%>

        <table class="table thead-dark table-striped table-hover">

            <thead class="table-dark">
            <tr>
                <td>Id del caso</td>
                <td>tiutlo del caso</td>
                <td>descripcion del caso</td>
                <td>Estado</td>
                <td>Archivo explicatorio</td>
                <td>Fecha de inicio</td>
                <td>Fecha de final</td>
                <td>Fecha de Creacion</td>
                <td></td>
            </tr>
            </thead>
            <c:forEach items="${rsBuscar.rows}" var="row">
                <tr>
                    <td>${row.id_caso}</td>
                    <td>${row.titulo}</td>
                    <td>${row.descripcion}</td>
                    <td>${row.nombre_estado}</td>
                    <c:if test="${row.pdf_caso!=null}">
                        <td> <a class="btn btn-primary" target="_blank" href="/ServletSolicitud?operacion=mostrar&id=${row.id_caso}">Descargar</a> </td>
                    </c:if>
                    <c:if test="${row.pdf_caso==null}">
                        <td>No hay archivo</td>
                    </c:if>
                    <td>${row.fecha_inicio}</td>
                    <td>${row.fecha_final}</td>
                    <td>${row.fecha_creacion}</td>
                    <td><a href="../historial/verHistorialCaso.jsp?id=${row.id_caso}" class="btn btn-success"> Ver historial</a></td>

                </tr>
            </c:forEach>
        </table>
    </div>

</div>
</body>
</html>
