<%@ page import="modelos.Departamentos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<%String id=request.getParameter("id");
    Integer id_departamento=Integer.parseInt(id);
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editar Cargos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">
    <div class="container">
        <h1>Editar departamento</h1>
        <h4 style="text-align: center">El id del departamento es: <%=id_departamento%></h4>
        <form method="post">
            <div class="form-group">
                <label for="nombre_departamento">Nombre del departamento</label>
                <input type="text" name="nombre_departamento" id="nombre_departamento" class="form-control" placeholder="" value="<%=Departamentos.getNombreDepartamento(id_departamento)%>">
            </div>
            <button type="submit" name="guardar" class="btn btn-success">Editar</button>
            <a class="btn btn-danger" href="departamentos.jsp">Regresar</a>
        </form>
    </div>
</div>

</body>
<%
    String nombre=request.getParameter("nombre_departamento");
    if (request.getParameter("guardar") != null) {
        Departamentos.actualizarDepartamento(id_departamento,nombre);
        response.sendRedirect("departamentos.jsp");
    }
%>
</html>
