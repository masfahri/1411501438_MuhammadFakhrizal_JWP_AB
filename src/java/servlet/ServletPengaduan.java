/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anounymous
 */
@WebServlet(name = "ServletPengaduan", urlPatterns = {"/ServletPengaduan"})
public class ServletPengaduan extends HttpServlet {

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
                        out.println("<title>Servlet ServletPengaduan</title>");                        
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Servlet ServletPengaduan at " + request.getContextPath() + "</h1>");
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
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                request.getRequestDispatcher("index.html").include(request, response);  

                        HttpSession session = request.getSession();
                        session.removeAttribute("username");
                        response.sendRedirect("index.html");
                        
                        if (session!=null) {
                                session.invalidate();
                                out.println("<div class='alert' >Salah</div>");
                                RequestDispatcher rs = request.getRequestDispatcher("index.html");

                        }
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        
        
        Pengaduan obj         = new Pengaduan();
        Fungsi_Query query  = new Fungsi_Query();
        String[] kolom      = new String[8];
        String[] isi        = new String[8];

        protected String[] kolom (){
                kolom[0] = "notelp";
                kolom[1] = "napel";
                kolom[2] = "uraian";
                kolom[3] = "pihak";
                kolom[4] = "jabatan";
                kolom[5] = "klarifikasi";
                kolom[6] = "lembaga";
                kolom[7] = "upload";
                return kolom;
        }
        
        protected String[] Data (){
                isi[0] = obj.getNotelp().toString();//notelp
                isi[1] = obj.getNapel().toString();//napel
                isi[2] = obj.getUraian().toString();//uraian
                isi[3] = obj.getPihak().toString();//pihak
                isi[4] = obj.getJabatan().toString();//jabatan
                isi[5] = obj.getKlarifikasi().toString();//klarifikasi
                isi[6] = obj.getLembaga().toString();//lembaga
                isi[7] = obj.getUpload().toString();//upload
                return isi;
        }
        
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                //Input data kedalam Method setNaper, setSiup, setNotelp, setNapem, setAlamat
                obj.setNotelp(request.getParameter("notelp"));
                obj.setNapel(request.getParameter("napel"));
                obj.setUraian(request.getParameter("uraian"));
                obj.setPihak(request.getParameter("pihak"));
                obj.setJabatan(request.getParameter("jabatan"));
                obj.setKlarifikasi(request.getParameter("klarifikasi"));
                obj.setLembaga(request.getParameter("lembaga"));
                obj.setUpload(request.getParameter("upload"));
                
                if (request.getParameter("save") != null) {
                        query.Input(kolom(), Data(), "pengaduan");
                        out.print("<div class='session'><h2>Welcome, </h2></div>");  
                        out.print("SUkses");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                }else if (request.getParameter("search") != null) {
                        String res = query.Search("notelp", request.getParameter("notelp"), "pengaduan");
                        String[] data2 = res.split(",");
                        out.println("isi = "+data2[1]);
                        request.setAttribute("notelp", data2[0]);
                        request.setAttribute("napel", data2[1]);
                        request.setAttribute("uraian", data2[2]);
                        request.setAttribute("pihak", data2[3]);
                        request.setAttribute("jabatan", data2[4]);
                        request.setAttribute("klarifikasi", data2[5]);
                        request.setAttribute("lembaga", data2[6]);
                        request.setAttribute("upload", data2[7]);
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                }else if (request.getParameter("edit") != null) {
                        query.Ubah(kolom(), Data(), "pengaduan", kolom[0], isi[0]);
                        out.print("SUkses");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);


                }else if (request.getParameter("delete") != null) {
                        query.Delete(kolom[0], isi[0], "pengaduan");
                        out.print("SUkses");
                        RequestDispatcher rd = request.getRequestDispatcher("pengaduan.html");
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
