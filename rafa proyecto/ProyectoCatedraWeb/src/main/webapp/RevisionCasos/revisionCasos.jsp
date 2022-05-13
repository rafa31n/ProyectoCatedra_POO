<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<jsp:include page="../menus/menu.jsp"></jsp:include>

<sql:query var="rs" dataSource="${db}">SELECT c.id_caso,c.titulo,c.id_estado,e.nombre_estado FROM caso c INNER JOIN estado e ON c.id_estado = e.id_estado INNER JOIN probador_caso p ON p.id_caso = c.id_caso WHERE c.id_estado = 6 AND p.id_usuario= ?
<sql:param value="${sessionScope['idusuario']}"></sql:param>
</sql:query>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Revisión de casos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">

    <div class="container">
        <h1>Revisión de casos</h1>

        <div class="table-responsive">

            <table class="table table-hover table-sm caption-top" style="margin: 10px auto">
                <caption>Casos esperando respuesta de área solicitante</caption>
                <thead class="thead-dark">
                <tr>
                    <th scope="col"> Id del caso</th>
                    <th scope="col">Título del caso</th>
                    <th scope="col">Id_estado del caso</th>
                    <th scope="col">Estado del caso</th>
                    <th scope="col" colspan="1">Acción</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rs.rows}" var="row">
                    <tr>
                        <td><c:out value="${row.id_caso}"></c:out></td>
                        <td><c:out value="${row.titulo}"></c:out></td>
                        <td><c:out value="${row.id_estado}"></c:out></td>
                        <td><c:out value="${row.nombre_estado}"></c:out></td>
                        <td>
                                <a href="revisionTester.jsp?id=${row.id_caso}">
                                <button class="btn btn-outline-primary">Revisar</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>


</body>
</html>
