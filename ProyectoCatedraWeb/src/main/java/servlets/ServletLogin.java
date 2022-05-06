package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Login;
import modelos.Session;


import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class ServletLogin extends  HttpServlet {
   public void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
       try{
           response.setContentType("text/html");
           String usuario,contrasena;
           usuario=request.getParameter("usuario");
           contrasena=request.getParameter("password");
           if (Login.verificarUsuario(usuario,contrasena)==true){
               Login.setSession(usuario,contrasena);
               HttpSession sessionHTTP=request.getSession();
               Session session=new Session();
              // Cookie cookie=new Cookie("username",usuario);
               sessionHTTP.setAttribute("nombre",session.getNombre_usuario());
               sessionHTTP.setAttribute("username",usuario);
               sessionHTTP.setAttribute("idusuario",session.getId_usuario());
               sessionHTTP.setAttribute("idDepartamento",session.getId_departamento());
               sessionHTTP.setAttribute("idCargo",session.getId_cargo());
               response.sendRedirect("index.jsp");

               System.out.println("el usuario existe");
           }else{
               response.sendRedirect("login/login.jsp");
           }

       }catch (Exception e){e.printStackTrace();}

   }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
