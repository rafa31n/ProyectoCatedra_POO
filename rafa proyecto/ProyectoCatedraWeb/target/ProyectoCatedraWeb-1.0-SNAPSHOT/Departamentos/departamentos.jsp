<%@ page import="modelos.Departamentos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<jsp:useBean id="departamentoName" class="modelos.Departamentos"></jsp:useBean>
<sql:query var="rs" dataSource="${db}">select * from departamento</sql:query>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Departamentos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">

    <div class="container">
        <h1>Departamentos</h1>

        <form method="post">
            <div class="form-group">
                <label for="txtDepartamento" >Nombre de departamento </label>
                <input type="text" class="form-control" value="" name="txtDepartamento" required id="txtDepartamento" aria-describedby="helpId" placeholder="">
            </div>
            <button type="submit" name="guardar" value="" class="btn btn-primary">Guardar</button>
        </form>

        <%
            String mensaje = request.getParameter("mensaje");
            if (mensaje != null) {
                out.println("<div class='alert alert-info' role='alert'>");
                out.println(mensaje);
                out.println("</div>");
            }
        %>

        <div class="table-responsive">

        <table class="table table-hover table-sm caption-top" style="margin: 10px auto">
            <caption>Lista de departamentos</caption>
            <thead class="thead-dark">
            <tr>
                <th scope="col"> Id del departamento</th>
                <th scope="col">Nombre de departamento</th>
                <th scope="col" colspan="4">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.id_departamento}"></c:out></td>
                    <td><c:out value="${row.nombre_departamento}"></c:out></td>
                    <td><a id="<c:out value="${row.id_departamento}"></c:out>" class="btn btn-outline-primary" href="editarDepartamento.jsp?id=<c:out value="${row.id_departamento}"></c:out>" role="button"><i class="bi bi-pencil-square"> Editar</i></a></td>
                    <td><button class="btn btn-outline-primary" role="button" onclick="alerta('${row.id_departamento}')"><i class="bi bi-trash"> Eliminar</i></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
        <%
            String nombre=request.getParameter("txtDepartamento");

            if (request.getParameter("guardar") != null) {
                Departamentos.insertDepartamento(nombre);
                System.out.println("Dato Guardado");
                response.sendRedirect("departamentos.jsp");
            }

        %>

        </div>

    </div>
<script>
    function alerta(id) {
        var mensaje;
        var opcion = confirm("¿Está seguro de eliminar este registro?");
        if (opcion == true) {
            location.href="eliminarDepartamento.jsp?action=eliminar&id="+id;

        }
    }
</script>
</body>
</html>
