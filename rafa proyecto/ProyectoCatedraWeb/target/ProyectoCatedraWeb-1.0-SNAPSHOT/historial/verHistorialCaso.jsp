<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 11/5/2022
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<html>
<head>
    <title>Ver historial del caso</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<sql:query var="rs" dataSource="${db}">select * from historial_caso where id_caso=?
<sql:param value="${param.id}"></sql:param>
</sql:query>
<body>
<div class="content-container">
    <h2>Historial del caso ${param.id}</h2>
    <table class="table thead-dark table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <td>Id del caso</td>
            <td>descripcion de acciones</td>
            <td>Fecha y hora</td>


        </tr>
        </thead>
        <c:forEach items="${rs.rows}" var="row">
            <tr>
                <td>${row.id_caso}</td>
                <td>${row.descripcion_historial}</td>
                <td>${row.Fecha_Hora_historial}</td>
            </tr>
        </c:forEach>

    </table>

</div>
</body>
</html>
