<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/5/2022
  Time: 01:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="/menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Perfil</title>
</head>
<body>
<div class="content-container">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-6 mb-4 mb-lg-0">
                <div class="card mb-3" style="border-radius: .5rem;">
                    <div class="row g-0">
                        <div class="col-md-4 gradient-custom text-center text-white"
                             style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                            <img src="https://cdn.icon-icons.com/icons2/2506/PNG/512/user_icon_150670.png"
                                 alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body p-4">
                                <h6>Información</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>Nombre</h6>
                                        <p class="text-muted">${sessionScope['nombre']}</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <h6>Cargo</h6>
                                        <p class="text-muted">${sessionScope['idCargo']}</p>
                                    </div>
                                </div>
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>Departamento</h6>
                                        <p class="text-muted">${sessionScope['nombreDepartamento']}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
