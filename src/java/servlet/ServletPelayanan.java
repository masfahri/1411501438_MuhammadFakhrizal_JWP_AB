package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fuckhrizal
 */
@WebServlet(urlPatterns = {"/ServletPelayanan"})
public class ServletPelayanan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPelayanan</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPelayanan at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Smartcity obj       = new Smartcity();
    Fungsi_Query query  = new Fungsi_Query();
    String[] kolom      = new String [7];
    String[] isi      = new String [7];
    
    protected String[] Kolom() {
        kolom[0] = "sc_nik";
        kolom[1] = "sc_nama";
        kolom[2] = "sc_alamat";
        kolom[3] = "sc_keperluan";
        kolom[4] = "sc_ijazah";
        kolom[5] = "sc_foto";
        kolom[6] = "sc_pengantar";
        return kolom;
    }
    
    protected String[] Data(){
        isi[0] = obj.getSc_nik();
        isi[1] = obj.getSc_nama();
        isi[2] = obj.getSc_alamat();
        isi[3] = obj.getSc_keperluan();
        isi[4] = obj.getSc_ijazah();
        isi[5] = obj.getSc_foto();
        isi[6] = obj.getSc_pengantar();
        return isi;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            obj.setSc_nik(request.getParameter("sc_nik"));
            obj.setSc_nama(request.getParameter("sc_nama"));
            obj.setSc_alamat(request.getParameter("sc_alamat"));
            obj.setSc_keperluan(request.getParameter("sc_keperluan"));
            obj.setSc_ijazah(request.getParameter("sc_ijazah"));
            obj.setSc_foto(request.getParameter("sc_foto"));
            obj.setSc_pengantar(request.getParameter("sc_pengantar"));
            
            if (request.getParameter("save") != null) {
                query.Input(Kolom(), Data(), "smartcity");
                out.println("<div class='alert alert-success'>SUKSES INSERT DATA</span></div> ");
                request.getRequestDispatcher("smartcity.html").include(request, response);

//                response.sendRedirect("smartcity.html");  
            }else if(request.getParameter("search") != null) {
                String hasilcari = query.Search("sc_nik", request.getParameter("sc_nik"), "smartcity");
                String [] data2  = hasilcari.split(",");
                request.setAttribute("sc_nik", data2[0]);
                request.setAttribute("sc_nama", data2[1]);
                request.setAttribute("sc_alamat", data2[2]);
                request.setAttribute("sc_keperluan", data2[3]);
                request.setAttribute("sc_ijazah", data2[4]);
                request.setAttribute("sc_foto", data2[5]);
                request.setAttribute("sc_pengantar", data2[6]);
                RequestDispatcher rd = request.getRequestDispatcher("tpl_smartcity.jsp");
                rd.forward(request, response);
            }else if (request.getParameter("edit") != null) {
                query.Ubah(Kolom(), Data(), "smartcity", kolom[0], isi[0]);
                out.println("<div class='alert alert-success'>SUKSES EDIT DATA</span></div> ");
                request.getRequestDispatcher("smartcity.html").include(request, response);
            }else if (request.getParameter("delete") != null) {
                query.Delete("sc_nik", isi[0], "smartcity");
                out.println("<div class='alert alert-danger'>SUKSES DELETE DATA</span></div> ");
                request.getRequestDispatcher("smartcity.html").include(request, response);
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
