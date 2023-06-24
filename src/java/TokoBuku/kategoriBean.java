/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TokoBuku;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

/**
 *
 * @author LENOVO
 */
public class kategoriBean {
    private String id_kategori, name, description;
    private final Koneksi koneksi = new Koneksi();
    private String pesan;
    private Object[][] list;
    public String getName() {
    return name;
    }
    public String getId_kategori() {
        return id_kategori;
    }
    public void setId_kategori(String id_kategori) {
        this.id_kategori = id_kategori;
    }

    
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String desc) {
        this.description = description;
    }
    public String getPesan() {
        return pesan;
    }
    public void setPesan(String pesan) {
        this.pesan = pesan;
    }
    public Object[][] getList() {
        return list;
    }
    public void setList(Object[][] list) {
        this.list = list;
    }
    
   
    
    public Object[][] listData(int mulai, int jumlah) {
    boolean adaKesalahan = false;
    Connection connection;
    this.description= description;
    if ((connection = koneksi.getConnection()) != null) {
    String SQLStatemen;
    Statement sta;
    ResultSet rset;
    try {
    SQLStatemen = "select * from kategori limit " + mulai + "," + jumlah + " ";
    sta = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
   ResultSet.CONCUR_READ_ONLY);
    rset = sta.executeQuery(SQLStatemen);
    rset.next();
    rset.last();
    list = new Object[rset.getRow()][];
    rset.first();
    int i = 0;
    do {
    if (!rset.getString("description").equals("")) {
        list[i] = new Object[]{rset.getString("id"),
                               rset.getString("name"),
                               rset.getString("description")};
    }
    i++;
    } while (rset.next());
    if (list.length > 0) {
    adaKesalahan = false;
    }
    sta.close();
    rset.close();
    connection.close();
    } catch (SQLException ex) {
    adaKesalahan = true;
    pesan = "Tidak dapat membaca kategori\n" + ex.getMessage();
    }
    } else {
    adaKesalahan = true;
    pesan = "Tidak dapat melakukan koneksi ke server\n" + koneksi.getPesanKesalahan();
    }
    return list;
 }
}
