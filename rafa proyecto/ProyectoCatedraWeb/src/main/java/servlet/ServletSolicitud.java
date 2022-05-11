package servlet;

import beans.CasoBeans;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import modelos.Casos;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Locale;
import java.util.Random;

@WebServlet(name = "ServletSolicitud", value = "/ServletSolicitud")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 1000,      // 10 MB
        maxRequestSize = 1024 * 1024 * 10000   )
public class ServletSolicitud extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String operacion=request.getParameter("operacion");
            Casos metodo= new Casos();
            CasoBeans beans=new CasoBeans();
            if (operacion.equals("añadir")){
                HttpSession session=request.getSession();
                String mensaje="Solicitud añadida correctamente";
                request.setAttribute("mensaje",mensaje);
                //Parametros
                Integer idDepartamento= (Integer) session.getAttribute("idDepartamtento");
                String nombreDep=(String)session.getAttribute("nombreDepartamento");
                Random random=new Random();Integer numeros=random.nextInt(900)+100;
                String idCaso=nombreDep.substring(0,3).toUpperCase(Locale.ROOT)+numeros;
                beans.setId_caso(idCaso);
                beans.setId_department(String.valueOf(idDepartamento));
                beans.setTitulo(request.getParameter("titulo"));
                beans.setDescripcion(request.getParameter("descripcion"));

                Part archivo=request.getPart("archivo");
                //verifica que no este nulo
                String ruta=archivo.getSubmittedFileName();
                if (ruta.equals("")) {
                    beans.setPdf_caso(null);
                }else {
                    InputStream inArchivo=archivo.getInputStream();
                    beans.setPdf_caso(inArchivo);
                }
              metodo.crearSolicitud(beans);
               request.getRequestDispatcher("/solicitud/solicitud.jsp").forward(request,response);
                //response.sendRedirect("/solicitud/solicitud.jsp");

            }else if (operacion.equals("mostrar")){
                response.setContentType("application/pdf");
                Casos casosDao= new  Casos();
                String id_caso=request.getParameter("id");
                byte[] pdfBytes=casosDao.obtenerPdf(id_caso);

                InputStream bos=new ByteArrayInputStream(pdfBytes);
                int inputSize=bos.available();
                byte[] datosPdf=new byte[inputSize];
                bos.read(datosPdf,0,inputSize);
                response.getOutputStream().write(datosPdf);
                bos.close();
            }
        }catch (Exception e){
            e.printStackTrace();
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
