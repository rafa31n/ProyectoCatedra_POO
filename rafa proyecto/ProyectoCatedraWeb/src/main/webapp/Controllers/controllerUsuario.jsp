<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../conexion.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String operacion = request.getParameter("operacion");
    if (operacion.equals("insertar")) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int departamento = Integer.parseInt(request.getParameter("departamento"));
        int cargo = Integer.parseInt(request.getParameter("cargo"));
        st = conexion.prepareStatement("INSERT INTO usuario(nombre_usuario, apellido_usuario, username_usuario, contrasena_usuario, id_departamento, id_cargo) VALUES( ?, ? , ?, ? ,?, ?)");
        st.setString(1, nombre);
        st.setString(2, apellido);
        st.setString(3, username);
        st.setString(4, password);
        st.setInt(5, departamento);
        st.setInt(6, cargo);
        st.executeUpdate();
        response.sendRedirect("../Usuarios/Usuarios.jsp?mensaje=El usuario ha sido agregado correctamente.");
    } else if (operacion.equals("eliminar")) {
        int id = Integer.parseInt(request.getParameter("id"));
        st = conexion.prepareStatement("SELECT * FROM programador_caso WHERE id_usuario = ?");
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            response.sendRedirect("../Usuarios/Usuarios.jsp?mensaje=No se puede eliminar porque este usuario tiene un caso asignado.");
        } else {
            st = conexion.prepareStatement("DELETE FROM usuario WHERE id_usuario = ?");
            st.setInt(1, id);
            st.executeUpdate();
            response.sendRedirect("../Usuarios/Usuarios.jsp?mensaje=El usuario ha sido eliminado correctamente.");
        }
    } else if (operacion.equals("modificar")) {
        int id = Integer.parseInt(request.getParameter("id_usuario"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int departamento = Integer.parseInt(request.getParameter("departamento"));
        int cargo = Integer.parseInt(request.getParameter("cargo"));
        st = conexion.prepareStatement("UPDATE usuario SET nombre_usuario=?,apellido_usuario=?,username_usuario=?,contrasena_usuario=?,id_departamento=?,id_cargo=? WHERE id_usuario = ?");
        st.setString(1, nombre);
        st.setString(2, apellido);
        st.setString(3, username);
        st.setString(4, password);
        st.setInt(5, departamento);
        st.setInt(6, cargo);
        st.setInt(7, id);
        st.executeUpdate();
        response.sendRedirect("../Usuarios/Usuarios.jsp?mensaje=Los cambios se han guardado correctamente.");
    }
%>

</body>
</html>
