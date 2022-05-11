package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Casos;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "ServletAjaxFecha", value = "/ServletAjaxFecha")
public class ServletAjaxFecha extends HttpServlet {
    public void ajaxFecha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fecha=request.getParameter("fechaCreado");
        String nombre=request.getParameter("nombre");
        Casos casos=new Casos();
        HttpSession session=request.getSession();Integer idDepartamento= (Integer) session.getAttribute("idDepartamtento");
        HashMap mapa=casos.selectCasoFecha(fecha,idDepartamento);
        System.out.println(mapa);



    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ajaxFecha(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ajaxFecha(request,response);
    }
}
