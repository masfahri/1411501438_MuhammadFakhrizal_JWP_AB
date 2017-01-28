package servlet;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Anounymous
 */
public class Fungsi_Query {
        String driver, database, user, pass;
        public Fungsi_Query() {
                driver   = "com.mysql.jdbc.Driver";
                database = "jdbc:mysql://localhost/belajar";
                user     = "root";
                pass     = "";
        }
        
        String sql="";
        int i;
        public void Input (String[] kolom, String[] isi, String nmtable) {
                try{
                        sql = "INSERT INTO "+nmtable+" (";
                        for (i = 0; i < kolom.length; i++) {
                             sql+=kolom[i]   ;
                                if (i<kolom.length-1) 
                                        sql+=",";
                        }
                        sql+=") VALUES (";
                        for (i = 0; i < kolom.length; i++) {
                             sql+="'"+isi[i]+"'";
                                if (i<kolom.length-1) 
                                        sql+=",";
                        }
                        sql+=")";
                        
                        //PROSES MASUK DATABASE
                        Class.forName(driver);
                        Connection kon   = DriverManager.getConnection(database, user, pass);
                        Statement st     = kon.createStatement();
                        System.out.println(sql);
                        st.executeUpdate(sql);
                        st.close();
                        kon.close();
                        
                }catch(Exception e){
                        System.out.println(e.getMessage());
                }
        }
        
        public void Ubah (String[] kolom, String[] isi, String nmtable, String primarykey, String data) {
                try{
                        sql = "UPDATE "+nmtable+" set ";
                        for (i=0; i<kolom.length;i++) {
                             sql+=kolom[i]+"= '"+isi[i]+"'";
                                if (i<kolom.length-1) 
                                        sql+=",";
                        }
                        sql+="WHERE "+primarykey+" = '"+data+"' ";
                        //PROSES MASUK DATABASE
                        Class.forName(driver);
                        Connection kon   = DriverManager.getConnection(database, user, pass);
                        Statement st     = kon.createStatement();
                        System.out.println(sql);
                        st.executeUpdate(sql);
                        st.close();
                        kon.close();
                        
                }catch(Exception e){
                        System.out.println(e.getMessage());
                }
        }
        
        public void Delete(String primarykey, String data, String nmtable) {
                try {
                        sql = "DELETE FROM "+nmtable+" WHERE "+primarykey+" = '"+data+"' ";
                        //Proses Delete SQL
                        Class.forName(driver);
                        Connection kon = DriverManager.getConnection(database, user, pass);
                        Statement stt  = kon.createStatement();
                        System.out.println(sql);
                        stt.executeUpdate(sql);
                        stt.close();
                        kon.close();
                } catch (Exception e) {
                        System.out.println(e.getMessage());
                }
        }
        
        Pengaduan obj = new Pengaduan();
        public String Search(String primarykey, String isi, String nmtable) {
                String data="";
                try {
                        sql = "SELECT * FROM "+nmtable+" WHERE "+primarykey+"='"+isi+"'";
                        Class.forName(driver);
                        Connection conn = DriverManager.getConnection(database, user, pass);
                        Statement stt   = conn.createStatement();
                        ResultSet rs       = stt.executeQuery(sql);
                        if (rs.next()) {
                                obj.setNotelp(rs.getString(1));
                                obj.setNapel(rs.getString(2));
                                obj.setUraian(rs.getString(3));
                                obj.setPihak(rs.getString(4));
                                obj.setJabatan(rs.getString(5));
                                obj.setKlarifikasi(rs.getString(6));
                                obj.setLembaga(rs.getString(7));
                                obj.setUpload(rs.getString(8));
                        }
                        rs.close();
                        stt.close();
                        conn.close();
                }catch (Exception e) {
                        System.out.println(e.getMessage());
                }
                return obj.getNotelp()+", "+obj.getNapel()+", "+obj.getUraian()+", "+obj.getPihak()+", "+obj.getJabatan()+", "+obj.getKlarifikasi()+", "+obj.getLembaga()+", "+obj.getUpload();
        }
}
