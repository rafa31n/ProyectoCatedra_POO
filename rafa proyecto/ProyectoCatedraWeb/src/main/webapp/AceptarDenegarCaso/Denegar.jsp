<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="../menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="content-container">
    <div class="text-center">
        <h2 class="text-center">Denegar</h2>
        <form action="/Controllers/controllerAceptarDenegar.jsp">
            <input type="hidden" name="id" value="${param.id}">
            <input type="hidden" name="metodo" value="argumento">
            <input type="hidden" name="operacion" value="denegar">
            <label>El porque rechaza el caso:</label><br />
            <textarea name="texto" required></textarea><br />
            <input type="submit" class="btn btn-danger" name="btn-denegar" value="Confirmar">
        </form>
    </div>
</div>

</body>
</html>
