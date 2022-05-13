<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="fechas" class="modelos.Casos"></jsp:useBean>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root"  password=""/>
<c:if test="${param.operacion == 'aceptar'}">
    <c:set var="fechaIN" value="${param.fecha_I}"></c:set>
    <c:set var="fechaFin" value="${param.fecha_F}"></c:set>
   <c:choose>
        <c:when test="${fechas.verficarFechas(fechaIN,fechaFin)==true}">
            <c:choose>
                <c:when test="${fechas.FechasExistentesInicio(fechaIN,param.id_programador)==true}">
                    <sql:update var="insertar" dataSource="${db}">
                        UPDATE caso SET id_estado = 1, fecha_inicio = ?, fecha_final = ? WHERE id_caso = ?
                        <sql:param value="${param.fecha_I}"/>
                        <sql:param value="${param.fecha_F}"/>
                        <sql:param value="${param.id}"/>
                    </sql:update>
                    <sql:update var="insertar2" dataSource="${db}">
                        INSERT programador_caso (id_caso,id_usuario) VALUES (?,?)
                        <sql:param value="${param.id}"/>
                        <sql:param value="${param.id_programador}"/>
                    </sql:update>
                    <sql:update var="insertar3" dataSource="${db}">
                        INSERT INTO probador_caso (id_caso,id_usuario) VALUES (?,?)
                        <sql:param value="${param.id}"/>
                        <sql:param value="${param.id_tester}"/>
                    </sql:update>
                    <c:redirect url="/AceptarDenegarCaso/aceptardenegar.jsp">
                        <c:param name="mensaje" value="Caso aceptado con exito"/>
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="/AceptarDenegarCaso/aceptardenegar.jsp">
                        <c:param name="mensaje" value="El programador ya tiene un caso que inicia la misma fecha"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>

        </c:when>
       <c:otherwise>
           <c:redirect url="/AceptarDenegarCaso/aceptardenegar.jsp">
               <c:param name="mensaje" value="La fecha inicial no puede ser mayor o igual que la final"/>
           </c:redirect>
       </c:otherwise>
   </c:choose>

</c:if>

<c:if test="${param.operacion == 'denegar'}">
    <sql:update var="insertar" dataSource="${db}">
        UPDATE caso SET id_estado = 5 WHERE id_caso = ?
        <sql:param value="${param.id}"/>
    </sql:update>
    <sql:update var="insertar2" dataSource="${db}">
        INSERT INTO argumento (id_caso,argumentos_descripcion) VALUES (?,?)
        <sql:param value="${param.id}"/>
        <sql:param value="${param.texto}"/>
    </sql:update>
    <c:redirect url="/AceptarDenegarCaso/aceptardenegar.jsp">
        <c:param name="mensaje" value="Caso rechazado!!!"/>
    </c:redirect>
</c:if>

</body>
</html>
