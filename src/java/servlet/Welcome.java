package servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
public class Welcome extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.getRequestDispatcher("login.jsp").include(request, response);  
        
        HttpSession session=request.getSession();  
        if(session!=null){  
                String name=(String)session.getAttribute("user");  
        }  
        else{  
            out.print("Please login first");  
            request.getRequestDispatcher("index.html").include(request, response);  
        }  
        out.close();  

      }  
}