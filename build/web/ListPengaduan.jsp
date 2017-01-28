<%-- 
    Document   : ListPengaduan
    Created on : Dec 17, 2016, 11:28:42 AM
    Author     : Anounymous
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="menu.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'>   
        <title>JSP Page</title>
    </head>
    <body class="bodd">
        <a href="Login">Logout</a>
        <div class="panel-list" id="hilang">
            <div class="table-responsive"> 
                <%
                    try {
                        String Host = "jdbc:mysql://localhost:3306/belajar";
                        Connection connection = null;
                        Statement statement = null;
                        ResultSet rs = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection(Host, "root", "");
                        statement = connection.createStatement();
                        String Data = "select * from smartcity";
                        rs = statement.executeQuery(Data);
                %>
                <table class="table">
                <thead>
                    <tr>
                      <th>Notelp</th>
                      <th>Nama Pelapor</th>
                      <th>Uraian</th>
                      <th>Pihak</th>
                      <th>Jabatan</th>
                      <th>Klarifikasi</th>
                      <th>Lembaga</th>
                      <th>upload</th>
                    </tr>
                  </thead>
                <tbody>
                <%
                    if( rs.next() )
                    {
                        do
                        {%>
                <tr>
                    <td><a href="#" onclick="get()"><%=rs.getString("id")%></a></td>
                    <td><%=rs.getString("sc_nik")%></td>
                    <td><%=rs.getString("sc_nama")%></td>
                    <td><%=rs.getString("sc_alamat")%></td>
                    <td><%=rs.getString("sc_keperluan")%></td>
                    <td><%=rs.getString("sc_ijazah")%></td>
                    <td><%=rs.getString("sc_foto")%></td>
                    <td><%=rs.getString("sc_pengantar")%></td>
                </tr>
                        <% }while( rs.next() );
                    }else{%>
                      <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>DATA GADA</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                    <%} %>
                </tbody>
                </table>
                  <%
                        rs.close();
                        statement.close();
                        connection.close();
                        } catch (Exception ex) {
                            out.println("Can't connect to database.");
                        }
                    %>
            </div>
        </div>
    </body>
</html>
