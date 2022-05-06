<%@ page import="modelos.Session" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<c:set var="cookieUsuario" value="${sessionScope['username']}" ></c:set>
<c:choose>
    <c:when test="${cookieUsuario==null || empty cookieUsuario}">
        <c:redirect url="login/login.jsp"></c:redirect>
    </c:when>
    <c:otherwise>
        <jsp:include page="menu/menu.jsp"></jsp:include>
        <jsp:include page="Controlador/DashboardControlador.jsp"></jsp:include>
    </c:otherwise>
</c:choose>

</body>
</html>