/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
 * @author Anounymous
 */
@WebServlet(name = "ServletCompany", urlPatterns = {"/ServletCompany"})
public class ServletCompany extends HttpServlet {

        /**
         * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
                        out.println("<title>Servlet ServletCompany</title>");                        
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Servlet ServletCompany at " + request.getContextPath() + "</h1>");
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
        
        
        Company obj         = new Company();
        Fungsi_Query query  = new Fungsi_Query();
        String[] kolom      = new String[5];
        String[] isi        = new String[5];

        protected String[] kolom (){
                kolom[0] = "naper";
                kolom[1] = "siup";
                kolom[2] = "notelp";
                kolom[3] = "napem";
                kolom[4] = "alamat";
                return kolom;
        }
        
        protected String[] Data (){
                isi[0] = obj.getNaper();
                isi[1] = obj.getSiup();
                isi[2] = obj.getNotelp();
                isi[3] = obj.getNapem();
                isi[4] = obj.getAlamat();
                return isi;
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                //Input data kedalam Method setNaper, setSiup, setNotelp, setNapem, setAlamat
                obj.setNaper(request.getParameter("naper"));
                obj.setSiup(request.getParameter("siup"));
                obj.setNotelp(request.getParameter("notelp"));
                obj.setNapem(request.getParameter("napem"));
                obj.setAlamat(request.getParameter("alamat"));
                
                if (request.getParameter("save") != null) {
                        query.Input(kolom(), Data(), "company");
                }else if (request.getParameter("search") != null) {
                        String res = query.Search("naper", request.getParameter("naper"), "company");
                        String [] data2 = res.split(",");
                        out.println("isi = "+data2[1]);
                        request.setAttribute("naper", data2[0]);
                        request.setAttribute("siup", data2[1]);
                        request.setAttribute("notelp", data2[2]);
                        request.setAttribute("napem", data2[3]);
                        request.setAttribute("alamat", data2[4]);
                        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
                        rd.forward(request, response);
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
