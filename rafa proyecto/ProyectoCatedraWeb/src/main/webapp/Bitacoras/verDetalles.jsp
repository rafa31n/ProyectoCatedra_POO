<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/5/2022
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select id_caso,titulo,descripcion,nombre_estado,fecha_creacion,pdf_caso from caso
    left join estado e on e.id_estado = caso.id_estado where id_caso=?
    <sql:param value="${param.id}"></sql:param>
</sql:query>
<html>
<head>
    <title>Ver detalles del Caso</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

<div class="content-container">
    <div class="container">
        <c:forEach items="${rs.rows}" var="row">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">

                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Información: ${row.id_caso}</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Nombre</h6>
                                                <p class="text-muted">${row.titulo}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Descripcion</h6>
                                                <p class="text-muted">${row.descripcion}</p>
                                            </div>
                                        </div>
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Estado</h6>
                                                <p class="text-muted">${row.nombre_estado}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Fecha de creacion</h6>
                                                <p class="text-muted">${row.fecha_creacion}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Archivo Explicativo</h6>
                                                <c:choose>
                                                    <c:when test="${row.pdf_caso==null}">
                                                        <p class="text-muted">No hay archivo explicativo</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="btn btn-primary" target="_blank" href="/ServletSolicitud?operacion=mostrar&id=${row.id_caso}">Descargar</a> </td>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
