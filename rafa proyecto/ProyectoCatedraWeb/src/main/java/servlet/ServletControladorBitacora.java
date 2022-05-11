package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Bitacoras;
import modelos.Casos;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "BitacoraServlet", value = "/BitacoraServlet")
public class ServletControladorBitacora extends HttpServlet {
    public void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        try {
            response.setContentType("text/html");

            String operacion=request.getParameter("operacion");
            Bitacoras bitacoras=new Bitacoras();
            Casos estado=new Casos();
            LocalDate fecha=LocalDate.now();
            if (operacion.equals("añadir")){
                HttpSession session=request.getSession();

                //Parametros
              String  idCaso=request.getParameter("idCaso");
              String titulo=request.getParameter("txtNombre");
              String descripcion=request.getParameter("txtDescripcion");
              String progreso=request.getParameter("txtProgreso");
                Integer idUsuario= (Integer) session.getAttribute("idusuario");
                if (estado.getEstado(idCaso) == 1 && Integer.parseInt(progreso)==100) {
                    bitacoras.insertarBitacora(idUsuario,idCaso,titulo,descripcion, String.valueOf(fecha),progreso);
                    estado.updateEsperandoArea(idCaso);
                    String mensaje="Bitacora añadida correctamente y Esperando Area solicitante";
                    request.setAttribute("mensaje",mensaje);
                }else if (estado.getEstado(idCaso) == 7 && Integer.parseInt(progreso)==100) {

                    bitacoras.insertarBitacora(idUsuario,idCaso,titulo,descripcion, String.valueOf(fecha),progreso);
                    estado.updateEsperandoArea(idCaso);
                    String mensaje="Bitacora añadida correctamente y Esperando Area solicitante";
                    request.setAttribute("mensaje",mensaje);
                }else{
                    bitacoras.insertarBitacora(idUsuario,idCaso,titulo,descripcion, String.valueOf(fecha),progreso);
                    String mensaje="Bitacora añadida correctamente";
                    request.setAttribute("mensaje",mensaje);

                }

              //forwarder

                request.getRequestDispatcher("Bitacoras/VerBitacoras.jsp?id="+idCaso).forward(request,response);
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
