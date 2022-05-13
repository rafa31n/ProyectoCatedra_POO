<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 24/4/2022
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Ver Bitacoras</title>
</head>
<d>
<c:set var="idCaso" value="${param.id}"></c:set>
    <jsp:useBean id="caso" class="modelos.Casos"></jsp:useBean>
<c:out value="${idCaso}"></c:out>
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost/telecomunicacion2"
                       user="root" password=""></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select * from bitacora where id_caso=? order by fecha_bitacora,progreso_bitacora desc
    <sql:param value="${idCaso}"></sql:param>
    </sql:query>
    <div class="content-container">
        <div class="container-xl container-fluid">
            <div class="">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2><b>Bitacoras</b></h2>
                                <c:if test="${not empty mensaje}">
                                    <div class="alert alert-primary" role="alert">
                                        <strong><c:out value="${mensaje}"></c:out></strong>
                                    </div>
                                </c:if>
                            </div>
                            <%--Si es programdor puede crea bitacora--%>
                            <c:if test="${ sessionScope['idCargo']==1}">
                                <c:choose>
                                    <c:when test="${caso.getEstado(idCaso)==1 ||caso.getEstado(idCaso)==7 }">
                                        <div class="col-sm-6">
                                            <a href="#addBitacora" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Añadir nueva Bitacora</span></a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-primary" role="alert">
                                            <strong>Se ha cerrado el caso para crear bitacora</strong>
                                        </div>
                                    </c:otherwise>

                                </c:choose>

                            </c:if>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Descripción</th>
                            <th>Progreso</th>
                            <th>Fecha</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty rs.rows}">
                                <tr><td>No hay bitacoras creadas</td> </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${rs.rows}" var="row">
                                    <tr>

                                        <td><c:out value="${row.titulo_bitacora}"></c:out></td>
                                        <td><c:out value="${row.descripcion_bitacora}"></c:out></td>
                                        <td><c:out value="${row.progreso_bitacora}"></c:out>%</td>
                                        <td><c:out value="${row.fecha_bitacora}"></c:out></td>

                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>

                </div>
                <!-- Añadir Bitacora -->
                <div id="addBitacora" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/BitacoraServlet" method="post">
                                <!-- idUsuario -->
                                <input name="idUsuario" value="${sessionScope['idusuario']}" hidden>
                                <input name="idCaso" value="${idCaso}" hidden>
                                <div class="modal-header">
                                    <h4 class="modal-title">Añadir Bitacora</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input type="text" class="form-control" name="txtNombre" required>
                                        <label>Progreso actual</label>
                                        <input name="progresoActual" value="${caso.progresoActual(idCaso)}" id="progresoActual" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Progreso a cambiar</label>
                                        <input type="number" class="form-control" name="txtProgreso" id="txtProgreso" max="100" min="0" required>
                                    </div>
                                    <!-- Añadir Bitacora -->
                                    <c:if test="${caso.getEstado(idCaso)==7}">
                                    <div class="form-group">
                                        <label>Ver observaciones</label>
                                        <a href="../observaciones/index.jsp?id=${idCaso}" class="btn btn-success">Ver</a>
                                    </div>
                                    </c:if>

                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <textarea class="form-control" name="txtDescripcion" required></textarea>
                                        <div id="alertaJS">
                                            <div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    <input type="submit" id="operacion" name="operacion" class="btn btn-success" value="añadir">

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
<script src="js/crearBitacora.js"></script>

</body>
</html>
