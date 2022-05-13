<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>casos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="content-container">
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/telecomunicacion2"
                       user="root"  password=""/>
    <c:catch var="error01">
        <sql:query var="q1" dataSource="${db}">
            SELECT * FROM caso WHERE id_estado = 4 AND id_departamento = 1
        </sql:query>
    </c:catch>
    <c:if test="${not empty error01}">
        <div class="alert alert-danger">
            <strong>Se produjo un error:</strong> ${error01}
            <br>
        </div>
    </c:if>
    <article class="text-center"> <h1>Aceptar / denegar casos</h1></article>
    <div class="contenedor">
        <table class="table">
            <thead>
            <tr>
                <th>ID caso</th>
                <th>Titulo</th>
                <th>Descripcion</th>
                <th>Documento explicativo</th>
                <th>Fecha de creación</th>
                <th class="text-center" colspan="2">Opciones</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty q1.rows}">
                    <tr><td>No hay solicitudes</td></tr>
                </c:when>
                <c:otherwise>
            <c:forEach var="caso" items="${q1.rows}">



            <tr>
                <td>${caso.id_caso}</td>
                <td>${caso.titulo}</td>
                <td>${caso.descripcion}</td>
                <c:if test="${caso.pdf_caso!=null}">
                    <td> <a class="btn btn-primary" target="_blank" href="/ServletSolicitud?operacion=mostrar&id=${row.id_caso}">Descargar</a> </td>
                </c:if>
                <c:if test="${caso.pdf_caso==null}">
                    <td>No hay archivo</td>
                </c:if>
                <td>${caso.fecha_creacion}</td>
                <td>
                    <a href="Aceptar.jsp?id=${caso.id_caso}" class="btn btn-success">Aceptar caso</a>
                </td>
                <td>
                    <a href="Denegar.jsp?id=${caso.id_caso}" class="btn btn-danger">Denegar caso</a>
                </td>
            </tr>
            </tbody>

            </c:forEach>
                </c:otherwise>
            </c:choose>

        </table>
    </div>
    <c:if test="${not empty param.mensaje}">
        <div class="alert alert-success">
            <strong>Correcto! </strong><c:out value="${param.mensaje}"/>
            <br>
        </div>
    </c:if>
</div>

</body>
</html>
