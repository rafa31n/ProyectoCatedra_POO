<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 7/5/2022
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Crear nueva solicitud</title>

</head>
<body>
<div class="content-container">

    <div class="container">

        <h1>Crear una solicitud de caso</h1>
        <form action="/ServletSolicitud" method="post" enctype="multipart/form-data">
            <input type="text" hidden name="idDepartamento" value="${sessionScope['idDepartamtento']}">

            <div class="form-group">
                <label for="">Ingrese el titulo de su solicitud</label>
                <input type="text" class="form-control" name="titulo" id="titulo" required>
            </div>
            <div class="form-group">
                <label for="">Ingrese la descripcion de su solicitud</label>
                <input type="text" class="form-control" name="descripcion" id="descripcion" required>

            </div>
            <div class="form-group">
                <label for="">(Opcional)Suba un pdf donde pueda profundisar más</label>
                <input type="file" class="form-control-file" name="archivo" accept="application/pdf" id="archivo"  placeholder="" >
            </div>
            <input type="submit" name="operacion" class="btn btn-success" value="añadir">
            <c:if test="${not empty mensaje}">
                <div class="alert alert-primary" role="alert">
                    <strong>${mensaje}</strong>
                </div>
            </c:if>
        </form>
    </div>

</div>
</body>
</html>
