<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
        <div class="container">
            <form>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-1-12 col-form-label"></label>
                    <div class="col-sm-1-12">
                        <input type="text" class="form-control" name="inputName" id="inputName" placeholder="">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-1-12 col-form-label"></label>
                    <div class="col-sm-1-12">
                        <input type="text" class="form-control" name="inputName" id="inputName" placeholder="">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-1-12 col-form-label"></label>
                    <div class="col-sm-1-12">
                        <input type="text" class="form-control" name="inputName" id="inputName" placeholder="">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Action</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</body>
</html>
