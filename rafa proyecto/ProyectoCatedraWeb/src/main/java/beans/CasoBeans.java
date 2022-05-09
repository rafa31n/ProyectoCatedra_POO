package beans;

import java.io.InputStream;
import java.sql.Blob;

public class CasoBeans {
    String id_caso,id_estado,id_departamento,descripcion,progreso,titulo,fecha_inicio,fecha_final,fecha_creacion;
    InputStream pdf_caso=null;

    public InputStream getPdf_caso() {
        return pdf_caso;
    }

    public void setPdf_caso(InputStream pdf_caso) {
        this.pdf_caso = pdf_caso;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getId_caso() {
        return id_caso;
    }

    public void setId_caso(String id_caso) {
        this.id_caso = id_caso;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public String getId_department() {
        return id_departamento;
    }

    public void setId_department(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getProgreso() {
        return progreso;
    }

    public void setProgreso(String progreso) {
        this.progreso = progreso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }




}
