<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/5/2022
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="/menus/menu.jsp"></jsp:include>
<html>
<head>
    <title>Decidir Caso</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/cssRadio.css" >

</head>
<body>
<div class="content-container">

  .<div class="container">
  <div class="card text-left">
    <img class="card-img-top" >
    <div class="card">
      <div class="card-header text-center">
        Aceptar o denegar solicitud
      </div>
    </div>
    <div class="card-body">
      <h2 class="card-title">Titulo: #</h2>
      <h2>Descripción</h2>
      <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Distinctio aspernatur sint perferendis voluptatibus! Beatae ad dolorum tempora natus sed quis rerum similique, cupiditate veritatis id velit dolore optio nemo blanditiis.</p>
      <hr>
      <div class="radios">
        <div class="selector">
          <div class="selecotr-item">
            <input type="radio" id="radio1" name="selector" class="selector-item_radio" checked>
            <label for="radio1" class="selector-item_label">Aceptar</label>
          </div>
          <div class="selecotr-item">
            <input type="radio" id="radio2" name="selector" class="selector-item_radio">
            <label for="radio2" class="selector-item_label">Denegar</label>
          </div>

        </div>
      </div>
      <hr>
      <!-- Aceptar solicitud-->
      <div id="aceptar" >
        <form method="post" action="/ServletDecidirCaso">
          <div class="form-group">
            <label for="exampleInputEmail1">Seleccione el programador</label>
            <select name="programador"></select>

          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Seleccione el probador</label>
            <select name="tester"></select>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Seleccione la fecha de inicio</label>
            <input type="date" name="fechaInicio" id="">
            <small id="emailHelp" class="form-text text-muted">Recuerde que la fecha de inicio no puede chocar con un caso ya asignado</small>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Seleccione la fecha de finalizacion</label>
            <input type="date" name="fechaFinal" id="">
            <input type="text" name="idCaso" id="" value="${param.id}" hidden>
          </div>

          <input type="submit" name="operacion" value="aceptar" class="btn btn-success">
        </form>
      </div>
      <!-- Denegar solicitud-->
      <div id="denegar" style="display:none ;">
        <form action="/ServletDecidirCaso" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Ingrese el motivo de Denegarlo</label>
            <input type="text" name="idCaso" id="" value="${param.id}" hidden>
            <input type="text" required name="argumento" id="" class="form-control" placeholder="" aria-describedby="helpId">
            <input type="submit" name="operacion" value="denegar" class="btn btn-danger">

          </div>
      </div>
    </div>

  </div>
</div>


</div>
<script src="js/choose.js"></script>
</body>
</html>
