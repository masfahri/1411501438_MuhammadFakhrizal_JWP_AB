<%-- 
    Document   : karyawan
    Created on : Dec 15, 2016, 11:35:50 PM
    Author     : Anounymous
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.management.Query"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
        Connection conn;
        Statement stmt;
        ResultSet rs;
        String ktp, naper, Query;
        String ANJING = "ANJING";
        
%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="menu.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'>        
    </head>
    <body class="bodd">
        <div class="panel-perusahaan">
            <h1>FORM KARYAWAN</h1>
            <form method="post" action="uidControll">
                <div class="form-group">
                    <label>Nama Karyawan : </label>
                    <input class="form-control" type="text" name="nakar">
                    <input style="float: right; margin-top: -34px; padding: 5px;" type="submit" name="search" value="Search">
                </div>
                <div class="form-group">
                    <label>No Siup:</label>
                    <input type="text" name="siup" class="form-control">
                </div>
                <div class="form-group">
                    <label>No Telp Karyawan: </label>
                    <input type="text" name="notelp" class="form-control">
                </div>
                <div class="form-group">
                    <label>Nama Perusahaan: </label>
                    <select class="form-control">
                        <%
                          try {
                             Class.forName("com.mysql.jdbc.Driver");
                             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/belajar");
                             Query = "SELECT * FROM karyawan";
                             stmt = conn.createStatement();
                             rs = stmt.executeQuery(Query);
                             out.print(ANJING);
                                while (rs.next()) {
                                       naper = rs.getString("naper");
                                       ktp = rs.getString("ktp");
                        %>
                        <option value="<%=ktp%>"><%=naper%></option>
                        <%      
                                }
                          }catch(Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label>Alamat: </label>
                    <textarea class="form-control" name="alamat"></textarea>
                </div>
                <button type="submit" name="save" class="btn btn-success">Save</button>
                <button type="submit" name="edit" class="btn btn-default">Edit</button>
                <button type="submit" name="delete" class="btn btn-danger">Delete</button>
            </form>
        </div>
    
    </body>
</html>