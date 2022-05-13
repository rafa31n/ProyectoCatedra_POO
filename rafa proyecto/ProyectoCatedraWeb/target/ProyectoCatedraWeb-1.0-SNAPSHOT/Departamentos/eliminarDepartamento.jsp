<%@ page import="modelos.Departamentos" %>
<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 11/5/2022
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="departamento" class="modelos.Departamentos"></jsp:useBean>
<html>
<head>
    <title>Eliminar Departamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<%
    String id=request.getParameter("id");
    Integer id_departamento=Integer.parseInt(id),contador= Departamentos.getContadorDepartamentos(id_departamento);
    if (contador >0) {
%>
<div class="alert alert-primary" role="alert">
    <strong>Este departamento contiene usuarios! Por lo que no se puede Eliminar</strong> <a href="departamentos.jsp.jsp" class="alert-link"> Volver a departamentos</a>
</div>
<%
    }else {
        Departamentos.deleteDepartamento(id_departamento);

        response.sendRedirect("departamentos.jsp?mensaje=El usuario ha sido eliminado correctamente.");
    }
%>


</body>
</html>
