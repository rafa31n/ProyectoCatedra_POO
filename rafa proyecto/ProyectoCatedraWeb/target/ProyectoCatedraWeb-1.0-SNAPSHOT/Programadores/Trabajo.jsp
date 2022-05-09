<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:query var="rs" dataSource="${db}">
    select pc.id_programador_caso, pc.id_caso, c.titulo, e.nombre_estado, c.fecha_creacion from programador_caso pc inner join caso c on c.id_caso = pc.id_caso inner join estado e on e.id_estado = c.id_estado where id_usuario = ${param.id}
</sql:query>
<div class="content-container">
    <div class="contenido">
        <h1 class="text-center">Trabajos del programador: ${param.nombre}</h1><br>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Id Trabajo</th>
                <th>Id Caso</th>
                <th>Titulo</th>
                <th>Estado</th>
                <th>Fecha creación</th>
            </tr>
            </thead>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.id_programador_caso}"></c:out></td>
                    <td><c:out value="${row.id_caso}"></c:out></td>
                    <td><c:out value="${row.titulo}"></c:out></td>
                    <td><c:out value="${row.nombre_estado}"></c:out></td>
                    <td><c:out value="${row.fecha_creacion}"></c:out></td>
                </tr>
            </c:forEach>
            <c:if test="${empty rs.rows}">
                <tr>
                    <td>Este programador no tiene trabajos asignados.</td>
                </tr>
            </c:if>
        </table>
        <a href="Programadores.jsp">
            <button class="btn btn-dark">Regresar</button>
        </a>
    </div>
</div>
<style>
    .contenido {
        width: 70%;
        margin: 0 auto;
    }
</style>
</body>
</html>
