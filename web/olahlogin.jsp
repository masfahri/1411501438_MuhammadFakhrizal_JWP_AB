<%-- 
    Document   : olahlogin
    Created on : Oct 21, 2016, 13:43:37 PM
    Author     : praktek
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  
  String username = request.getParameter("txtnama");
  String pass = request.getParameter("txtpass");
  
    koneksi konek = new koneksi();
    Connection conn = konek.bukaKoneksi();
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from login where user = '" + username + "' and pass = '" + pass + "'");
    if (rs.next()){
        session.setAttribute("username", username);
        response.sendRedirect("awal.jsp");
    }else{
        
    }
%>
