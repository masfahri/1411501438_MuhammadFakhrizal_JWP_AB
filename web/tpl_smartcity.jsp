<%-- 
    Document   : tpl_smartcity
    Created on : Jan 29, 2017, 10:26:05 PM
    Author     : fuckhrizal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="panel-pengaduan">
            <center><h2>FORM PELAYANAN</h2></center>
            <form action="ServletPelayanan" method="post" >
                <div class="form-group">
                    <label for="exampleInputEmail1">No Induk Kependudukan</label>
                    <input type="text" value="${sc_nik}" class="form-control" name="sc_nik">
                    <input style="float: right; margin-top: -34px; padding: 5px;" type="submit" name="search" value="Search">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Nama Lengkap</label>
                    <input type="text" value="${sc_nama}" class="form-control" name="sc_nama">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Alamat</label>
                    <textarea name="sc_alamat" value="" class="form-control" id="exampleInputEmail1" placeholder="Alamat Lengkap">${sc_alamat}</textarea>
                </div>
                <div class="">
                    <div class="">
                        <label for="exampleInputEmail1">Pelayanan</label>
                        <select name="sc_keperluan" value="${sc_keperluan}" class="form-control">
                            <option value="${sc_keperluan}">${sc_keperluan}</option>
                        </select>
                    </div>
                </div><br>
                <div class="">
                    <div class="">
                        <label> Upload Ijazah <small>(max < 500kb)</small></label>
                        <input type="file" name="sc_ijazah"  />${sc_ijazah}
                    </div>
                </div><br>
                <div class="">
                    <div class="">
                        <label> Upload Foto <small>(max < 500kb)</small></label>
                        <input type="file" name="sc_foto"  />${sc_foto}
                    </div>
                </div><br>
                <div class="">
                    <div class="">
                        <label> Upload Pengantar <small>(max < 500kb)</small></label>
                        <input type="file" name="sc_pengantar"  />${sc_pengantar}
                    </div>
                </div><br>
                <div class="pull-right">
                    <button type="submit" name="delete" class="btn btn-danger">Delete</button>
                    <button type="submit" name="edit" class="btn btn-default">Edit</button>
                    <button type="submit" name="save" class="btn btn-success">Save</button>
                </div>
            </form>
            <button type="button" name="back" onclick="history.back()">back</button>
            <a type="button"  href="login.jsp">menu</a>
        </div>
    </body>
</html>
