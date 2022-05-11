<%@ page import="modelos.Session" %>
<%@ page import="modelos.Casos" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>

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

                            <c:when test="${caso.ContadorEnProceso(obj.id_departamento)<1 }">


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
    <%-- Programador---%>
    <c:when test="${id_cargo ==1}">
        <div class="content-container">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="align-self-center">
                                            <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                        </div>
                                        <div class="media-body text-right">
                                            <h3><c:out value="${caso.contadorCasoProgramador(obj.id_usuario)}"></c:out></h3>
                                            <span>Casos asignados</span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row mt-3 ">
                    <h1>Casos que fueron asignados</h1>
                </div>
                <!-- Tabla de Casos asignados-->
                <div class="row ">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Id del caso</th>
                            <th>Titulo</th>
                            <th>Descripción</th>
                            <th>Fecha de finalizacion</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>

                            <c:when test="${caso.contadorCasoProgramador(obj.id_usuario) <1}">


                                <tr>
                                    <td scope="row">No hay datos</td>
                                    <td>No hay datos</td>
                                    <td>No hay datos</td>
                                    <td>No hay datos</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <sql:query var="rs" dataSource="${db}">select c.id_caso,c.titulo,c.descripcion,ifnull(c.fecha_final,'no hay datos')
                                    as fecha_final from caso c inner join programador_caso pc on c.id_caso = pc.id_caso where pc.id_usuario=?
                                    <sql:param value="<%=obj.getId_usuario()%>"></sql:param>
                                </sql:query>
                                <c:forEach items="${rs.rows}" var="row">
                                    <tr>
                                        <td scope="row"><c:out value="${row.id_caso}"></c:out></td>
                                        <td scope="row"><c:out value="${row.titulo}"></c:out></td>
                                        <td scope="row"><c:out value="${row.descripcion}"></c:out></td>
                                        <td scope="row"><c:out value="${row.fecha_final}"></c:out></td>
                                        <td><a name="" id="<c:out value="${row.id_caso}"></c:out>" class="btn btn-primary" href="../Bitacoras/Bitacoras.jsp?id=<c:out value="${row.id_caso}"></c:out>" role="button">Ver
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
    <%-- Tester---%>
    <c:when test="${id_cargo==5}">
        <div class="content-container">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="align-self-center">
                                            <a name="" id="" class="btn btn-primary" href="#" role="button">Ver</a>
                                        </div>
                                        <div class="media-body text-right">
                                            <h3><c:out value="${caso.contadorCasoProbrador(obj.id_usuario)}"></c:out></h3>
                                            <span>Casos asignados</span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row mt-3 ">
                    <h1>Casos que fueron asignados</h1>
                </div>
                <!-- Tabla de Casos asignados-->
                <div class="row ">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Id del caso</th>
                            <th>Titulo</th>
                            <th>Descripción</th>
                            <th>Fecha de finalizacion</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>

                            <c:when test="${caso.contadorCasoProbrador(obj.id_usuario)<1}">


                                <tr>
                                    <td scope="row">No hay datos</td>
                                    <td>No hay datos</td>
                                    <td>No hay datos</td>
                                    <td>No hay datos</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <sql:query var="rs" dataSource="${db}">select c.id_caso,c.titulo,c.descripcion,ifnull(c.fecha_final,'no hay datos')
                                    as fecha_final from caso c inner join probador_caso pc on c.id_caso = pc.id_caso where pc.id_usuario=?
                                    <sql:param value="<%=obj.getId_usuario()%>"></sql:param>
                                </sql:query>
                                <c:forEach items="${rs.rows}" var="row">
                                    <tr>
                                        <td scope="row"><c:out value="${row.id_caso}"></c:out></td>
                                        <td scope="row"><c:out value="${row.titulo}"></c:out></td>
                                        <td scope="row"><c:out value="${row.descripcion}"></c:out></td>
                                        <td scope="row"><c:out value="${row.fecha_final}"></c:out></td>
                                        <td><a name="" id="<c:out value="${row.id_caso}"></c:out>" class="btn btn-primary" href="#?id=<c:out value="${row.id_caso}"></c:out>" role="button">Ver</a></td>
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




