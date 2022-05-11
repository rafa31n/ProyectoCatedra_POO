package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Casos;
import modelos.Departamentos;
import modelos.OperacionesLogin;
import modelos.Session;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ControladorLogin", value = "/ControladorLogin")
public class ControladorLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String op = request.getParameter("operacion");
            int result = 0;
            if (op.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Departamentos nombreDep=new Departamentos();
                OperacionesLogin opLog = new OperacionesLogin();
                if (opLog.verificarSession(username, password)) {
                    opLog.setSession(username, password);
                    HttpSession sessionHTTP=request.getSession();
                    Session session=new Session();
                    // Cookie cookie=new Cookie("username",usuario);
                    sessionHTTP.setAttribute("nombre",session.getNombre_usuario());
                    sessionHTTP.setAttribute("username",username);
                    sessionHTTP.setAttribute("idusuario",session.getId_usuario());
                    sessionHTTP.setAttribute("idDepartamtento",session.getId_departamento());
                    sessionHTTP.setAttribute("nombreDepartamento",nombreDep.selectDepartamento( session.getId_departamento().toString()));
                    sessionHTTP.setAttribute("idCargo",session.getId_cargo());
                   response.sendRedirect("index.jsp");
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                }
            }
        } finally {
            out.close();
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }
}
