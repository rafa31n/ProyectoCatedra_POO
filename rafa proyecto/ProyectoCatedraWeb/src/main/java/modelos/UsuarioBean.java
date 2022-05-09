package modelos;

public class UsuarioBean {
    private static String nombre;
    private static String apellido;
    private static String username;
    private static String password;
    private static int id_departamento;
    private static int id_cargo;

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        UsuarioBean.nombre = nombre;
    }

    public static String getApellido() {
        return apellido;
    }

    public static void setApellido(String apellido) {
        UsuarioBean.apellido = apellido;
    }

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String username) {
        UsuarioBean.username = username;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        UsuarioBean.password = password;
    }

    public static int getId_departamento() {
        return id_departamento;
    }

    public static void setId_departamento(int id_departamento) {
        UsuarioBean.id_departamento = id_departamento;
    }

    public static int getId_cargo() {
        return id_cargo;
    }

    public static void setId_cargo(int id_cargo) {
        UsuarioBean.id_cargo = id_cargo;
    }
}
