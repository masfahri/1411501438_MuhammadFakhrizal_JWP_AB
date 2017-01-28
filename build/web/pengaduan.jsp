<%-- 
    Document   : pengaduan
    Created on : Dec 16, 2016, 10:36:40 PM
    Author     : Anounymous
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
            <h2>FORM PENGADUAN</h2>
            <form action="ServletPengaduan" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">No telpon pelapor</label>
                    <input name="notelp"  class="form-control" id="exampleInputEmail1" placeholder="No telepon" value="${notelp}">
                    <input style="float: right; margin-top: -34px; padding: 5px;" type="submit" name="search" value="Search">

                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Nama Pelapor</label>
                    <input name="napel" class="form-control" id="exampleInputEmail1" placeholder="Nama Pelapor" value="${napel}">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Uraian</label>
                    <textarea name="uraian" class="form-control" id="exampleInputEmail1" placeholder="Uraian" >${uraian}</textarea>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="exampleInputEmail1">Pihak Terduga</label>
                        <input name="pihak" class="form-control" id="exampleInputEmail1" placeholder="Nama Pelapor" value="${pihak}">
                    </div>
                    <div class="col-md-4">
                        <label for="exampleInputEmail1">Jabatan</label>
                        <input name="jabatan" class="form-control" id="exampleInputEmail1" placeholder="Nama Pelapor" value="${jabatan}">
                    </div>
                    <div class="col-md-4">
                        <label for="exampleInputEmail1">Klarifikasi Jabatan</label>
                        <select name="klarifikasi" class="form-control" value="${klarifikasi}">
                            <option value="">Pilih Jabatan</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div><br>
                <div class="">
                    <div class="">
                        <label for="exampleInputEmail1">Kementrian Lembaga</label>
                        <select name="lembaga" class="form-control">
                            <option value="">Pilih Lembaga</option>
                            <option value="satu">Kemendikbud</option>
                            <option value="dua">Kemnpora</option>
                            <option value="tiga">Kemendagri</option>
                        </select>
                    </div>
                </div><br>
                <div class="">
                    <div class="">
                        <label> Upload Bukti</label>
                        <input type="file" name="upload" class="">
                    </div>
                </div><br>
                <div class="pull-right">
                    <button type="submit" name="delete" class="btn btn-danger">Delete</button>
                    <button type="submit" name="edit" class="btn btn-default">Edit</button>
                </div>
            </form>
        </div>
    </body>
</html>
