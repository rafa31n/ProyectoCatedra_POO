<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 12/5/2022
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="modelos.RevisionCasos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<%String id=request.getParameter("id");

%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rechazar caso</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

<div class="content-container">
    <div class="contenido">
        <h1>Rechazar caso</h1>
        <h4 style="text-align: center">El id del caso es: <%=id%></h4>
        <form method="post">
            <div class="form-group">
                <label for="txtObservacion" >Ingrese las observaciones del caso </label>
                <input type="text" class="form-control" value="" name="txtObservacion" required id="txtObservacion" placeholder="">
            </div>
            <button type="submit" name="guardar" value="" class="btn btn-success">Guardar</button>
            <a class="btn btn-warning" href="revisionCasos.jsp">Regresar</a>
        </form>

        <%
            String observacion =request.getParameter("txtObservacion");
            RevisionCasos resetear= new RevisionCasos();
            if (request.getParameter("guardar") != null) {
                RevisionCasos.updateRechazado(id);
                RevisionCasos.ingresarOBS(id,observacion);
                resetear.resetearUltimaBitacora(id);
                System.out.println("Dato Guardado");
                response.sendRedirect("revisionCasos.jsp");
            }

        %>
    </div>
</div>


</body>
<style>
    .contenido {
        width: 70%;
        margin: 0 auto;
    }
</style>
</html>
