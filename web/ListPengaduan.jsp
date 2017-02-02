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
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
        <script src="https://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body class="bodd">
       
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
                <div class="table-responsive">
                <table class="table" id="listSiswa">
                <thead>
                    <tr>
                      <th>NIK</th>
                      <th>Nama Lengkap</th>
                      <th>Alamat</th>
                      <th>Keperluan</th>
                      <th>Ijazah</th>
                      <th>Foto</th>
                      <th>Pengantar</th>
                      <th>Aksi</th>
                    </tr>
                  </thead>
                <tbody>
                <%
                    if( rs.next() )
                    {
                        do
                        {%>
                <tr>
                    <td><%=rs.getString("sc_nik")%></td>
                    <td><%=rs.getString("sc_nama")%></td>
                    <td><%=rs.getString("sc_alamat")%></td>
                    <td><%=rs.getString("sc_keperluan")%></td>
                    <td><% if (rs.getString("sc_ijazah") == null) {
                                out.print("<span class='label label-danger'>Belum Upload File</span>");  
                            }else{
                                out.print(rs.getString("sc_ijazah"));
                            }
                        %>
                    </td>
                    <td><% if (rs.getString("sc_foto") == null) {
                                out.print("<span class='label label-danger'>Belum Upload File</span>");  
                            }else{
                                out.print(rs.getString("sc_foto"));
                            }
                        %>
                    </td>
                    
                    <td><% if (rs.getString("sc_pengantar") == null) {
                                out.print("<span class='label label-danger'>Belum Upload File</span>");  
                            }else{
                                out.print(rs.getString("sc_pengantar"));
                            }
                        %>
                    </td>
                    <td><% if (rs.getString("sc_ijazah")== null || rs.getString("sc_pengantar")== null || rs.getString("sc_foto")== null) {
                                out.print("<button type='button' class='btn btn-danger btn-xs disabled'>Data Belum <br>valid</button>");
                            }else{
                                out.print("<button type='button' class='btn btn-success btn-xs'>Cetak Nomor Antrian</button>");
                            }
                        %></td>
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
                </div>
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
            <br>
             <a href="Login" class="pull-right" style="margin-right: 30px;">Logout</a>
    </body>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#listSiswa').DataTable();
        } );
    </script>
</html>
    
