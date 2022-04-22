<%@ page import="modelos.Session" %>
<%@ page import="modelos.Casos" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="col" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 18/4/2022
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<jsp:useBean id="obj" class="modelos.Session"></jsp:useBean>
<jsp:useBean id="caso" class="modelos.Casos"></jsp:useBean>


<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://botujl4t5mtacru2euoc-mysql.services.clever-cloud.com/botujl4t5mtacru2euoc"
                   user="udseiu6bqnvpk1ym" password="ywLmU6giAuWjIQZN8hB4"></sql:setDataSource>
<c:set var="id_cargo" value="${obj.id_cargo}"></c:set>
<c:set var="id_departamento" value="${obj.id_departamento}"></c:set>

<c:choose>
<%-- ADmin---%>
    <c:when test="${id_cargo ==2}">

  <div class="content-container">
      <div class="container-fluid">

          <div class="row">
              <div class="col-xl-3 col-sm-6 col-12">
                  <div class="card">
                      <div class="card-content">
                          <div class="card-body">
                              <div class="media d-flex">
                                  <div class="align-self-center">
                                      <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                  </div>
                                  <div class="media-body text-right">
                                      <h3> </h3>

                                      <span>Nuevas solicitudes <c:out value="${caso.ContadorEnSolicitudes(obj.id_departamento)}"></c:out> </span>

                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-xl-3 col-sm-6 col-12">
                  <div class="card">
                      <div class="card-content">
                          <div class="card-body">
                              <div class="media d-flex">
                                  <div class="align-self-center">
                                      <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                  </div>
                                  <div class="media-body text-right">
                                      <h3> </h3>

                                      <span>Casos aceptados <c:out value="${caso.ContadorEnProceso(id_departamento)}"></c:out>  </span>

                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-xl-3 col-sm-6 col-12">
                  <div class="card">
                      <div class="card-content">
                          <div class="card-body">
                              <div class="media d-flex">
                                  <div class="align-self-center">
                                      <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                  </div>
                                  <div class="media-body text-right">
                                      <h3></h3>

                                      <span>Casos denegados  <c:out value="${caso.ContadorEnDenegados(id_departamento)}"></c:out></span>

                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-xl-3 col-sm-6 col-12">
                  <div class="card">
                      <div class="card-content">
                          <div class="card-body">
                              <div class="media d-flex">
                                  <div class="align-self-center">
                                      <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                  </div>
                                  <div class="media-body text-right">
                                      <h3></h3>

                                      <span>Casos Finalizados  <c:out value="${caso.ContadorEnFinalizados(id_departamento)}"></c:out> </span>

                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>

          <div class="row mt-3 ">
              <h1>Casos que estan en proceso</h1>
          </div>
          <!-- Tabla de Casos en proceso-->
          <div class="row mt-3 ">
              <table class="table table-striped">
                  <thead>
                  <tr>
                      <th>Id del caso</th>
                      <th>Titulo</th>
                      <th>Descripción</th>
                      <th>Programador</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- si la tabla no tiene nada-->
                  <c:choose>

                    <c:when test="${obj.id_departamento<1}">


                  <tr>
                      <td scope="row">No hay datos</td>
                      <td>No hay datos</td>
                      <td>No hay datos</td>
                      <td>No hay datos</td>
                  </tr>
                    </c:when>
                      <c:otherwise>


                  <sql:query var="rs" dataSource="${db}">select caso.id_caso,caso.titulo,caso.descripcion,pc.id_usuario from
                      caso inner join programador_caso pc on caso.id_caso = pc.id_caso where caso.id_departamento=?
                  <sql:param value="<%=obj.getId_departamento()%>"></sql:param>
                  </sql:query>
                  <c:forEach items="${rs.rows}" var="row">
                      <tr>
                          <td scope="row"><c:out value="${row.id_caso}"></c:out></td>
                          <td scope="row"><c:out value="${row.titulo}"></c:out></td>
                          <td scope="row"><c:out value="${row.descripcion}"></c:out></td>
                          <td scope="row"><c:out value="${row.id_usuario}"></c:out></td>
                          <td scope="row">id dep= <c:out value="${obj.id_departamento}"></c:out></td>
                          <td><a name="" id="<c:out value="${row.id_caso}"></c:out>" class="btn btn-primary" href="#?id=<c:out value="${row.id_caso}"></c:out>" role="button">Ver
                          Bitacora</a></td>
                      </tr>
                  </c:forEach>
                      </c:otherwise>
                  </c:choose>



                  </tbody>
              </table>
          </div>
      </div>




  </div>
    </c:when>
</c:choose>



