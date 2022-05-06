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
<jsp:include page="../menu/menu.jsp"></jsp:include>
<html>
<head>
    <title>Ver Bitacoras</title>
</head>
<d>
<c:set var="idCaso" value="${param.id}"></c:set>
<c:out value="${idCaso}"></c:out>

    <div class="content-container">
        <div class="container-xl container-fluid">
            <div class="">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2><b>Bitacoras</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addBitacora" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Añadir nueva Bitacora</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Descripción</th>
                            <th>Progreso</th>
                            <th>Estado</th>
                            <th>Fecha</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>

                            <td>Thomas Hardy</td>
                            <td>thomashardy@mail.com</td>
                            <td>89 Chiaroscuro Rd, Portland, USA</td>
                            <td>(171) 555-2222</td>

                        </tr>
                        </tbody>

                </div>
                <!-- Añadir Bitacora -->
                <div id="addBitacora" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form>
                                <!-- idUsuario -->
                                <input name="idUsuario" value="${sessionScope['idusuario']}" hidden>
                                <div class="modal-header">
                                    <h4 class="modal-title">Añadir Bitacora</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input type="text" class="form-control" name="txtNombre" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Progreso</label>
                                        <input type="number" class="form-control" name="txtProgreso" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <textarea class="form-control" name="txtDescripcion" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    <input type="submit" name="operacion" class="btn btn-success" value="Añadir">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/popper.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
