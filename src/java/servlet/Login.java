package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;  
import javax.servlet.*;


/**
 *
 * @author Anounymous
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
                        out.println("<title>Servlet Login</title>");                        
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
         protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        
        
        if(Validate.checkUser(user, pass)&& pass.equals("admin")) {            
                out.print("<div class='session'><h2>Welcome, "+pass+"</h2></div>");  
                HttpSession session=request.getSession();  
                session.setAttribute("user",pass);  
                request.getRequestDispatcher("ListPengaduan.jsp").include(request, response);
                
        } else if(Validate.checkUser(user, pass)&& pass.equals("user")) {
           out.print("<div class='session'><h2>Welcome, "+pass+"</h2></div>");  
           HttpSession session=request.getSession();  
           session.setAttribute("user",pass);  
           request.getRequestDispatcher("login.jsp").include(request, response);
        } else {
           out.println("<div class='alert' >Salah</div>");
           RequestDispatcher rs = request.getRequestDispatcher("index.html");
           rs.include(request, response);
        }
        out.close();
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
