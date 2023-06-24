/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TokoBuku;
import java.util.Vector;
import java.sql.*;
/**
 *
 * @author LENOVO
 */
public class GuestBookBean {
    private String name, address, company, email;
    private final Koneksi koneksi = new Koneksi();
    private String pesan;
    private Object[][] list;
    public String getName() {
    return name;
    }
    public void setName(String name) {
    this.name = name;
    }
    public String getAddress() {
    return address;
    }
    public void setAddress(String address) {
    this.address = address;
    }
    public String getCompany() {
    return company;
    }
    public void setCompany(String company) {
    this.company = company;
    }
    public String getEmail() {
    return email;
    }
    public void setEmail(String email) {
    this.email = email;
    }
    
    
    public boolean simpan() {
    boolean adaKesalahan = false;
    Connection connection;
    if ((connection = koneksi.getConnection()) != null) {
    int jumlahSimpan = 0;
    boolean simpan = false;
    Statement sta;
    ResultSet rset;
    try {
    simpan = true;
    String SQLStatemen = "insert into guest_book(name,address,company,email) "
            + "values('" + name + "','" + address + "','" + company + "','" + email + "')";
    sta = connection.createStatement();
    jumlahSimpan = sta.executeUpdate(SQLStatemen);
    if (simpan) {
    if (jumlahSimpan < 1) {
    adaKesalahan = true;
    pesan = "Gagal menyimpan data guest_book";
    System.out.println(pesan);
    }
    } else {
    adaKesalahan = true;
    pesan = "Tidak dapat melakukan koneksi keserver\n" +
   koneksi.getPesanKesalahan();
    System.out.println(pesan);
    }
    } catch (SQLException ex) {
    System.out.println(ex);
    }
    }
    return !adaKesalahan;
    }
    
    public Object[][] listData(int mulai, int jumlah) {
    boolean adaKesalahan = false;
    Connection connection;
    this.email = email;
    if ((connection = koneksi.getConnection()) != null) {
    String SQLStatemen;
    Statement sta;
    ResultSet rset;
    try {
    SQLStatemen = "select * from guest_book limit " + mulai + "," + jumlah + " ";
    sta = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
   ResultSet.CONCUR_READ_ONLY);
    rset = sta.executeQuery(SQLStatemen);
    rset.next();
    rset.last();
    list = new Object[rset.getRow()][];
    rset.first();
    int i = 0;
    do {
    if (!rset.getString("email").equals("")) {
    list[i] = new Object[]{rset.getString("id"), rset.getString("name"),
   rset.getString("address"), rset.getString("company"), rset.getString("email")};
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
    pesan = "Tidak dapat membaca guest_book\n" + ex.getMessage();
    }
    } else {
    adaKesalahan = true;
    pesan = "Tidak dapat melakukan koneksi ke server\n" + koneksi.getPesanKesalahan();
    }
    return list;
 }
}
