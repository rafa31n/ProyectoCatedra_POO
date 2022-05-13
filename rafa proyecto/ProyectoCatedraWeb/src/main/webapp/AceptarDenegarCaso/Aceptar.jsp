<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>

<html>
<head>
    <title>Aceptar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="content-container">
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/telecomunicacion2"
                       user="root"  password=""/>
    <c:catch var="error01">
        <sql:query var="q1" dataSource="${db}">
            SELECT * FROM usuario WHERE id_cargo = 1 and id_departamento=?
            <sql:param value="${sessionScope['idDepartamtento']}"></sql:param>
        </sql:query>
        <sql:query var="q2" dataSource="${db}">
            SELECT * FROM usuario WHERE id_cargo = 5 and id_departamento=?
            <sql:param value="${sessionScope['idDepartamtento']}"></sql:param>
        </sql:query>
    </c:catch>
    <c:if test="${not empty error01}">
        <div class="alert alert-danger">
            <strong>Se produjo un error:</strong> ${error01}
            <br>
        </div>
    </c:if>
    <h3 class="text-center">Aceptar</h3>
    <div class="text-center">
        <form action="/Controllers/controllerAceptarDenegar.jsp" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <div class="form-group">
            <label>Asignar programador:</label>
            <select name="id_programador" required>
                <c:forEach var="programador" items="${q1.rows}">
                    <option value="${programador.id_usuario}">${programador.nombre_usuario}</option>
                </c:forEach>
            </select>
            </div>
            <div class="form-group">
            <label>Asignar tester:</label>
            <select name="id_tester" required>
                <c:forEach var="tester" items="${q2.rows}">
                    <option value="${tester.id_usuario}">${tester.nombre_usuario}</option>
                </c:forEach>
            </select>
            </div>
            <div class="form-group">
            <input type="hidden" name="operacion"  value="aceptar">
            <label>Fecha Inicial:</label><br />
            <input type="date" name="fecha_I" required id="fechaInicio">
            </div>
            <div class="form-group">
            <label>Fecha Final:</label>
            <input type="date" name="fecha_F" required id="fechaFinal">
            <input class="btn btn-primary" type="submit" name="acept" value="Confirmar">
            </div>
        </form>
    </div>

</div>
<script src="js/fechasAceptar.js"></script>
</body>
</html>
