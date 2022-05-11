<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 15/4/2022
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<jsp:useBean id="caso" class="modelos.Casos"></jsp:useBean>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<c:set var="idDepartamento" value="${sessionScope['idDepartamtento']}"></c:set>
<c:set var="idCargo" value="${sessionScope['idCargo']}"></c:set>
<c:set var="idUser" value="${sessionScope['idusuario']}"></c:set>

<html>
<head>
    <title>bitacoras</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="content-container">
    <c:choose>
        <%--Programador--%>
        <c:when test="${idCargo==1}">
            <sql:query var="rs" dataSource="${db}">select * from caso left join programador_caso pc on caso.id_caso = pc.id_caso where pc.id_usuario=?
                <sql:param value="${idUser}"></sql:param>
            </sql:query>
            <c:forEach items="${rs.rows}" var="row">
                <div class="row">
                    <div class="col-sm-6 col-md-5 offset-md-2 col-lg-6 offset-lg-0 ">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title"> <c:out value="${row.titulo}"></c:out></h3>
                                <p class="card-text">Descripcion:<c:out value="${row.descripcion}"></c:out></p>
                                <h5 class="card-title">Estado: <c:out value="${caso.getEstadoName(row.id_caso)}"></c:out> </h5>

                                <a name="" target="_blank" id="" class="btn btn-primary" href="verDetalles.jsp?id=${row.id_caso}" role="button">Ver más detalles</a>
                                <a name="" id="" class="btn btn-primary" href="VerBitacoras.jsp?id=${row.id_caso}" role="button">Ver bitacoras</a>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <%--Demas cargos--%>
        <c:otherwise>
            <sql:query var="rs" dataSource="${db}">select * from caso where id_departamento=?
                <sql:param value="${idDepartamento}"></sql:param>
            </sql:query>
            <c:forEach items="${rs.rows}" var="row">
                <div class="row">
                    <div class="col-sm-6 col-md-5 offset-md-2 col-lg-6 offset-lg-0 ">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title"> <c:out value="${row.titulo}"></c:out></h3>
                                <p class="card-text">Descripcion:<c:out value="${row.descripcion}"></c:out></p>
                                <h5 class="card-title">Estado: <c:out value="${caso.getEstadoName(row.id_caso)}"></c:out> </h5>

                                <a name="" target="_blank" id="" class="btn btn-primary" href="verDetalles.jsp?id=${row.id_caso}" role="button">Ver más detalles</a>
                                <a name="" id="" class="btn btn-primary" href="VerBitacoras.jsp?id=${row.id_caso}" role="button">Ver bitacoras</a>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>


    

</div>
</body>
</html>
