<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 12/5/2022
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Observaciones del caso</title>
</head>
<c:set var="idCaso" value="${param.id}"></c:set>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select * from observacion where id_caso=?
    <sql:param value="${idCaso}"></sql:param>
</sql:query>
<body>

<div class="content-container">
<h1> Observaciones de caso</h1>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <td> <b>id del Caso</b> </td>
                <td><b>Descripción de la observacion</b></td>
            </tr>
        </thead>

            <c:forEach var="row" items="${rs.rows}">
                <tr> <td>${row.id_caso}</td>
                    <td>${row.descripcion_observacion}</td>
                </tr>
            </c:forEach>

    </table>
</div>




</body>
</html>
