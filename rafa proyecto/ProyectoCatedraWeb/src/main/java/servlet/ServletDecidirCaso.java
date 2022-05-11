package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Casos;
import modelos.Denegado;

import java.io.IOException;

@WebServlet(name = "ServletDecidirCaso", value = "/ServletDecidirCaso")
public class ServletDecidirCaso extends HttpServlet {


    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operacio=request.getParameter("operacion");
        if (operacio.equals("denegar")) {
            String idCaso=request.getParameter("idCaso");
            String argumento=request.getParameter("argumento");
            Casos caso=new Casos();
            Denegado denegado=new Denegado();
            caso.updateDenegado(idCaso);
            denegado.insertDenegado(idCaso,argumento);
        }else{

        }
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
