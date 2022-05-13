<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 11/5/2022
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Tester</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">
  <div class="contenido">
    <sql:query var="rs" dataSource="${db}">
      SELECT c.id_caso,c.titulo,c.id_estado,e.nombre_estado FROM caso c INNER JOIN estado e ON c.id_estado = e.id_estado WHERE c.id_caso = ?
      <sql:param value="${param.id}"></sql:param>
    </sql:query>
    <h1 class="text-center titulo">Revisión de caso</h1>

    <form method="post">
      <c:forEach items="${rs.rows}" var="row">
      <div class="form-group">
        <label class="form-label">ID del caso</label>
        <input type="text" class="form-control" name="txtIDCaso" id="txtIDCaso" placeholder="" value="<c:out value="${row.id_caso}"></c:out>" disabled>
      </div>

        <div class="form-group">
          <label class="form-label">Título del caso</label>
          <input type="text" class="form-control" name="txtIDCaso" id="txtTitulo" placeholder="" value="<c:out value="${row.titulo}"></c:out>" disabled>
        </div>
        <a class="btn btn-primary" href="../Bitacoras/VerBitacoras.jsp?id=${row.id_caso}">Ver Bitacoras</a>
        <a class="btn btn-primary" target="_blank" href="../observaciones?id=${row.id_caso}">Ver Observaciones</a> </td>
        <a name="" target="_blank" id="" class="btn btn-primary" href="../Bitacoras/verDetalles.jsp?id=${row.id_caso}" role="button">Ver más detalles</a>

        <div class="form-group">
        <label class="form-label">Estado del caso</label>
        <a id="<c:out value="${row.id_caso}"></c:out>" class="btn btn-outline-primary" href="casoAprobado.jsp?id=<c:out value="${row.id_caso}"></c:out>" role="button"><i class="bi bi-check-lg"> Aprobar</i></a>
        <a id="<c:out value="${row.id_caso}"></c:out>" class="btn btn-outline-primary" href="casoRechazado.jsp?id=<c:out value="${row.id_caso}"></c:out>" role="button"><i class="bi bi-exclamation-diamond"> Rechazar</i></a>

        </div>
        <a class="btn btn-primary" href="revisionCasos.jsp">Regresar</a>
      </div>

      </c:forEach>
    </form>

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
