<%@ page import="modelos.Session" %>
<%@ page import="modelos.Casos" %><%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 18/4/2022
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


  <%
      Integer cargo= Session.getId_cargo(),id_departamento=Session.getId_departamento();

      switch (cargo){
          //admin
          case 2:
              %>
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
                                      <h3><%= Casos.ContadorEnSolicitudes(id_departamento)%></h3>

                                      <span>Nuevas solicitudes</span>

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
                                      <h3><%= Casos.ContadorEnProceso(id_departamento)%></h3>

                                      <span>Casos aceptados</span>

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
                                      <h3><%= Casos.ContadorEnDenegados(id_departamento)%></h3>

                                      <span>Casos denegados</span>

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
                                      <h3><%= Casos.ContadorEnFinalizados(id_departamento)%></h3>

                                      <span>Casos Finalizados</span>

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
                  <%
                    Integer contador=Casos.ContadorEnProceso(id_departamento);
                      if (contador <1) {
                  %>
                  <tr>
                      <td scope="row">No hay datos</td>
                      <td>No hay datos</td>
                      <td>No hay datos</td>
                      <td>No hay datos</td>
                  </tr>
                      <%
                      } else {
                      %>
                  <tr>
                      <td scope="row"></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td><a name="" id="" class="btn btn-primary" href="#" role="button">Ver Bitacora</a></td>
                  </tr>
                      <%
                      }
                      %>


                  </tbody>
              </table>
          </div>
      </div>




  </div>

  <%
              break;
      }
  %>


