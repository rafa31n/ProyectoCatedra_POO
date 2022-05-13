package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modelos.Casos;
import modelos.ConexionJava;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletReportes", value = "/ServletReportes")
public class ServletReportes extends HttpServlet {

    public void reporteCaso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn=null;
        Casos casos=new Casos();
        //conexion bdd
        try {
            HttpSession session=request.getSession();
            conn=ConexionJava.getConnection();
            String fechaCreado=request.getParameter("fechaCreado");
            Integer idDepartamento= (Integer) session.getAttribute("idDepartamtento");
            if ( casos.getCasosPorFecha(fechaCreado, String.valueOf(idDepartamento))>0) {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition","attachment;filename=\"ReporteCasos.pdf\";");
                ServletOutputStream out= response.getOutputStream();
                Map parametros=new HashMap();
                parametros.put("idDepartamento",idDepartamento);
                parametros.put("fechaCreacion",fechaCreado);
                String pdfRuta="";
                pdfRuta=getServletContext().getRealPath("Reportes/FinalEspero.jasper");
                //Pasar a ruta Jasper
                JasperReport report= (JasperReport) JRLoader.loadObjectFromFile(pdfRuta);
                //imprimir reporte
                JasperPrint print= JasperFillManager.fillReport(report,parametros,conn);
                JRPdfExporter exporter=new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
                exporter.exportReport();
            }else {

                request.setAttribute("mensaje","No se puede generar porque No hubieron casos ese dia");
                request.getRequestDispatcher("Reportes/reportes.jsp").forward(request,response);
            }



        }catch (SQLException e){
            e.printStackTrace();

        } catch (JRException e) {
            e.printStackTrace();
        }


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reporteCaso(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reporteCaso(request,response);
    }
}
